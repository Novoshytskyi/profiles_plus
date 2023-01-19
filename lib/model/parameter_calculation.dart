// ignore_for_file: non_constant_identifier_names

import 'dart:math';

// import 'package:flutter/material.dart';
// import 'package:gibka/model/blank.dart';
// import 'package:gibka/model/profile.dart';

// parameter calculation

class ParameterCalculation {
// Конструктор
  ParameterCalculation({
    required this.thicknessStrip,
    required this.widthStrip,
    required this.elasticLimit,
    required this.elasticModulus,
    required this.relativeHardeningModulus,
    required this.profileAngleBetta,
    required this.profileRadius,
    required this.relativeTensileForce,
    required this.frictionCoefficient,
  });

  //? Входные параметры ---------------------------------------
  // blank Parameter
  final String thicknessStrip;
  final String widthStrip;
  final String elasticLimit;
  final String elasticModulus;
  final String relativeHardeningModulus;

  // profile Parameter
  final String profileAngleBetta;
  final String profileRadius;
  final String relativeTensileForce;
  final String frictionCoefficient;
  //? ---------------------------------------------------------

  // Геттер
  // String get stampAngleBetta => _stampAngleBetta;

  //! ////////////////////////////////////////////////////////////////////
  final int _afterDot = 2; // Знаков после точки

  //! Исходные данные =========================================================
  //? Параметры профиля:

  // Толщина полосы H, мм
  late double H = double.tryParse(thicknessStrip)!;

  // Ширина полосы B, мм
  late double B = double.tryParse(widthStrip)!;

  // Радиус изгиба (остаточный), мм
  late double Ro = double.tryParse(profileRadius)! + (H / 2);

  // Угол изгиба, град.//???
  late double BetaO = double.tryParse(profileAngleBetta)!;

  //?--------------------------------------------------------------------------
  //? Свойства материала:

  // Предел текучести материала, МПа
  late double sigmaT = double.tryParse(elasticLimit)!;

  // Модуль упругости материала, МПа
  late double E = double.tryParse(elasticModulus)! * 100000; //! * 100000.00

  // Относительный Модуль упрочнения материала
  late double peOtnosit = double.tryParse(relativeHardeningModulus)!;

  //?--------------------------------------------------------------------------
  //? Оборудование:

  // Коэффициент, учитывающий предварительное растяжение заготовки
  late double sigmaZOtn = double.tryParse(relativeTensileForce)!;

  // Коэффициент трения между заготовкой и концевым захватом
  late double f = double.tryParse(frictionCoefficient)!;

  //! =========================================================================

  // Приватные, внутренние параметры =========================================
  // =========================================================================

  //? Определение вспомогательных параметров ------------------------------------

  // Радиус наибольшего упругого изгиба
  late double Ry = (H * E) / (2 * sigmaT);

  // Остаточная относительная кривизна
  late double fiOstatOtnosit = Ry / Ro;

  // Момент упругого изгиба (наибольший)
  late double Mt = sigmaT * H * H / 6;

  // Коэффициент, учитывающий предварительное растяжение заготовки
  // late final lambda = 1 - sigmaZOtn;

  //! Настройка оборудования ==================================================
  // Определение силы растяжения заготовки
  late final double _Fz = sigmaZOtn * sigmaT * B * H * 0.001; // 0,001 т.к. в кН

  //  Определение силы прижима концевых участков
  late final double _Fp = _Fz / (2 * f);
  //! =========================================================================

  //? Определение относит. изгибающий момент по теореме об упругой разгрузке
  double calcMomentOtnositElasticUnloading({
    required double fiOtnosit,
    required double fiOstatOtnosit,
  }) {
    return fiOtnosit - fiOstatOtnosit;
  }

  //? Зависимости для определения относит. изг. момента #######################
  //? при различных схемах нагружения #########################################

  // Определение относительного изгибающего момента (упр-упр)
  double calcMomentOtnositUU({
    required double fiOtnosit,
    required double lambda,
  }) {
    return fiOtnosit;
  }

  // Определение относительного изгибающего момента (упр-упр-пласт)
  double calcMomentOtnositUUP(
      {required double fiOtnosit,
      required double peOtnosit,
      required double lambda}) {
    double a2 = (2 * fiOtnosit +
            lambda * (1 - peOtnosit) -
            sqrt(pow((2 * fiOtnosit + lambda * (1 - peOtnosit)), 2) -
                (1 - peOtnosit) *
                    (4 * fiOtnosit * fiOtnosit +
                        lambda * lambda * (1 - peOtnosit)))) /
        (2 * fiOtnosit * (1 - peOtnosit));

    // double a1 = 1 - a2;

    double momentOtnositUUP = 3 *
            lambda *
            (1 - peOtnosit) *
            (a2 * a2 - (lambda * lambda) / (4 * fiOtnosit * fiOtnosit)) +
        4 *
            fiOtnosit *
            (pow((1 - a2), 3) +
                peOtnosit * pow(a2, 3) +
                (pow(lambda, 3) * (1 - peOtnosit)) / (8 * pow(fiOtnosit, 3)));

    return momentOtnositUUP;
  }

  // Определение относительного изгибающего момента (пласт-упр-упр-пласт)
  double calcMomentOtnositPUUP(
      {required double fiOtnosit,
      required double peOtnosit,
      required double lambda}) {
    double a2 = (1 -
            peOtnosit +
            fiOtnosit *
                peOtnosit *
                (1 - ((1 - lambda * lambda) / (4 * fiOtnosit * fiOtnosit))) -
            ((1 - lambda * lambda) / (4 * fiOtnosit)) * (1 - 2 * peOtnosit)) /
        (2 * fiOtnosit * peOtnosit + (1 + lambda) * (1 - peOtnosit));

    double a1 = 1 - a2;

    double momentOtnositPUUP =
        4 * fiOtnosit * peOtnosit * (pow(a1, 3) + pow(a2, 3)) +
            (1 - peOtnosit) *
                (3 * (a1 * a1 + lambda * a2 * a2) -
                    (1 + pow(lambda, 3)) / (4 * fiOtnosit * fiOtnosit));

    return momentOtnositPUUP;
  }
  //?##########################################################################
  //! Зависимость отн. изгибающего момента от кривизны изгиба, относительного
  //! упрочнения и относительного растяжения
  //! (ПРИ ВСЕХ ВИДАХ НАПРЯЖЕННО-ДЕФОРМИРОВАННОГО СОСТОЯНИЯ)!!!

  double calcMomentOtnositALL(
      {required double fiOtnosit,
      required double peOtnosit,
      required double sigmaZOtn}) {
    // Коэффициент, учитывающий предварительное растяжение заготовки
    var lambda = 1 - sigmaZOtn;
    // Определение кривизны смены напряженного состояния в полосе при изгибе
    var fiPlastOtnosit = ((1 - peOtnosit) / (2 * peOtnosit)) *
        ((peOtnosit / (1 - peOtnosit)) -
            lambda +
            sqrt(pow((lambda - (peOtnosit / (1 - peOtnosit))), 2) +
                2 *
                    (peOtnosit / (1 - peOtnosit)) *
                    (lambda + 0.5 * (1 + pow(lambda, 2)))));

    if (fiOtnosit <= lambda) {
      return calcMomentOtnositUU(fiOtnosit: fiOtnosit, lambda: lambda);
    } else if (lambda < fiOtnosit && fiOtnosit < fiPlastOtnosit) {
      return calcMomentOtnositUUP(
          fiOtnosit: fiOtnosit, peOtnosit: peOtnosit, lambda: lambda);
    } else if (fiPlastOtnosit <= fiOtnosit) {
      return calcMomentOtnositPUUP(
          fiOtnosit: fiOtnosit, peOtnosit: peOtnosit, lambda: lambda);
    } else {
      return 0.0;
    }
  }

  //?##########################################################################
  //! РЕШЕНИЕ СИСТЕМЫ УРАВНЕНИЙ: ОТН. ИЗГ. МОМЕНТА И УРАВНЕНИЯ УПР. РАЗГРУЗКИ
  //! Кривизна гибки для получения заданной остаточной кривизны
  double calcFiGibkiOtnosit(
      {required double fiOstatOtnosit,
      required double peOtnosit,
      required double sigmaZOtn}) {
    double fiOtnosit = 0.001;
    double MomentOtnosit1;
    double MomentOtnosit2;

    do {
      MomentOtnosit1 = calcMomentOtnositALL(
        fiOtnosit: fiOtnosit,
        peOtnosit: peOtnosit,
        sigmaZOtn: sigmaZOtn,
      );

      MomentOtnosit2 = calcMomentOtnositElasticUnloading(
        fiOtnosit: fiOtnosit,
        fiOstatOtnosit: fiOstatOtnosit,
      );

      fiOtnosit += 0.001;
    } while (MomentOtnosit1 - MomentOtnosit2 >= 0.001);

    return fiOtnosit;
  }

  //?##########################################################################
  //! ПОЛУЧЕНИЕ ЗНАЧЕНИЯ ОТН. ИЗГИБАЮЩЕГО МОМЕНТА == ПРУЖИНЕНИЮ
  double calcMomentGibkiOtnosit(
      {required double fiOstatOtnosit,
      required double peOtnosit,
      required double sigmaZOtn}) {
    return calcFiGibkiOtnosit(
          fiOstatOtnosit: fiOstatOtnosit,
          peOtnosit: peOtnosit,
          sigmaZOtn: sigmaZOtn,
        ) -
        fiOstatOtnosit;
  }

  //?##########################################################################
  // double calcAngleBetta({required double fiOstatOtnosit,
  //     required double peOtnosit,
  //     required double sigmaZOtn,}){
  //       return
  //     }
  //! Расчет радиусов
  double calcRadius({
    required double Ro,
    required double Ry,
    required double H,
    required double fiOstatOtnosit,
    required double peOtnosit,
    required double sigmaZOtn,
  }) {
    return (Ry /
            (fiOstatOtnosit +
                calcMomentGibkiOtnosit(
                    fiOstatOtnosit: fiOstatOtnosit,
                    peOtnosit: peOtnosit,
                    sigmaZOtn: sigmaZOtn))) -
        (H / 2);
  }

  //! Расчет углов
  double calcAngleBetta({
    required double BetaO,
    required double fiOstatOtnosit,
    required double peOtnosit,
    required double sigmaZOtn,
  }) {
    return BetaO *
            (1 +
                (calcMomentGibkiOtnosit(
                        fiOstatOtnosit: fiOstatOtnosit,
                        peOtnosit: peOtnosit,
                        sigmaZOtn: sigmaZOtn) /
                    fiOstatOtnosit)) -
        180 *
            ((calcMomentGibkiOtnosit(
                    fiOstatOtnosit: fiOstatOtnosit,
                    peOtnosit: peOtnosit,
                    sigmaZOtn: sigmaZOtn) /
                fiOstatOtnosit));
  }

  //? /////////////////////////////////////////////////////////////////////////

  //! Концевые захваты (штампы) ===============================================

  //! =========================================================================

  //! Калибрующие ролики ======================================================
  //! =========================================================================

  //? Выходные параметры --------------------------------------
  //! гибка без растяжения
  late String stampAngleBetta = calcAngleBetta(
          BetaO: BetaO,
          fiOstatOtnosit: fiOstatOtnosit,
          peOtnosit: peOtnosit,
          sigmaZOtn: 0.0)
      .toStringAsFixed(_afterDot);
  //! гибка без растяжения
  late String stampRadius = calcRadius(
          Ro: Ro,
          Ry: Ry,
          H: H,
          fiOstatOtnosit: fiOstatOtnosit,
          peOtnosit: peOtnosit,
          sigmaZOtn: 0.0)
      .toStringAsFixed(_afterDot);

  //! гибка с растяжением
  late String rollerAngleBetta = calcAngleBetta(
          BetaO: BetaO,
          fiOstatOtnosit: fiOstatOtnosit,
          peOtnosit: peOtnosit,
          sigmaZOtn: sigmaZOtn)
      .toStringAsFixed(_afterDot);
  //! гибка с растяжением
  late String rollerRadius = calcRadius(
          Ro: Ro,
          Ry: Ry,
          H: H,
          fiOstatOtnosit: fiOstatOtnosit,
          peOtnosit: peOtnosit,
          sigmaZOtn: sigmaZOtn)
      .toStringAsFixed(_afterDot);
  //! сила прижима шампов
  late String stampForce = _Fp.toStringAsFixed(3);
  //! сила растяжения
  late String tensileForce = _Fz.toStringAsFixed(3);
  //? ---------------------------------------------------------

  //? Методы ==================================================================

}

// class ParameterCalculation {
//   late final Blank blank;
//   late final Profile profile;
//   //----------------------------
//   late String _stampAngleBetta;
//   late String _stampRadius;

//   late String _rollerAngleBetta;
//   late String _rollerRadius;

//   late String _stampForce;
//   late String _tensileForce;

//   //? Конструктор
//   ParameterCalculation({required this.blank, required this.profile});

//   // var blank2 = blank;
//   // var z = blank2.elasticLimit.toString();

//   //? Геттеры
//   String get stampAngleBetta => _stampAngleBetta;
//   String? get stampRadius => _stampRadius;
//   String? get rollerAngleBetta => _rollerAngleBetta;
//   String? get rollerRadius => _rollerRadius;
//   String? get stampForce => _stampForce;
//   String? get tensileForce => _tensileForce;
// }

// Profile pp = Profile();
// Blank bb = Blank();
// ParameterCalculation d = ParameterCalculation(blank: bb, profile: pp);
