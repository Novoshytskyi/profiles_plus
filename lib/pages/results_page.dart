// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:profiles_plus/generated/locale_keys.g.dart';
import 'package:profiles_plus/model/parameter_calculation.dart';
import 'package:profiles_plus/styles_colors_borders.dart';

// import 'package:gibka/model/blank.dart';
// import 'package:gibka/model/profile.dart';
// import 'package:gibka/pages/input_data_page_1.dart';

import '../text_labels.dart';

class ResultsPage extends StatelessWidget {
  ResultsPage({Key? key}) : super(key: key);

  // Контроллеры, получение доступа к полям ввода
  final _stampAngleBettaController = TextEditingController();
  final _stampRadiusController = TextEditingController();

  final _rollerAngleBettaController = TextEditingController();
  final _rollerRadiusController = TextEditingController();

  final _stampForceController = TextEditingController();
  final _tensileForceController = TextEditingController();

  // Очистка контроллера после удаления виджета
  void dispose() {
    _stampAngleBettaController.dispose();
    _stampRadiusController.dispose();

    _rollerAngleBettaController.dispose();
    _rollerRadiusController.dispose();

    _stampForceController.dispose();
    _tensileForceController.dispose();
    // super.dispose();
  }

  // Метод конвертации градусов в градусы и минуты
  String toGradMinute(String angle) {
    List<String> angleList = angle.split(RegExp("\\.[ ]*"));
    int grad = int.tryParse(angleList[0])!;
    int min = (int.tryParse(angleList[1])! * 0.60).round();
    return " $grad°$min' ";
  }

  // ParameterCalculation? parameterCalculation; //! +++

  @override
  Widget build(BuildContext context) {
    //! Получение данных с первого экрана =====================================
    RouteSettings settings = ModalRoute.of(context)!.settings;
    final parameterCalculation = settings.arguments as ParameterCalculation;
    //!========================================================================
    //! Пробные значения для передачи в контроллер ======
    // 'Угол между полками'
    // _stampAngleBettaController.text = '11.00°';
    _stampAngleBettaController.text =
        toGradMinute(parameterCalculation.stampAngleBetta);
    // 'Внутренний радиус'
    // _stampRadiusController.text = '22.00 мм';
    _stampRadiusController.text = '${parameterCalculation.stampRadius} мм';
    // 'Угол между полками'
    // _rollerAngleBettaController.text = '33.00°';
    _rollerAngleBettaController.text =
        toGradMinute(parameterCalculation.rollerAngleBetta);
    // 'Внутренний радиус'
    // _rollerRadiusController.text = '44.00 мм';
    _rollerRadiusController.text = '${parameterCalculation.rollerRadius} мм';
    //
    // _stampForceController.text = '11.11 кН';
    _stampForceController.text = '${parameterCalculation.stampForce} кН';
    // _tensileForceController.text = '22.22 кН';
    _tensileForceController.text = '${parameterCalculation.tensileForce} кН';

    //! =================================================
    return Scaffold(
      // key: _scaffoldKeyInputDataForm3,
      backgroundColor: backgroundColorOfScreen, //!
      appBar: AppBar(
        title: Text(LocaleKeys.textAppBar3.tr()),
        // title: Text(textAppBar3),
        centerTitle: true,
        foregroundColor: Colors.white,
        backgroundColor: mainDesignColor,
      ),
      body: ListView(
        // padding: EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 10.0),
        padding: EdgeInsets.all(8.0),
        children: [
          Card(
            color: backgroundColorOfCard,
            elevation: 4.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
              side: BorderSide(color: mainDesignColor, width: 2.0),
            ),
            child: Column(
              children: [
                Container(
                  height: 38.0,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: mainDesignColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10.0),
                      topRight: Radius.circular(10.0),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      LocaleKeys.cardAppBarText7.tr(),
                      // cardAppBarText7,
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                //! _________________________________________________________
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      //?=======================================================
                      TextField(
                        readOnly: true,
                        textAlign: TextAlign.start, //TODO: Удалить?
                        controller: _stampForceController,
                        style: textStyleFormFieldColorBold,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white, // todo: цвет заливки
                          contentPadding: contentPaddingFormField,
                          //---------------------------------------
                          prefix: FractionallySizedBox(
                            alignment: Alignment.centerLeft,
                            widthFactor: widthFactorFormField,
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Text(
                                    resultStampForcePrefixText1,
                                    style: textStyleFormField,
                                  ),
                                ),
                                // todo delete ------------------------------
                                RichText(text: resultStampForcePrefixText2),
                                // Text(
                                //   resultStampForcePrefixText2,
                                //   style: textStyleFormField,
                                // ),
                              ],
                            ),
                          ),
                          prefixStyle: textStyleFormField,
                          //---------------------------------------
                          labelText: LocaleKeys.resultStampForceLabelText.tr(),
                          // labelText: resultStampForceLabelText,
                          labelStyle: labelStyleFormField,
                          //---------------------------------------
                          enabledBorder: enabledBorderFormField,
                          focusedBorder: enabledBorderFormField,
                          //---------------------------------------
                        ),
                      ),
                      //?=======================================================
                      SizedBox(height: heightSizedBoxBetweenFields),
                      //?=======================================================
                      TextField(
                        readOnly: true,
                        textAlign: TextAlign.start, //TODO: Удалить?
                        controller: _tensileForceController,
                        style: textStyleFormFieldColorBold,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white, // todo: цвет заливки
                          contentPadding: contentPaddingFormField,
                          //---------------------------------------
                          prefix: FractionallySizedBox(
                            alignment: Alignment.centerLeft,
                            widthFactor: widthFactorFormField,
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Text(
                                    resultTensileForcePrefixText1,
                                    style: textStyleFormField,
                                  ),
                                ),
                                // todo delete ------------------------------
                                RichText(text: resultTensileForcePrefixText2),
                                // Text(
                                //   resultTensileForcePrefixText2,
                                //   style: textStyleFormField,
                                // ),
                              ],
                            ),
                          ),
                          prefixStyle: textStyleFormField,
                          //---------------------------------------
                          labelText:
                              LocaleKeys.resultTensileForceLabelText.tr(),
                          // labelText: resultTensileForceLabelText,
                          labelStyle: labelStyleFormField,
                          //---------------------------------------
                          enabledBorder: enabledBorderFormField,
                          focusedBorder: enabledBorderFormField,
                          //---------------------------------------
                        ),
                      ),

                      //?=======================================================
                    ],
                  ),
                ),
              ],
            ),
          ),
          //! //////////////////////////////////////////////////////////////////

          Card(
            color: backgroundColorOfCard,
            elevation: 4.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
              side: BorderSide(color: mainDesignColor, width: 2.0),
            ),
            child: Column(
              children: [
                //! _________________________________________________________
                Container(
                  height: 38.0,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: mainDesignColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10.0),
                      topRight: Radius.circular(10.0),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      LocaleKeys.cardAppBarText5.tr(),
                      // cardAppBarText5,
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                //! _________________________________________________________
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      //?=======================================================
                      Image.asset(
                        "assets/images/pic_3.png",
                        fit: BoxFit.fitWidth,
                      ),
                      //?=======================================================
                      SizedBox(height: heightSizedBoxBetweenFields),
                      //?=======================================================
                      TextFormField(
                        readOnly: true,
                        textAlign: TextAlign.start, //TODO: Удалить?
                        controller: _stampAngleBettaController,
                        style: textStyleFormFieldColorBold,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white, // todo: цвет заливки
                          contentPadding: contentPaddingFormField,
                          //---------------------------------------
                          prefix: FractionallySizedBox(
                            alignment: Alignment.centerLeft,
                            widthFactor: widthFactorFormField,
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Text(
                                    stampAngleBettaPrefixText1,
                                    style: textStyleFormField,
                                  ),
                                ),
                                // todo delete ------------------------------
                                RichText(text: stampAngleBettaPrefixText2),
                                // Text(
                                //   stampAngleBettaPrefixText2,
                                //   style: textStyleFormField,
                                // ),
                              ],
                            ),
                          ),
                          prefixStyle: textStyleFormField,
                          //---------------------------------------
                          labelText: LocaleKeys.stampAngleBettaLabelText.tr(),
                          // labelText: stampAngleBettaLabelText,
                          labelStyle: labelStyleFormField,
                          //---------------------------------------
                          enabledBorder: enabledBorderFormField,
                          focusedBorder: enabledBorderFormField,
                          //---------------------------------------
                        ),
                      ),
                      //?=======================================================
                      SizedBox(height: heightSizedBoxBetweenFields),
                      //?=======================================================
                      TextFormField(
                        readOnly: true,
                        controller:
                            _stampRadiusController, //! Изм. назв. переменной
                        style: textStyleFormFieldColorBold,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white, // todo: цвет заливки
                          contentPadding: contentPaddingFormField,
                          //---------------------------------------
                          prefix: FractionallySizedBox(
                            alignment: Alignment.centerLeft,
                            widthFactor: widthFactorFormField,
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Text(
                                    stampRadiusPrefixText1, //! Изм. назв.
                                    style: textStyleFormField,
                                  ),
                                ),
                                // todo delete ------------------------------
                                RichText(text: stampRadiusPrefixText2),
                                // Text(
                                //   stampRadiusPrefixText2, //! Изм. назв. переменной
                                //   style: textStyleFormField,
                                // ),
                              ],
                            ),
                          ),
                          prefixStyle: textStyleFormField,
                          //---------------------------------------
                          labelText: LocaleKeys.stampRadiusLabelText.tr(),
                          // labelText: stampRadiusLabelText,
                          labelStyle: labelStyleFormField,
                          //---------------------------------------
                          enabledBorder: enabledBorderFormField,
                          focusedBorder: enabledBorderFormField,
                          //---------------------------------------
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          //! /////////////////////////////////////////////////////////////////

          Card(
            color: backgroundColorOfCard,
            elevation: 4.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
              side: BorderSide(color: mainDesignColor, width: 2.0),
            ),
            child: Column(
              children: [
                //! _________________________________________________________
                Container(
                  height: 38.0,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: mainDesignColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10.0),
                      topRight: Radius.circular(10.0),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      LocaleKeys.cardAppBarText6.tr(),
                      // cardAppBarText6,
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                //! _________________________________________________________
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      //?=======================================================
                      Image.asset(
                        "assets/images/pic_4.png",
                        fit: BoxFit.fitWidth,
                      ),
                      //?=======================================================
                      SizedBox(height: heightSizedBoxBetweenFields),
                      //?=======================================================
                      TextFormField(
                        readOnly: true,
                        textAlign: TextAlign.start, //TODO: Удалить?
                        controller: _rollerAngleBettaController,
                        style: textStyleFormFieldColorBold,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white, // todo: цвет заливки
                          contentPadding: contentPaddingFormField,
                          //---------------------------------------
                          prefix: FractionallySizedBox(
                            alignment: Alignment.centerLeft,
                            widthFactor: widthFactorFormField,
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Text(
                                    rollerAngleBettaPrefixText1,
                                    style: textStyleFormField,
                                  ),
                                ),
                                // todo delete ------------------------------
                                RichText(text: rollerAngleBettaPrefixText2),
                                // Text(
                                //   rollerAngleBettaPrefixText2,
                                //   style: textStyleFormField,
                                // ),
                              ],
                            ),
                          ),
                          prefixStyle: textStyleFormField,
                          //---------------------------------------
                          labelText: LocaleKeys.rollerAngleBettaLabelText.tr(),
                          // labelText: 'Угол гибки',
                          labelStyle: labelStyleFormField,
                          //---------------------------------------
                          enabledBorder: enabledBorderFormField,
                          focusedBorder: enabledBorderFormField,
                          //---------------------------------------
                        ),
                      ),
                      //?=======================================================
                      SizedBox(height: heightSizedBoxBetweenFields),
                      //?=======================================================
                      TextFormField(
                        readOnly: true,
                        controller:
                            _rollerRadiusController, //! Изм. назв. переменной
                        style: textStyleFormFieldColorBold,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white, // todo: цвет заливки
                          contentPadding: contentPaddingFormField,
                          //---------------------------------------
                          prefix: FractionallySizedBox(
                            alignment: Alignment.centerLeft,
                            widthFactor: widthFactorFormField,
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Text(
                                    rollerRadiusPrefixText1, //! Изм. назв.
                                    style: textStyleFormField,
                                  ),
                                ),
                                // todo delete ------------------------------
                                RichText(text: rollerRadiusPrefixText2),
                                // Text(
                                //   rollerRadiusPrefixText2, //! Изм. назв. переменной
                                //   style: textStyleFormField,
                                // ),
                              ],
                            ),
                          ),
                          prefixStyle: textStyleFormField,
                          //---------------------------------------
                          labelText: LocaleKeys.rollerRadiusLabelText.tr(),
                          // labelText: 'Радиус гибки',
                          labelStyle: labelStyleFormField,
                          //---------------------------------------
                          enabledBorder: enabledBorderFormField,
                          focusedBorder: enabledBorderFormField,
                          //---------------------------------------
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          //?=======================================================
          SizedBox(height: heightSizedBoxBetweenFields - 8),
          //?=======================================================

          Padding(
            padding: EdgeInsets.only(left: 4.0, right: 4.0),
            child: Column(
              children: [
                //? Кнопка Произвести новый расчет =======================
                ElevatedButton(
                  // OutlinedButton(
                  // onPressed: _submitForm,
                  onPressed: () {
                    Navigator.pushNamed(context, '/page1');
                  },
                  style: ButtonStyle(
                    elevation: MaterialStateProperty.all(4.0),
                    backgroundColor: MaterialStateProperty.all(Colors.white),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        side: BorderSide(
                          color: mainDesignColor,
                          width: 2.0,
                        ),
                      ),
                    ),
                  ),

                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          LocaleKeys.routeBackButtonText.tr(),
                          // routeBackButtonText,
                          style: TextStyle(
                            color: mainDesignColor,
                            fontSize: 20.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          //?=======================================================
        ],
      ),
    );
  }
}
