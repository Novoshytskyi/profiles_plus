import 'package:flutter/material.dart';

//? Основной цвет оформления
// const Color mainDesignColor = Colors.blue;
// const Color mainDesignColor = Color.fromARGB(255, 103, 142, 173);
// const Color mainDesignColor = Color.fromARGB(255, 100, 140, 170);
// const Color mainDesignColor = Color.fromARGB(255, 100, 145, 155);
// const Color mainDesignColor = Color.fromARGB(255, 68, 87, 96);
// const Color mainDesignColor = Colors.blueGrey;
// const Color mainDesignColor = Colors.green;

//! Google
// const Color mainDesignColor = Color.fromARGB(255, 77, 208, 225);
// const Color mainDesignColor = Color.fromARGB(255, 0, 172, 193);
// const Color mainDesignColor = Color.fromARGB(255, 0, 151, 167);

const Color mainDesignColor = Color.fromARGB(255, 0, 131, 143); //!+++

// const Color mainDesignColor = Color.fromARGB(255, 0, 188, 212);

// const Color mainDesignColor = Color.fromARGB(255, 96, 125, 139); //++
// const Color mainDesignColor = Color.fromARGB(255, 18, 157, 144); //+

// const Color mainDesignColor = Color.fromARGB(255, 3, 90, 109); //++
// const Color mainDesignColor = Color.fromARGB(255, 1, 67, 79);

//? От Сергея
// const Color mainDesignColor = Color.fromARGB(255, 0, 163, 156); //+++

//? Стиль текста --------------------------------------------------------------
TextStyle textStyleFormField = const TextStyle(
  // fontSize: 20.0, //! Размер текста
  fontSize: 19.0, //! Размер текста НОВЫЙ !!!
  color: Colors.black,
  // color: Colors.red,
  fontStyle: FontStyle.italic, //?
);
//? Стиль текста --------------------------------------------------------------
TextStyle textStyleDrawerAndPopupMenu = const TextStyle(
  // fontSize: 18.0, //! Размер текста
  fontSize: 19.0, //! Размер текста НОВЫЙ !!!
  // color: Colors.blue,
  color: Colors.black,
  // fontStyle: FontStyle.italic, //?
);
//? Стиль вводимого и выводимого текста ---------------------------------------
TextStyle textStyleFormFieldColorBold = const TextStyle(
  // fontSize: 18.0, //! Размер вводимого текста
  fontSize: 19.0, //! Размер текста НОВЫЙ !!!
  // color: Colors.blue[800],
  color: Colors.black,
  fontWeight: FontWeight.w600,
  fontStyle: FontStyle.italic, //?
);

//? Стиль текста меток на полях формы -----------------------------------------
TextStyle labelStyleFormField = const TextStyle(
  // fontSize: 18.0, //! Размер текста
  fontSize: 19.0, //! Размер текста НОВЫЙ !!!
  color: mainDesignColor,
  fontWeight: FontWeight.w700,
  // fontWeight: FontWeight.normal, //?
  // backgroundColor: Colors.white,
);

//? Стиль текста хинта --------------------------------------------------------
// TextStyle hintStyleFormField =
//     TextStyle(fontSize: 18.0, color: Colors.grey[400]);
TextStyle hintStyleFormField = TextStyle(
    fontSize: 19.0, color: Colors.grey[400]); //! Размер текста НОВЫЙ !!!

//! Элемены внешнего вида и оформления ----------------------------------------
const Color backgroundColorOfScreen = Color(0xFFE0E0E0); //? Colors.grey[300]
// const Color backgroundColorOfScreen = Colors.yellowAccent; //
const Color backgroundColorOfCard = Colors.white; //

double heightSizedBoxBetweenFields = 12.0;

//? Отступы внутри полей ввода ------------------------------------------------
// EdgeInsetsGeometry contentPaddingFormField =
//     const EdgeInsets.fromLTRB(12, 16, 12, 16);
// EdgeInsetsGeometry contentPaddingFormField = const EdgeInsets.fromLTRB(14, 14, 14, 14);
EdgeInsetsGeometry contentPaddingFormField = const EdgeInsets.all(15);

//? Параметры бордера ---------------------------------------------------------
const Color errorBorderFormFieldColor = Colors.red;

const double borderRadius = 10.0;

const double borderWidth = 2.0;
const double focusedBorderWidth = 3.0;

//! Процент текста на поля от ширины поля -------------------------------------
double widthFactorFormField = 0.40;

//? Бордер вокруг поля ввода --------------------------------------------------
OutlineInputBorder enabledBorderFormField = const OutlineInputBorder(
  borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
  borderSide: BorderSide(color: mainDesignColor, width: borderWidth),
);

OutlineInputBorder focusedBorderFormField = const OutlineInputBorder(
  borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
  borderSide: BorderSide(color: mainDesignColor, width: focusedBorderWidth),
);

OutlineInputBorder errorBorderFormField = const OutlineInputBorder(
  borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
  borderSide: BorderSide(color: errorBorderFormFieldColor, width: borderWidth),
);

OutlineInputBorder focusedErrorBorderFormField = const OutlineInputBorder(
  borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
  borderSide:
      BorderSide(color: errorBorderFormFieldColor, width: focusedBorderWidth),
);
