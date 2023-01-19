// ignore_for_filfer_const_constructors_in_immutables, prefer_const_constructors, prefer_const_literals_to_create_immutables

// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_const_constructors_in_immutables, sort_child_properties_last

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:profiles_plus/generated/locale_keys.g.dart';
import 'package:profiles_plus/model/blank.dart';
import 'package:profiles_plus/pages/drawer.dart';
import 'package:profiles_plus/styles_colors_borders.dart';

import '../text_labels.dart';

class InputDataPage1 extends StatefulWidget {
  InputDataPage1({Key? key}) : super(key: key);

  @override
  State<InputDataPage1> createState() => _InputDataPage1State();
}

class _InputDataPage1State extends State<InputDataPage1> {
  // глобальный ключ
  final _formKey = GlobalKey<FormState>();
  // глобальный ключ
  final _scaffoldKeyInputDataForm1 = GlobalKey<ScaffoldState>();
  // валидация полей вызвала ошибку
  bool _validationError = false;

  //? Иконка удаления записи в поле -------------------------------------------
  IconData iconDeleteText = Icons.close_outlined;

  // Размеры суффиксных иконок
  double thicknessStripSuffixIconSize = 0;
  double widthStripSuffixIconSize = 0;
  double elasticLimitSuffixIconSize = 0;
  double elasticModulusSuffixIconSize = 0;
  double relativeHardeningModulusSuffixIconSize = 0;

  // Контроллеры, получение доступа к полям ввода
  final _thicknessStripController = TextEditingController();
  final _widthStripController = TextEditingController();
  final _elasticLimitController = TextEditingController();
  final _elasticModulusController = TextEditingController();
  final _relativeHardeningModulusController = TextEditingController();

  // Очистка контроллера после удаления виджета
  @override
  void dispose() {
    _thicknessStripController.dispose();
    _widthStripController.dispose();
    _elasticLimitController.dispose();
    _elasticModulusController.dispose();
    _relativeHardeningModulusController.dispose();
    super.dispose();
  }

  // Узлы фокусировки
  final _thicknessStripFocus = FocusNode();
  final _widthStripFocus = FocusNode();
  final _elasticLimitFocus = FocusNode();
  final _elasticModulusFocus = FocusNode();
  final _relativeHardeningModulusFocus = FocusNode();

  // Метод перевода фокуса на другое поле ввода
  void _fieldFocusChange(
    BuildContext context,
    FocusNode currentFocus,
    FocusNode nextFocus,
  ) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  // Объект
  Blank blank = Blank();
  //------------------------------------------------------------

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKeyInputDataForm1,
      backgroundColor: backgroundColorOfScreen, //!
      appBar: AppBar(
        //!------------------------------------------------------------
        leading: IconButton(
          // tooltip: 'Открыть меню навигации',
          icon: const Icon(Icons.menu),
          onPressed: () {
            _scaffoldKeyInputDataForm1.currentState!.openDrawer();
          },
        ),
        //!------------------------------------------------------------
        title: Text(LocaleKeys.textAppBar1.tr()),
        // title: Text(textAppBar1),
        centerTitle: true,
        foregroundColor: Colors.white,
        backgroundColor: mainDesignColor,
        automaticallyImplyLeading: false, // откл. стрелки "назад"
        //!------------------------------------------------------------
        actions: [
          PopupMenuButton(
              color: backgroundColorOfCard,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(borderRadius),
                side: BorderSide(color: mainDesignColor, width: 2.0),
              ),
              icon: Icon(Icons.language),
              onSelected: (value) {
                if (value == 'item1') {
                  context.setLocale(Locale('ru'));
                } else if (value == 'item2') {
                  context.setLocale(Locale('uk'));
                }
              },
              itemBuilder: (context) => [
                    PopupMenuItem(
                      value: 'item2',
                      child: Row(
                        children: [
                          Icon(
                            Icons.public,
                            color: mainDesignColor,
                          ),
                          SizedBox(width: 10),
                          Text(
                            popupMenuItemTextUk,
                            // 'Українська мова',
                            style: textStyleDrawerAndPopupMenu,
                          ),
                        ],
                      ),
                    ),
                    PopupMenuItem(
                      value: 'item1',
                      child: Row(
                        children: [
                          Icon(
                            Icons.public,
                            color: mainDesignColor,
                          ),
                          SizedBox(width: 10),
                          Text(
                            popupMenuItemTextRu,
                            // 'Русский язык',
                            style: textStyleDrawerAndPopupMenu,
                          ),
                        ],
                      ),
                    ),
                  ]),
        ],
        //!------------------------------------------------------------
      ),
      //!------------------------------------------------------------
      drawer: myDrawer(context),
      //!------------------------------------------------------------

      // Disable opening the drawer with a swipe gesture.
      drawerEnableOpenDragGesture: true,
      //!------------------------------------------------------------
      body: Form(
        key: _formKey,
        child: ListView(
          // Отступы
          // padding: EdgeInsets.fromLTRB(10.0, 8.0, 10.0, 10.0),
          padding: EdgeInsets.all(8.0),
          children: [
            //?=======================================================

            Card(
              color: backgroundColorOfCard,
              elevation: 4.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(borderRadius),
                side: BorderSide(color: mainDesignColor, width: 2.0),
              ),
              child: Column(
                children: [
                  // SizedBox(height: 20),
                  //! _________________________________________________________
                  Container(
                    height: 38.0,
                    // color: Colors.blue,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: mainDesignColor,
                      // border: Border.all(
                      //   color: Colors.blue,
                      //   width: 1.0,
                      //   style: BorderStyle.solid,
                      // ),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10.0),
                        topRight: Radius.circular(10.0),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        LocaleKeys.cardAppBarText1.tr(),
                        // cardAppBarText1,
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
                        Image.asset(
                          "assets/images/pic_1.png",
                          fit: BoxFit.fitWidth,
                        ),
                        //?=======================================================
                        SizedBox(height: heightSizedBoxBetweenFields - 5),
                        //!=======================================================
                        TextFormField(
                          textAlign: TextAlign.start, //TODO: Удалить?
                          focusNode: _thicknessStripFocus,
                          onFieldSubmitted: (_) {
                            _fieldFocusChange(context, _thicknessStripFocus,
                                _widthStripFocus);
                          },
                          controller: _thicknessStripController,
                          style: textStyleFormFieldColorBold,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white, // todo: цвет заливки
                            contentPadding: contentPaddingFormField,
                            //---------------------------------------
                            labelText: LocaleKeys.thicknessStripLabelText.tr(),
                            // labelText: thicknessStripLabelText,
                            labelStyle: labelStyleFormField,
                            //---------------------------------------
                            hintText: thicknessStripHintText,
                            hintStyle: hintStyleFormField,
                            //---------------------------------------
                            // helperText: 'Формат ввода XX,XX',//TODO: Удалить?
                            // helperStyle: ,
                            //---------------------------------------
                            // prefixIcon: Icon(Icons.ac_unit), //TODO: Удалить?
                            //?---------------------------------------
                            prefix: FractionallySizedBox(
                              alignment: Alignment.centerLeft,
                              widthFactor: widthFactorFormField,
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: Text(
                                      thicknessStripPrefixText1,
                                      style: textStyleFormField,
                                    ),
                                  ),
                                  Text(
                                    thicknessStripPrefixText2,
                                    style: textStyleFormField,
                                  ),
                                ],
                              ),
                            ),
                            prefixStyle: textStyleFormField,
                            //---------------------------------------
                            suffixText: thicknessStripSuffixText,
                            suffixStyle: textStyleFormField,
                            //---------------------------------------
                            suffixIcon: GestureDetector(
                              onTap: () {
                                _thicknessStripController.clear();
                                setState(() {
                                  thicknessStripSuffixIconSize = 0;
                                });
                              },
                              child: Icon(
                                iconDeleteText,
                                color: mainDesignColor,
                                size: thicknessStripSuffixIconSize,
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
                          validator: (value) => _validateThicknessStrip(value),
                          onChanged: (value) {
                            setState(() {
                              _validationError
                                  ? _formKey.currentState!.validate()
                                  : null;
                              if (value.isNotEmpty) {
                                thicknessStripSuffixIconSize = 24.0;
                              } else {
                                thicknessStripSuffixIconSize = 0;
                              }
                            });
                          },
                          onSaved: (value) => blank.thicknessStrip =
                              (value)!.replaceAll(RegExp(r','), '.'),
                        ),
                        //!=======================================================
                        //?=======================================================
                        SizedBox(height: heightSizedBoxBetweenFields),
                        //?=======================================================
                        //!=======================================================
                        TextFormField(
                          focusNode: _widthStripFocus, //! Изм. назв. переменной
                          onFieldSubmitted: (_) {
                            //! Изм. назв. переменной
                            _fieldFocusChange(
                                context, _widthStripFocus, _elasticLimitFocus);
                          },
                          controller:
                              _widthStripController, //! Изм. назв. переменной
                          style: textStyleFormFieldColorBold,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white, // todo: цвет заливки
                            contentPadding: contentPaddingFormField,
                            //---------------------------------------
                            labelText: LocaleKeys.widthStripLabelText
                                .tr(), //! Изм. назв. переменной
                            // widthStripLabelText, //! Изм. назв. переменной
                            labelStyle: labelStyleFormField,
                            //---------------------------------------
                            hintText:
                                widthStripHintText, //! Изм. назв. переменной
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
                                      widthStripPrefixText1, //! Изм. назв. переменной
                                      style: textStyleFormField,
                                    ),
                                  ),
                                  Text(
                                    widthStripPrefixText2, //! Изм. назв. переменной
                                    style: textStyleFormField,
                                  ),
                                ],
                              ),
                            ),
                            prefixStyle: textStyleFormField,
                            //---------------------------------------
                            suffixText: widthStripSuffixText,
                            suffixStyle: textStyleFormField,
                            //---------------------------------------
                            suffixIcon: GestureDetector(
                              onTap: () {
                                _widthStripController
                                    .clear(); //! Изм. назв. переменной
                                setState(() {
                                  widthStripSuffixIconSize =
                                      0; //! Изм. назв. переменной
                                });
                              },
                              child: Icon(
                                iconDeleteText,
                                color: mainDesignColor,
                                size:
                                    widthStripSuffixIconSize, //! Изм. назв. переменной
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
                          validator: (value) => _validateWidthStrip(
                              value), //! Изм. назв. переменной
                          onChanged: (value) {
                            setState(() {
                              _validationError
                                  ? _formKey.currentState!.validate()
                                  : null;
                              if (value.isNotEmpty) {
                                widthStripSuffixIconSize =
                                    24.0; //! Изм. назв. переменной
                              } else {
                                widthStripSuffixIconSize =
                                    0; //! Изм. назв. переменной
                              }
                            });
                          },
                          onSaved: (value) => blank.widthStrip =
                              (value)!.replaceAll(RegExp(r','), '.'),
                        ),
                        //!=======================================================
                        // SizedBox(height: heightSizedBoxBetweenFields),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            //!============================================================================
            //!============================================================================
            //!============================================================================

            Card(
              elevation: 4.0,
              color: backgroundColorOfCard,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(borderRadius),
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
                        LocaleKeys.cardAppBarText2.tr(),
                        // cardAppBarText2,
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
                        // SizedBox(height: heightSizedBoxBetweenFields - 10.00),
                        //!=======================================================
                        TextFormField(
                          focusNode:
                              _elasticLimitFocus, //? Изм. назв. переменной
                          onFieldSubmitted: (_) {
                            //? Изм. назв. переменной
                            _fieldFocusChange(context, _elasticLimitFocus,
                                _elasticModulusFocus);
                          },
                          controller:
                              _elasticLimitController, //? Изм. назв. переменной
                          style: textStyleFormFieldColorBold,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white, // todo: цвет заливки
                            contentPadding: contentPaddingFormField,
                            //---------------------------------------
                            labelText: LocaleKeys.elasticLimitLabelText
                                .tr(), //? Изм. назв. переменной
                            // elasticLimitLabelText, //? Изм. назв. переменной
                            labelStyle: labelStyleFormField,
                            //---------------------------------------
                            hintText:
                                elasticLimitHintText, //? Изм. назв. переменной
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
                                      elasticLimitPrefixText1, //? Изм. назв. переменной
                                      style: textStyleFormField,
                                    ),
                                  ),
                                  // todo delete ------------------------------
                                  RichText(text: elasticLimitPrefixText2),
                                ],
                              ),
                            ),
                            prefixStyle: textStyleFormField,
                            //---------------------------------------
                            suffixText: elasticLimitSuffixText,
                            suffixStyle: textStyleFormField,
                            //---------------------------------------
                            suffixIcon: GestureDetector(
                              onTap: () {
                                _elasticLimitController
                                    .clear(); //? Изм. назв. переменной
                                setState(() {
                                  elasticLimitSuffixIconSize =
                                      0; //? Изм. назв. переменной
                                });
                              },
                              child: Icon(
                                iconDeleteText,
                                color: mainDesignColor,
                                size:
                                    elasticLimitSuffixIconSize, //? Изм. назв. переменной
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
                          validator: (value) => _validateElasticLimit(
                              value), //? Изм. назв. переменной
                          onChanged: (value) {
                            setState(() {
                              _validationError
                                  ? _formKey.currentState!.validate()
                                  : null;
                              if (value.isNotEmpty) {
                                elasticLimitSuffixIconSize =
                                    24.0; //? Изм. назв. переменной
                              } else {
                                elasticLimitSuffixIconSize =
                                    0; //? Изм. назв. переменной
                              }
                            });
                          },
                          onSaved: (value) => blank.elasticLimit =
                              (value)!.replaceAll(RegExp(r','), '.'),
                        ),
                        //!=======================================================
                        SizedBox(height: heightSizedBoxBetweenFields),
                        //!=======================================================
                        TextFormField(
                          focusNode:
                              _elasticModulusFocus, //? Изм. назв. переменной
                          onFieldSubmitted: (_) {
                            //? Изм. назв. переменной
                            _fieldFocusChange(context, _elasticModulusFocus,
                                _relativeHardeningModulusFocus);
                          },
                          controller:
                              _elasticModulusController, //? Изм. назв. переменной
                          style: textStyleFormFieldColorBold,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white, // todo: цвет заливки
                            contentPadding: contentPaddingFormField,
                            //---------------------------------------
                            labelText: LocaleKeys.elasticModulusLabelText
                                .tr(), //? Изм. назв. переменной
                            // elasticModulusLabelText, //? Изм. назв. переменной
                            labelStyle: labelStyleFormField,
                            //---------------------------------------
                            hintText:
                                elasticModulusHintText, //? Изм. назв. переменной
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
                                      elasticModulusPrefixText1, //? Изм. назв. переменной
                                      style: textStyleFormField,
                                    ),
                                  ),
                                  Text(
                                    elasticModulusPrefixText2, //? Изм. назв. переменной
                                    style: textStyleFormField,
                                  ),
                                ],
                              ),
                            ),
                            prefixStyle: textStyleFormField,
                            //---------------------------------------
                            suffixText: elasticModulusSuffixText,
                            suffixStyle: textStyleFormField,
                            //---------------------------------------
                            suffixIcon: GestureDetector(
                              onTap: () {
                                _elasticModulusController
                                    .clear(); //? Изм. назв. переменной
                                setState(() {
                                  elasticModulusSuffixIconSize =
                                      0; //? Изм. назв. переменной
                                });
                              },
                              child: Icon(
                                iconDeleteText,
                                color: mainDesignColor,
                                size:
                                    elasticModulusSuffixIconSize, //? Изм. назв. переменной
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
                          validator: (value) => _validateElasticModulus(
                              value), //? Изм. назв. переменной
                          onChanged: (value) {
                            setState(() {
                              _validationError
                                  ? _formKey.currentState!.validate()
                                  : null;
                              if (value.isNotEmpty) {
                                elasticModulusSuffixIconSize =
                                    24.0; //? Изм. назв. переменной
                              } else {
                                elasticModulusSuffixIconSize =
                                    0; //? Изм. назв. переменной
                              }
                            });
                          },
                          onSaved: (value) => blank.elasticModulus =
                              (value)!.replaceAll(RegExp(r','), '.'),
                          // onSaved: (value) => newUser.phone = value, //TODO: Раскоммент.?
                        ),
                        //!=======================================================
                        SizedBox(height: heightSizedBoxBetweenFields),
                        //!=======================================================
                        TextFormField(
                          focusNode:
                              _relativeHardeningModulusFocus, //? Изм. назв. переменной
                          onFieldSubmitted: (_) {
                            //TODO: Раскомментировать и исправить.
                            //! Изм. назв. переменной
                            // _fieldFocusChange(context, _thicknessFocus, _widthlFocus);
                          },
                          controller:
                              _relativeHardeningModulusController, //? Изм. назв. переменной
                          style: textStyleFormFieldColorBold,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white, // todo: цвет заливки
                            contentPadding: contentPaddingFormField,
                            //---------------------------------------
                            labelText: LocaleKeys
                                .relativeHardeningModulusLabelText
                                .tr(), //? Изм. назв. переменной
                            // relativeHardeningModulusLabelText, //? Изм. назв. переменной
                            labelStyle: labelStyleFormField,
                            //---------------------------------------
                            hintText:
                                relativeHardeningModulusHintText, //? Изм. назв. переменной
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
                                      relativeHardeningModulusPrefixText1, //? Изм. назв. переменной
                                      style: textStyleFormField,
                                    ),
                                  ),
                                  Text(
                                    relativeHardeningModulusPrefixText2, //? Изм. назв. переменной
                                    style: textStyleFormField,
                                  ),
                                ],
                              ),
                            ),
                            prefixStyle: textStyleFormField,
                            //---------------------------------------
                            suffixText: relativeHardeningModulusSuffixText,
                            suffixStyle: textStyleFormField,
                            //---------------------------------------
                            suffixIcon: GestureDetector(
                              onTap: () {
                                _relativeHardeningModulusController
                                    .clear(); //? Изм. назв. переменной
                                setState(() {
                                  relativeHardeningModulusSuffixIconSize =
                                      0; //? Изм. назв. переменной
                                });
                              },
                              child: Icon(
                                iconDeleteText,
                                color: mainDesignColor,
                                size:
                                    relativeHardeningModulusSuffixIconSize, //? Изм. назв. переменной
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
                          validator: (value) =>
                              _validateRelativeHardeningModulus(
                                  value), //? Изм. назв. переменной
                          onChanged: (value) {
                            setState(() {
                              _validationError
                                  ? _formKey.currentState!.validate()
                                  : null;
                              if (value.isNotEmpty) {
                                relativeHardeningModulusSuffixIconSize =
                                    24.0; //? Изм.назв.
                              } else {
                                relativeHardeningModulusSuffixIconSize =
                                    0; //? Изм. назв.
                              }
                            });
                          },
                          onSaved: (value) => blank.relativeHardeningModulus =
                              (value)!.replaceAll(RegExp(r','), '.'),
                          // onSaved: (value) => newUser.phone = value, //TODO: Раскоммент.?
                        ),
                        //!=======================================================
                        // SizedBox(height: heightSizedBoxBetweenFields),
                        //?=======================================================
                      ],
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: heightSizedBoxBetweenFields - 8),

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
                      // backgroundColor:
                      //     MaterialStateProperty.all(Colors.blue[400]),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(borderRadius),
                          side: BorderSide(color: mainDesignColor, width: 2.0),
                        ),
                      ),
                    ),

                    // style: ButtonStyle(
                    //   backgroundColor:
                    //       MaterialStateProperty.all(Colors.blue[400]),
                    //   // backgroundColor: MaterialStateProperty.all(Colors.white),
                    //   shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    //     RoundedRectangleBorder(
                    //       borderRadius: BorderRadius.circular(10.0),
                    //       side: BorderSide(color: Colors.blue, width: 2.0),
                    //     ),
                    //   ),
                    // ),

                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            LocaleKeys.routeButtonText.tr(),
                            // routeButtonText,
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
                  //?=======================================================
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      // _showMessage(
      //     message:
      //         '${blank.thicknessStrip} ${blank.widthStrip} ${blank.elasticLimit} ${blank.elasticModulus} ${blank.relativeHardeningModulus}');
      //! Передача blank на второй экран =================================
      Navigator.pushNamed(context, '/page2', arguments: blank);
      //!=================================================================
      _resetForm(); //? Очистка полей формы
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
      _formKey.currentState!.reset();
      _validationError = false;
      //--------------------------------------
      // Очистка контроллеров
      _thicknessStripController.clear();
      _widthStripController.clear();
      _elasticLimitController.clear();
      _elasticModulusController.clear();
      _relativeHardeningModulusController.clear();
      // Обнуление размеров иконок очистки полей
      thicknessStripSuffixIconSize = 0;
      widthStripSuffixIconSize = 0;
      elasticLimitSuffixIconSize = 0;
      elasticModulusSuffixIconSize = 0;
      relativeHardeningModulusSuffixIconSize = 0;
    });
  }

  String? _validateThicknessStrip(String? value) {
    if (value == null || value.isEmpty || double.tryParse(value) == 0) {
      return LocaleKeys.thicknessStripValidatorText1.tr();
      // return thicknessStripValidatorText1;
    } else if (double.tryParse((value).replaceAll(RegExp(r','), '.')) == null) {
      return LocaleKeys.thicknessStripValidatorText2.tr();
      // return thicknessStripValidatorText2;
    } else if (double.tryParse((value).replaceAll(RegExp(r','), '.'))! < 0) {
      return LocaleKeys.thicknessStripValidatorText3.tr();
      // return thicknessStripValidatorText3;
    } else if (double.tryParse((value).replaceAll(RegExp(r','), '.'))! < 0.1 ||
        double.tryParse((value).replaceAll(RegExp(r','), '.'))! > 6.0) {
      return LocaleKeys.thicknessStripValidatorText4.tr();
      // return thicknessStripValidatorText4;
    } else {
      return null;
    }
  }

  String? _validateWidthStrip(String? value) {
    if (value == null || value.isEmpty || double.tryParse(value) == 0) {
      return LocaleKeys.widthStripValidatorText1.tr();
      // return widthStripValidatorText1;
    } else if (double.tryParse((value).replaceAll(RegExp(r','), '.')) == null) {
      return LocaleKeys.widthStripValidatorText2.tr();
      // return widthStripValidatorText2;
    } else if (double.tryParse((value).replaceAll(RegExp(r','), '.'))! < 0) {
      return LocaleKeys.widthStripValidatorText3.tr();
      // return widthStripValidatorText3;
    } else if (double.tryParse((value).replaceAll(RegExp(r','), '.'))! < 10 ||
        double.tryParse((value).replaceAll(RegExp(r','), '.'))! > 1000) {
      return LocaleKeys.widthStripValidatorText4.tr();
      // return widthStripValidatorText4;
    } else {
      return null;
    }
  }

  String? _validateElasticLimit(String? value) {
    if (value == null || value.isEmpty || double.tryParse(value) == 0) {
      return LocaleKeys.elasticLimitValidatorText1.tr();
      // return elasticLimitValidatorText1;
    } else if (double.tryParse((value).replaceAll(RegExp(r','), '.')) == null) {
      return LocaleKeys.elasticLimitValidatorText2.tr();
      // return elasticLimitValidatorText2;
    } else if (double.tryParse((value).replaceAll(RegExp(r','), '.'))! < 0) {
      return LocaleKeys.elasticLimitValidatorText3.tr();
      // return elasticLimitValidatorText3;
    } else if (double.tryParse((value).replaceAll(RegExp(r','), '.'))! < 50 ||
        double.tryParse((value).replaceAll(RegExp(r','), '.'))! > 350) {
      return LocaleKeys.elasticLimitValidatorText4.tr();
      // return elasticLimitValidatorText4;
    } else {
      return null;
    }
  }

  String? _validateElasticModulus(String? value) {
    if (value == null || value.isEmpty || double.tryParse(value) == 0) {
      return LocaleKeys.elasticModulusValidatorText1.tr();
      // return elasticModulusValidatorText1;
    } else if (double.tryParse((value).replaceAll(RegExp(r','), '.')) == null) {
      return LocaleKeys.elasticModulusValidatorText2.tr();
      // return elasticModulusValidatorText2;
    } else if (double.tryParse((value).replaceAll(RegExp(r','), '.'))! < 0) {
      return LocaleKeys.elasticModulusValidatorText3.tr();
      // return elasticModulusValidatorText3;
    } else if (double.tryParse((value).replaceAll(RegExp(r','), '.'))! < 0.5 ||
        double.tryParse((value).replaceAll(RegExp(r','), '.'))! > 3) {
      return LocaleKeys.elasticModulusValidatorText4.tr();
      // return elasticModulusValidatorText4;
    } else {
      return null;
    }
  }

  String? _validateRelativeHardeningModulus(String? value) {
    if (value == null || value.isEmpty) {
      // if (value == null || value.isEmpty || double.tryParse(value) == 0) {
      return LocaleKeys.relativeHardeningModulusValidatorText1.tr();
      // return relativeHardeningModulusValidatorText1;
    } else if (double.tryParse((value).replaceAll(RegExp(r','), '.')) == null) {
      return LocaleKeys.relativeHardeningModulusValidatorText2.tr();
      // return relativeHardeningModulusValidatorText2;
    } else if (double.tryParse((value).replaceAll(RegExp(r','), '.'))! < 0) {
      return LocaleKeys.relativeHardeningModulusValidatorText3.tr();
      // return relativeHardeningModulusValidatorText3;
    } else if (double.tryParse((value).replaceAll(RegExp(r','), '.'))! > 0.2) {
      return LocaleKeys.relativeHardeningModulusValidatorText4.tr();
      // return relativeHardeningModulusValidatorText4;
    } else {
      return null;
    }
  }
}

// Drawer MyDrawer(context) {
//   return Drawer(
//     child: ListView(
//       padding: EdgeInsets.zero,
//       children: <Widget>[
//         DrawerHeader(
//           padding: EdgeInsets.fromLTRB(12.0, 100.0, 5.0, 10.0),
//           // margin: EdgeInsets.only(top: 48.0),
//           // margin: EdgeInsets.only(top: 23.0),
//           child: Center(
//             child: Text(
//               'Национальный Университет \nКораблестроения',
//               textAlign: TextAlign.center,
//               style: TextStyle(
//                 fontSize: 20.0, //! Размер текста
//                 color: Colors.blue,
//                 fontStyle: FontStyle.italic,
//               ),
//             ),
//           ),
//           decoration: BoxDecoration(
//             // color: Colors.blue,
//             image: DecorationImage(
//               image: AssetImage("assets/images/header1.jpg"),
//               fit: BoxFit.cover,
//               // colorFilter: ColorFilter.linearToSrgbGamma(),
//             ),
//           ),
//         ),
//         //?-------------------------
//         ListTile(
//           leading: Icon(Icons.info_outline, color: mainDesignColor),
//           title: Text(
//             'О приложении',
//             style: textStyleFormField,
//           ),
//           onTap: () {
//             // Navigator.pushNamed(context, '/page3');
//           },
//         ),
//         //?-------------------------
//         Divider(
//           thickness: 1.0,
//           indent: 10.0,
//           endIndent: 10.0,
//           color: mainDesignColor,
//         ),
//         //?-------------------------
//         ListTile(
//           leading: Icon(Icons.web_rounded, color: mainDesignColor),
//           title: Text(
//             'Web site',
//             style: textStyleFormField,
//           ),
//           onTap: () {},
//         ),
//         //?-------------------------
//         ListTile(
//           leading: Icon(Icons.info_outline, color: mainDesignColor),
//           title: Text(
//             'Настройки',
//             style: textStyleFormField,
//           ),
//           onTap: () {},
//         ),
//         //?-------------------------
//         ListTile(
//           leading: Icon(Icons.info_outline, color: mainDesignColor),
//           title: Text(
//             'Facebook',
//             style: textStyleFormField,
//           ),
//           onTap: () {},
//         ),
//         //?-------------------------
//         ListTile(
//           leading: Icon(Icons.info_outline, color: mainDesignColor),
//           title: Text(
//             'Telegram',
//             style: textStyleFormField,
//           ),
//           onTap: () {},
//         ),
//         //?-------------------------
//         ListTile(
//           leading: Icon(Icons.info_outline, color: mainDesignColor),
//           title: Text(
//             'Instagram',
//             style: textStyleFormField,
//           ),
//           onTap: () {},
//         ),
//         //?-------------------------
//         Divider(
//           thickness: 1.0,
//           indent: 10.0,
//           endIndent: 10.0,
//           color: mainDesignColor,
//         ),
//         //?-------------------------

//         ListTile(
//           leading: Icon(Icons.info_outline, color: mainDesignColor),
//           title: Text(
//             'О разработчике',
//             style: textStyleFormField,
//           ),
//           onTap: () {
//             // Navigator.pushNamed(context, '/page4');
//           },
//         ),
//         //?-------------------------
//         ListTile(
//           leading: Icon(Icons.info_outline, color: mainDesignColor),
//           title: Text(
//             'Поделиться',
//             style: textStyleFormField,
//           ),
//           onTap: () {},
//         ),
//         //?-------------------------
//         ListTile(
//           leading: Icon(Icons.info_outline, color: mainDesignColor),
//           title: Text(
//             'Настройки',
//             style: textStyleFormField,
//           ),
//           onTap: () {},
//         ),
//         //?-------------------------
//         Divider(
//           thickness: 1.0,
//           indent: 10.0,
//           endIndent: 10.0,
//           color: mainDesignColor,
//         ),
//         //?-------------------------
//         ListTile(
//           onTap: () {
//             Navigator.of(context).pop();
//           },
//           leading: Icon(
//             Icons.exit_to_app_sharp,
//             color: Colors.red,
//           ),
//           title: Text(
//             'Скрыть',
//             style: textStyleFormField,
//           ),
//         )
//       ],
//     ),
//     //
//     //
//   );
// }
