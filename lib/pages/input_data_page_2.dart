// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:profiles_plus/generated/locale_keys.g.dart';
import 'package:profiles_plus/model/blank.dart';
import 'package:profiles_plus/model/profile.dart';
import 'package:profiles_plus/model/parameter_calculation.dart';
import 'package:profiles_plus/styles_colors_borders.dart';

import '../text_labels.dart';

class InputDataPage2 extends StatefulWidget {
  InputDataPage2({Key? key}) : super(key: key);

  @override
  State<InputDataPage2> createState() => _InputDataPage2State();
}

class _InputDataPage2State extends State<InputDataPage2> {
  // Blank? blank2; //! +++

  // глобальный ключ
  final _formKey2 = GlobalKey<FormState>();
  // глобальный ключ
  final _scaffoldKeyInputDataForm2 = GlobalKey<ScaffoldState>();
  //! валидация полей вызвала ошибку
  bool _validationError = false;

  //? Иконка удаления записи в поле -------------------------------------------
  IconData iconDeleteText = Icons.close_outlined;

  // Размеры суффиксных иконок
  double profileAngleBettaStripSuffixIconSize = 0;
  double profileRadiusSuffixIconSize = 0;
  double relativeTensileForceSuffixIconSize = 0;
  double frictionCoefficientSuffixIconSize = 0;

  //? Заливка цветом полей формы (при заполнении) -----------------------------

  // Контроллеры, получение доступа к полям ввода
  final _profileAngleBettaController = TextEditingController();
  final _profileRadiusController = TextEditingController();
  final _relativeTensileForceController = TextEditingController();
  final _frictionCoefficientController = TextEditingController();

  // Очистка контроллера после удаления виджета
  @override
  void dispose() {
    _profileAngleBettaController.dispose();
    _profileRadiusController.dispose();
    _relativeTensileForceController.dispose();
    _frictionCoefficientController.dispose();
    super.dispose();
  }

  // Узлы фокусировки
  final _profileAngleBettaFocus = FocusNode();
  final _profileRadiusFocus = FocusNode();
  final _relativeTensileForceFocus = FocusNode();
  final _elasticModulusFocus = FocusNode();
  // final _relativeHardeningModulusFocus = FocusNode();

  // Метод перевода фокуса на другое поле ввода
  void _fieldFocusChange(
    BuildContext context,
    FocusNode currentFocus,
    FocusNode nextFocus,
  ) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  //! Объект
  Profile profile = Profile();
  late Blank blank; //! +++
  //------------------------------------------------------------

  @override
  Widget build(BuildContext context) {
    //! Получение данных с первого экрана =====================================
    RouteSettings settings = ModalRoute.of(context)!.settings;
    blank = settings.arguments as Blank;
    //!========================================================================

    return Scaffold(
      key: _scaffoldKeyInputDataForm2,
      backgroundColor: backgroundColorOfScreen, //!
      appBar: AppBar(
        title: Text(LocaleKeys.textAppBar2.tr()),
        // title: Text(textAppBar2),
        centerTitle: true,
        foregroundColor: Colors.white,
        backgroundColor: mainDesignColor,
      ),
      body: Form(
        key: _formKey2,
        child: ListView(
          // Отступы
          // padding: EdgeInsets.fromLTRB(15.0, 8.0, 15.0, 10.0),
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
                        LocaleKeys.cardAppBarText3.tr(),
                        // cardAppBarText3,
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
                          "assets/images/pic_2.png",
                          fit: BoxFit.fitWidth,
                        ),
                        //?=======================================================
                        // SizedBox(height: heightSizedBoxBetweenFields),
                        //!=======================================================
                        TextFormField(
                          textAlign: TextAlign.start, //TODO: Удалить?
                          focusNode: _profileAngleBettaFocus,
                          onFieldSubmitted: (_) {
                            _fieldFocusChange(context, _profileAngleBettaFocus,
                                _profileRadiusFocus);
                          },
                          controller: _profileAngleBettaController,
                          style: textStyleFormFieldColorBold,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white, // todo: цвет заливки
                            contentPadding: contentPaddingFormField,
                            //---------------------------------------
                            labelText:
                                LocaleKeys.profileAngleBettaLabelText.tr(),
                            // labelText: profileAngleBettaLabelText,
                            labelStyle: labelStyleFormField,
                            //---------------------------------------
                            hintText: profileAngleBettaHintText,
                            hintStyle: hintStyleFormField,
                            //---------------------------------------
                            prefix: FractionallySizedBox(
                              alignment: Alignment.centerLeft,
                              widthFactor: widthFactorFormField,
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: Text(
                                      profileAngleBettaPrefixText1,
                                      style: textStyleFormField,
                                    ),
                                  ),
                                  Text(
                                    profileAngleBettaPrefixText2,
                                    style: textStyleFormField,
                                  ),
                                ],
                              ),
                            ),
                            prefixStyle: textStyleFormField,
                            //---------------------------------------
                            suffixText: profileAngleBettaSuffixText,
                            suffixStyle: textStyleFormField,
                            //---------------------------------------
                            suffixIcon: GestureDetector(
                              onTap: () {
                                _profileAngleBettaController.clear();
                                setState(() {
                                  profileAngleBettaStripSuffixIconSize = 0;
                                });
                              },
                              child: Icon(
                                iconDeleteText,
                                color: mainDesignColor,
                                size: profileAngleBettaStripSuffixIconSize,
                              ),
                            ),
                            //---------------------------------------
                            enabledBorder: enabledBorderFormField,
                            focusedBorder: focusedBorderFormField,
                            errorBorder: errorBorderFormField,
                            focusedErrorBorder: focusedErrorBorderFormField,
                            //---------------------------------------
                          ),
                          keyboardType:
                              TextInputType.phone, //! только цифры на клав.
                          validator: (value) =>
                              _validateProfileAngleBetta(value),
                          onChanged: (value) {
                            setState(() {
                              _validationError
                                  ? _formKey2.currentState!.validate()
                                  : null;
                              if (value.isNotEmpty) {
                                profileAngleBettaStripSuffixIconSize = 24.0;
                              } else {
                                profileAngleBettaStripSuffixIconSize = 0;
                              }
                            });
                          },
                          onSaved: (value) => profile.profileAngleBetta =
                              (value)!.replaceAll(RegExp(r','), '.'),
                        ),
                        //!=======================================================
                        //?=======================================================
                        SizedBox(height: heightSizedBoxBetweenFields),
                        //?=======================================================
                        //!=======================================================
                        TextFormField(
                          focusNode:
                              _profileRadiusFocus, //! Изм. назв. переменной
                          onFieldSubmitted: (_) {
                            _fieldFocusChange(context, _profileRadiusFocus,
                                _relativeTensileForceFocus);
                          },
                          controller:
                              _profileRadiusController, //! Изм. назв. переменной
                          style: textStyleFormFieldColorBold,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white, // todo: цвет заливки
                            contentPadding: contentPaddingFormField,
                            //---------------------------------------
                            labelText: LocaleKeys.profileRadiusLabelText
                                .tr(), //! Изм. назв. переменной
                            // profileRadiusLabelText, //! Изм. назв. переменной
                            labelStyle: labelStyleFormField,
                            //---------------------------------------
                            hintText:
                                profileRadiusHintText, //! Изм. назв. переменной
                            hintStyle: hintStyleFormField,
                            //---------------------------------------
                            prefix: FractionallySizedBox(
                              alignment: Alignment.centerLeft,
                              widthFactor: widthFactorFormField,
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: Text(
                                      profileRadiusPrefixText1, //! Изм. назв. переменной
                                      style: textStyleFormField,
                                    ),
                                  ),
                                  Text(
                                    profileRadiusPrefixText2, //! Изм. назв. переменной
                                    style: textStyleFormField,
                                  ),
                                ],
                              ),
                            ),
                            prefixStyle: textStyleFormField,
                            //---------------------------------------
                            suffixText:
                                profileRadiusSuffixText, //! Изм. назв. переменной
                            suffixStyle: textStyleFormField,
                            //---------------------------------------
                            suffixIcon: GestureDetector(
                              onTap: () {
                                _profileRadiusController.clear(); //! Изм. назв.
                                setState(() {
                                  profileRadiusSuffixIconSize =
                                      0; //! Изм. назв.
                                });
                              },
                              child: Icon(
                                iconDeleteText,
                                color: mainDesignColor,
                                size:
                                    profileRadiusSuffixIconSize, //! Изм. назв. переменной
                              ),
                            ),
                            //---------------------------------------
                            enabledBorder: enabledBorderFormField,
                            focusedBorder: focusedBorderFormField,
                            errorBorder: errorBorderFormField,
                            focusedErrorBorder: focusedErrorBorderFormField,
                            //---------------------------------------
                          ),
                          keyboardType:
                              TextInputType.phone, // только цифры на клав.
                          validator: (value) => _validateProfileRadius(
                              value), //! Изм. назв. переменной
                          onChanged: (value) {
                            setState(() {
                              _validationError
                                  ? _formKey2.currentState!.validate()
                                  : null;
                              if (value.isNotEmpty) {
                                profileRadiusSuffixIconSize =
                                    24.0; //! Изм. назв. переменной
                              } else {
                                profileRadiusSuffixIconSize =
                                    0; //! Изм. назв. переменной
                              }
                            });
                          },
                          onSaved: (value) => profile.profileRadius =
                              (value)!.replaceAll(RegExp(r','), '.'),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            //!=======================================================
            // SizedBox(height: heightSizedBoxBetweenFields - 5),
            //?=======================================================
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
                        LocaleKeys.cardAppBarText4.tr(),
                        // cardAppBarText4,
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
                        //!=======================================================
                        TextFormField(
                          focusNode:
                              _relativeTensileForceFocus, //? Изм. назв. переменной
                          onFieldSubmitted: (_) {
                            //? Изм. назв. переменной
                            _fieldFocusChange(
                                context,
                                _relativeTensileForceFocus,
                                _elasticModulusFocus);
                          },
                          controller:
                              _relativeTensileForceController, //? Изм. назв. переменной
                          style: textStyleFormFieldColorBold,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white, // todo: цвет заливки
                            contentPadding: contentPaddingFormField,
                            //---------------------------------------
                            labelText: LocaleKeys.relativeTensileForceLabelText
                                .tr(), //? Изм. назв. переменной
                            // relativeTensileForceLabelText, //? Изм. назв. переменной
                            labelStyle: labelStyleFormField,
                            //---------------------------------------
                            hintText:
                                relativeTensileForceHintText, //? Изм. назв. переменной
                            hintStyle: hintStyleFormField,
                            //---------------------------------------
                            prefix: FractionallySizedBox(
                              alignment: Alignment.centerLeft,
                              widthFactor: widthFactorFormField,
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: Text(
                                      relativeTensileForcePrefixText1, //? Изм. назв. переменной
                                      style: textStyleFormField,
                                    ),
                                  ),
                                  // todo delete ------------------------------
                                  RichText(
                                      text: relativeTensileForcePrefixText2),
                                ],
                              ),
                            ),
                            prefixStyle: textStyleFormField,
                            //---------------------------------------
                            suffixText: relativeTensileForceSuffixText,
                            suffixStyle: textStyleFormField,
                            //---------------------------------------
                            suffixIcon: GestureDetector(
                              onTap: () {
                                _relativeTensileForceController
                                    .clear(); //? Изм. назв. переменной
                                setState(() {
                                  relativeTensileForceSuffixIconSize =
                                      0; //? Изм. назв. переменной
                                });
                              },
                              child: Icon(
                                iconDeleteText,
                                color: mainDesignColor,
                                size:
                                    relativeTensileForceSuffixIconSize, //? Изм. назв. переменной
                              ),
                            ),
                            //---------------------------------------
                            enabledBorder: enabledBorderFormField,
                            focusedBorder: focusedBorderFormField,
                            errorBorder: errorBorderFormField,
                            focusedErrorBorder: focusedErrorBorderFormField,
                            //---------------------------------------
                          ),
                          keyboardType:
                              TextInputType.phone, // только цифры на клав.
                          validator: (value) => _validateRelativeTensileForce(
                              value), //? Изм. назв. переменной
                          onChanged: (value) {
                            setState(() {
                              _validationError
                                  ? _formKey2.currentState!.validate()
                                  : null;
                              if (value.isNotEmpty) {
                                relativeTensileForceSuffixIconSize =
                                    24.0; //? Изм. назв. переменной
                              } else {
                                relativeTensileForceSuffixIconSize =
                                    0; //? Изм. назв. переменной
                              }
                            });
                          },
                          onSaved: (value) => profile.relativeTensileForce =
                              (value)!.replaceAll(RegExp(r','), '.'),
                          // onSaved: (value) => newUser.phone = value, //TODO: Раскоммент.?
                        ),
                        //!=======================================================
                        SizedBox(height: heightSizedBoxBetweenFields),
                        //!=======================================================
                        TextFormField(
                          focusNode:
                              _elasticModulusFocus, //? Изм. назв. переменной
                          // onFieldSubmitted: (_) {
                          //   //? Изм. назв. переменной
                          //   _fieldFocusChange(context, _elasticModulusFocus,
                          //       _relativeHardeningModulusFocus);
                          // },
                          controller:
                              _frictionCoefficientController, //? Изм. назв. переменной
                          style: textStyleFormFieldColorBold,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white, // todo: цвет заливки
                            contentPadding: contentPaddingFormField,
                            //---------------------------------------
                            labelText: LocaleKeys.frictionCoefficientLabelText
                                .tr(), //? Изм. назв. переменной
                            // frictionCoefficientLabelText, //? Изм. назв. переменной
                            labelStyle: labelStyleFormField,
                            //---------------------------------------
                            hintText:
                                frictionCoefficientHintText, //? Изм. назв. переменной
                            hintStyle: hintStyleFormField,
                            //---------------------------------------
                            prefix: FractionallySizedBox(
                              alignment: Alignment.centerLeft,
                              widthFactor: widthFactorFormField,
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: Text(
                                      frictionCoefficientPrefixText1, //? Изм. назв. переменной
                                      style: textStyleFormField,
                                    ),
                                  ),
                                  Text(
                                    frictionCoefficientPrefixText2, //? Изм. назв. переменной
                                    style: textStyleFormField,
                                  ),
                                ],
                              ),
                            ),
                            prefixStyle: textStyleFormField,
                            //---------------------------------------
                            suffixText: frictionCoefficientSuffixText,
                            suffixStyle: textStyleFormField,
                            //---------------------------------------
                            suffixIcon: GestureDetector(
                              onTap: () {
                                _frictionCoefficientController
                                    .clear(); //? Изм. назв. переменной
                                setState(() {
                                  frictionCoefficientSuffixIconSize =
                                      0; //? Изм. назв. переменной
                                });
                              },
                              child: Icon(
                                iconDeleteText,
                                color: mainDesignColor,
                                size:
                                    frictionCoefficientSuffixIconSize, //? Изм. назв. переменной
                              ),
                            ),
                            //---------------------------------------
                            enabledBorder: enabledBorderFormField,
                            focusedBorder: focusedBorderFormField,
                            errorBorder: errorBorderFormField,
                            focusedErrorBorder: focusedErrorBorderFormField,
                            //---------------------------------------
                          ),
                          keyboardType:
                              TextInputType.phone, // только цифры на клав.
                          validator: (value) => _validateFrictionCoefficient(
                              value), //? Изм. назв. переменной
                          onChanged: (value) {
                            setState(() {
                              _validationError
                                  ? _formKey2.currentState!.validate()
                                  : null;
                              if (value.isNotEmpty) {
                                frictionCoefficientSuffixIconSize =
                                    24.0; //? Изм. назв. переменной
                              } else {
                                frictionCoefficientSuffixIconSize =
                                    0; //? Изм. назв. переменной
                              }
                            });
                          },
                          onSaved: (value) => profile.frictionCoefficient =
                              (value)!.replaceAll(RegExp(r','), '.'),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            //!=======================================================
            SizedBox(height: heightSizedBoxBetweenFields - 8),
            //!=======================================================

            //!=======================================================
            // SizedBox(height: heightSizedBoxBetweenFields),
            //?=======================================================
            Padding(
              padding: EdgeInsets.only(left: 4.0, right: 4.0),
              child: Column(
                children: [
                  //? Кнопка Произвести расчет =============================
                  ElevatedButton(
                    // onPressed: _submitForm,
                    onPressed: () {
                      _submitForm();
                    },
                    // style: ButtonStyle(
                    //   backgroundColor: MaterialStateProperty.all(Colors.blue),
                    //   shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    //     RoundedRectangleBorder(
                    //       borderRadius: BorderRadius.circular(10.0),
                    //       side: BorderSide(color: Colors.blue, width: 2.0),
                    //     ),
                    //   ),
                    // ),
                    style: ButtonStyle(
                      elevation: MaterialStateProperty.all(4.0),
                      backgroundColor:
                          MaterialStateProperty.all(mainDesignColor),
                      // backgroundColor: MaterialStateProperty.all(Colors.white),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          side: BorderSide(color: mainDesignColor, width: 2.0),
                        ),
                      ),
                    ),

                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            LocaleKeys.calculationButtonText.tr(),
                            // calculationButtonText,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              // color: Colors.blue[800],
                              fontSize: 20.0,
                            ),
                          ),
                          Icon(
                            Icons.arrow_right_alt_outlined,
                            // color: Colors.blue,
                            color: Colors.white,
                          )
                        ],
                      ),
                    ),
                  ),
                  //?=======================================================
                  SizedBox(height: heightSizedBoxBetweenFields - 4),
                  //? Кнопка Сброс =========================================
                  ElevatedButton(
                    // OutlinedButton(
                    // onPressed: _submitForm,
                    onPressed: () {
                      _resetForm();
                    },
                    style: ButtonStyle(
                      elevation: MaterialStateProperty.all(4.0),
                      backgroundColor: MaterialStateProperty.all(Colors.white),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          side: BorderSide(color: mainDesignColor, width: 2.0),
                        ),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            LocaleKeys.resetButtonText.tr(),
                            // resetButtonText,
                            style: TextStyle(
                              color: mainDesignColor,
                              fontSize: 20.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  //?----------------------------------------
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _submitForm() {
    if (_formKey2.currentState!.validate()) {
      _formKey2.currentState!.save();
      // _showMessage(message: 'Ok!');
      //? ****************************************************************
      //? Создание объекта и передача его на 3-й экран
      //
      ParameterCalculation parameterCalculation = ParameterCalculation(
        thicknessStrip: blank.thicknessStrip,
        widthStrip: blank.widthStrip,
        elasticLimit: blank.elasticLimit,
        elasticModulus: blank.elasticModulus,
        relativeHardeningModulus: blank.relativeHardeningModulus,
        profileAngleBetta: profile.profileAngleBetta,
        profileRadius: profile.profileRadius,
        relativeTensileForce: profile.relativeTensileForce,
        frictionCoefficient: profile.frictionCoefficient,
      );
      //? ****************************************************************
      //! Передача blank на второй экран =================================
      // Navigator.pushNamed(context, '/page3', arguments: {blank, profile});
      Navigator.pushNamed(context, '/page3', arguments: parameterCalculation);
      //!=================================================================
      _resetForm(); //? Очистка полей формы
      // parameterCalculation.;
    } else {
      _validationError = true;
      //! _showMessage(message: 'Расчет не возможен. \nВведите все данные.');
    }
  }

  void _resetForm() {
    // В данном случае переход на этщт же экран
    // Navigator.popAndPushNamed(context, '/page1');
    // Navigator.pushReplacementNamed(context, '/page1');

    // Очистка выбранных значений и отмена заливки полей ввода
    setState(() {
      // Очистка текущего состояния
      _formKey2.currentState!.reset();
      _validationError = false;
      //--------------------------------------
      // Очистка контроллеров
      _profileAngleBettaController.clear();
      _profileRadiusController.clear();
      _relativeTensileForceController.clear();
      _frictionCoefficientController.clear();

      // Обнуление размеров иконок очистки полей
      profileAngleBettaStripSuffixIconSize = 0;
      profileRadiusSuffixIconSize = 0;
      relativeTensileForceSuffixIconSize = 0;
      frictionCoefficientSuffixIconSize = 0;
    });
  }

  String? _validateProfileAngleBetta(String? value) {
    if (value == null || value.isEmpty || double.tryParse(value) == 0) {
      return LocaleKeys.profileAngleBettaValidatorText1.tr();
      // return profileAngleBettaValidatorText1;
    } else if (double.tryParse((value).replaceAll(RegExp(r','), '.')) == null) {
      return LocaleKeys.profileAngleBettaValidatorText2.tr();
      // return profileAngleBettaValidatorText2;
    } else if (double.tryParse((value).replaceAll(RegExp(r','), '.'))! < 0) {
      return LocaleKeys.profileAngleBettaValidatorText3.tr();
      // return profileAngleBettaValidatorText3;
    } else if (double.tryParse((value).replaceAll(RegExp(r','), '.'))! < 5 ||
        double.tryParse((value).replaceAll(RegExp(r','), '.'))! > 175) {
      return LocaleKeys.profileAngleBettaValidatorText4.tr();
      // return profileAngleBettaValidatorText4;
    } else {
      return null;
    }
  }

  String? _validateProfileRadius(String? value) {
    if (value == null || value.isEmpty || double.tryParse(value) == 0) {
      return LocaleKeys.profileRadiusValidatorText1.tr();
      // return profileRadiusValidatorText1;
    } else if (double.tryParse((value).replaceAll(RegExp(r','), '.')) == null) {
      return LocaleKeys.profileRadiusValidatorText2.tr();
      // return profileRadiusValidatorText2;
    } else if (double.tryParse((value).replaceAll(RegExp(r','), '.'))! < 0) {
      return LocaleKeys.profileRadiusValidatorText3.tr();
      // return profileRadiusValidatorText3;
    } else if (double.tryParse((value).replaceAll(RegExp(r','), '.'))! <
        (5.0 * double.tryParse(blank.thicknessStrip)!)) {
      return LocaleKeys.profileRadiusValidatorText4.tr();
      // return profileRadiusValidatorText4;
    } else {
      return null;
    }
  }

  String? _validateRelativeTensileForce(String? value) {
    if (value == null || value.isEmpty) {
      return LocaleKeys.relativeTensileForceValidatorText1.tr();
      // return relativeTensileForceValidatorText1;
    } else if (double.tryParse((value).replaceAll(RegExp(r','), '.')) == null) {
      return LocaleKeys.relativeTensileForceValidatorText2.tr();
      // return relativeTensileForceValidatorText2;
    } else if (double.tryParse((value).replaceAll(RegExp(r','), '.'))! < 0) {
      return LocaleKeys.relativeTensileForceValidatorText3.tr();
      // return relativeTensileForceValidatorText3;
    } else if (double.tryParse((value).replaceAll(RegExp(r','), '.'))! > 0.99) {
      return LocaleKeys.relativeTensileForceValidatorText4.tr();
      // return relativeTensileForceValidatorText4;
    } else {
      return null;
    }
  }

  String? _validateFrictionCoefficient(String? value) {
    if (value == null || value.isEmpty || double.tryParse(value) == 0) {
      return LocaleKeys.frictionCoefficientValidatorText1.tr();
      // return frictionCoefficientValidatorText1;
    } else if (double.tryParse((value).replaceAll(RegExp(r','), '.')) == null) {
      return LocaleKeys.frictionCoefficientValidatorText2.tr();
      // return frictionCoefficientValidatorText2;
    } else if (double.tryParse((value).replaceAll(RegExp(r','), '.'))! < 0) {
      return LocaleKeys.frictionCoefficientValidatorText3.tr();
      // return frictionCoefficientValidatorText3;
    } else if (double.tryParse((value).replaceAll(RegExp(r','), '.'))! < 0.05 ||
        double.tryParse((value).replaceAll(RegExp(r','), '.'))! > 0.25) {
      return LocaleKeys.frictionCoefficientValidatorText4.tr();
      // return frictionCoefficientValidatorText4;
    } else {
      return null;
    }
  }

  // void _showMessage({String? message}) {
  //   _scaffoldKeyInputDataForm2.currentState!.showSnackBar(
  //     SnackBar(
  //       duration: Duration(seconds: 2),
  //       backgroundColor: Colors.red, // todo: цвет изменить
  //       content: Text(
  //         message as String,
  //         style: TextStyle(
  //           color: Colors.black, // todo:
  //           fontWeight: FontWeight.w600, // todo:
  //           fontSize: 18.0, // todo:
  //         ),
  //       ),
  //     ),
  //   );
  // }
}

//!============================================================================

// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors

// import 'package:flutter/material.dart';
// import 'package:gibka/model/blank.dart';

// class InputDataPage2 extends StatefulWidget {
//   InputDataPage2({Key? key}) : super(key: key);

//   @override
//   State<InputDataPage2> createState() => _InputDataPage2State();
// }

// class _InputDataPage2State extends State<InputDataPage2> {
//   Blank? blank2; //! +++
//   @override
//   Widget build(BuildContext context) {
//     //! Получение данных с первого экрана =====================================
//     RouteSettings settings = ModalRoute.of(context)!.settings;
//     final blank2 = settings.arguments as Blank;
//     //!========================================================================
//     // return Container();
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('User Info'),
//         centerTitle: true,
//         leading: InkWell(
//           onTap: () {
//             Navigator.pushNamed(context, '/page1');
//           },
//           child: Icon(
//             Icons.arrow_back,
//             // color: Colors.black54,
//           ),
//         ),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(25.0),
//         child: Column(
//           children: [
//             Row(
//               children: [
//                 const Icon(Icons.ac_unit, color: Colors.blue),
//                 SizedBox(width: 20),
//                 Text('${blank2.thicknessStrip}',
//                     style: TextStyle(fontSize: 22, color: Colors.red)),
//               ],
//             ),
//             SizedBox(height: 20),
//             Row(
//               children: [
//                 const Icon(Icons.ac_unit, color: Colors.blue),
//                 SizedBox(width: 20),
//                 Text('${blank2.widthStrip}',
//                     style: TextStyle(fontSize: 22, color: Colors.red)),
//               ],
//             ),
//             SizedBox(height: 20),
//             Row(
//               children: [
//                 const Icon(Icons.ac_unit, color: Colors.blue),
//                 SizedBox(width: 20),
//                 Text('${blank2.elasticLimit}',
//                     style: TextStyle(fontSize: 22, color: Colors.red)),
//               ],
//             ),
//             SizedBox(height: 20),
//             Row(
//               children: [
//                 const Icon(Icons.ac_unit, color: Colors.blue),
//                 SizedBox(width: 20),
//                 Text('${blank2.elasticModulus}',
//                     style: TextStyle(fontSize: 22, color: Colors.red)),
//               ],
//             ),
//             SizedBox(height: 20),
//             Row(
//               children: [
//                 const Icon(Icons.ac_unit, color: Colors.blue),
//                 SizedBox(width: 20),
//                 Text('${blank2.relativeHardeningModulus}',
//                     style: TextStyle(fontSize: 22, color: Colors.red)),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
