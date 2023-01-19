import 'package:flutter/material.dart';

import 'styles_colors_borders.dart';

const nameApp = 'Profiles U';

const popupMenuItemTextRu = 'Русский язык';
const popupMenuItemTextUk = 'Українська мова';

//? Текст в/на полях --------------------------------------------------------

const symbolDegree = '°';
//=============================================================================
// thicknessStrip
const thicknessStripPrefixText1 = '';
const thicknessStripPrefixText2 = 'H  = ';
const thicknessStripSuffixText = 'мм';
const thicknessStripHintText = '0.00';
//-----------------------------------------------------------------------------
// widthStrip
const widthStripPrefixText1 = '';
const widthStripPrefixText2 = 'B  = ';
const widthStripSuffixText = 'мм';
const widthStripHintText = '00.00';
//=============================================================================
//? material:
// elasticLimit
const elasticLimitPrefixText1 = '';
//!
TextSpan elasticLimitPrefixText2 = TextSpan(
  style: textStyleFormField,
  children: const [
    TextSpan(text: 'σ', style: TextStyle(fontStyle: FontStyle.normal)),
    TextSpan(text: 'т', style: TextStyle(fontSize: 12)),
    TextSpan(text: ' = '),
  ],
);
const elasticLimitSuffixText = 'МПа';
const elasticLimitHintText = '000.00';
//-----------------------------------------------------------------------------
// elasticModulus
const elasticModulusPrefixText1 = '';
const elasticModulusPrefixText2 = 'E  = ';
const elasticModulusSuffixText = '× 10^5 МПа'; //! ∙ ×
const elasticModulusHintText = '0.0';
//-----------------------------------------------------------------------------
// relativeHardeningModulus
const relativeHardeningModulusPrefixText1 = '';
const relativeHardeningModulusPrefixText2 = 'П/E  = ';
const relativeHardeningModulusSuffixText = ' ';
const relativeHardeningModulusHintText = '0.000';
//!============================================================================
// profileAngleBetta
const profileAngleBettaPrefixText1 = '';
const profileAngleBettaPrefixText2 = 'β  = ';
const profileAngleBettaSuffixText = 'град.°';
const profileAngleBettaHintText = '00.00';
//-----------------------------------------------------------------------------
// profileRadius
const profileRadiusPrefixText1 = '';
const profileRadiusPrefixText2 = 'R  = ';
const profileRadiusSuffixText = 'мм';
const profileRadiusHintText = '00.00';
//=============================================================================
//? equipment:
// relativeTensileForce
const relativeTensileForcePrefixText1 = '';
TextSpan relativeTensileForcePrefixText2 = TextSpan(
  style: textStyleFormField,
  // text: 'σ',
  children: const [
    TextSpan(text: 'σ', style: TextStyle(fontStyle: FontStyle.normal)),
    TextSpan(text: 'z', style: TextStyle(fontSize: 12)),
    TextSpan(text: ' / '),
    TextSpan(text: 'σ', style: TextStyle(fontStyle: FontStyle.normal)),
    TextSpan(text: 'т', style: TextStyle(fontSize: 12)),
    TextSpan(text: ' = '),
  ],
);
const relativeTensileForceSuffixText = ' ';
const relativeTensileForceHintText = '0.00';
//-----------------------------------------------------------------------------
// frictionCoefficient
const frictionCoefficientPrefixText1 = '';
const frictionCoefficientPrefixText2 = 'f  = ';
const frictionCoefficientSuffixText = '';
const frictionCoefficientHintText = '0.00';
//=============================================================================
// TensileForce
const resultTensileForcePrefixText1 = '';
TextSpan resultTensileForcePrefixText2 = TextSpan(
  style: textStyleFormField,
  children: const [
    TextSpan(text: 'F'),
    TextSpan(text: 'z', style: TextStyle(fontSize: 12)),
    TextSpan(text: ' = '),
  ],
);

//-----------------------------------------------------------------------------
// StampForce
const resultStampForcePrefixText1 = '';
TextSpan resultStampForcePrefixText2 = TextSpan(
  style: textStyleFormField,
  children: const [
    TextSpan(text: 'F'),
    TextSpan(text: 'п', style: TextStyle(fontSize: 12)),
    TextSpan(text: ' = '),
  ],
);
const resultStampForceSuffixText = 'Н';
//-----------------------------------------------------------------------------
// stampRadius
const stampRadiusPrefixText1 = '';
TextSpan stampRadiusPrefixText2 = TextSpan(
  style: textStyleFormField,
  children: const [
    TextSpan(text: 'R'),
    TextSpan(text: 'ш', style: TextStyle(fontSize: 12)),
    TextSpan(text: ' = '),
  ],
);
const stampRadiusHintText = '00.00';
//-----------------------------------------------------------------------------
// stampAngleBetta
const stampAngleBettaPrefixText1 = '';
TextSpan stampAngleBettaPrefixText2 = TextSpan(
  style: textStyleFormField,
  children: const [
    TextSpan(text: 'β'),
    TextSpan(text: 'ш', style: TextStyle(fontSize: 12)),
    TextSpan(text: ' = '),
  ],
);
const stampAngleBettaHintText = '00.00';
//-----------------------------------------------------------------------------
// rollerRadius
const rollerRadiusPrefixText1 = '';
TextSpan rollerRadiusPrefixText2 = TextSpan(
  style: textStyleFormField,
  children: const [
    TextSpan(text: 'R'),
    TextSpan(text: 'р', style: TextStyle(fontSize: 12)),
    TextSpan(text: ' = '),
  ],
);
const rollerRadiusHintText = '00.00';
//-----------------------------------------------------------------------------
// rollerAngleBetta
const rollerAngleBettaPrefixText1 = '';
TextSpan rollerAngleBettaPrefixText2 = TextSpan(
  style: textStyleFormField,
  children: const [
    TextSpan(text: 'β', style: TextStyle()),
    TextSpan(
        text: 'р',
        style: TextStyle(
          fontSize: 12,
        )),
    TextSpan(text: ' = '),
  ],
);
const rollerAngleBettaHintText = '00.00';
//-----------------------------------------------------------------------------
const contactsDeveloperText = 'Phone, Viber, Telegram: (067) 718-80-06';
//-----------------------------------------------------------------
// literature
const literarySource1 =
    '1.	Новошицкий А. В. Технология изготовления модульных конструкций малотоннажных судов [Текст] : монография / А. В. Новошицкий. – Николаев : издательство Швец В.М., 2021. – 164 с.';
const literarySource2 =
    '2. Декл. пат. 44451А Україна, МПК7 B 21 D 5/00, B 21 D 53/00. Спосіб виготовлення гнутих профілів [Текст] / С. М. Соловйов, А. В. Новошицький ; Національний університет кораблебудування ім. адм. Макарова. – № 2001031674 ; заявл. 12.03.01 ; опубл. 15.02.02, Бюл. № 2.';
const literarySource3 =
    '3. Декл. пат. 43149А Україна, МПК7 B 21 D 5/00, B 21 D 11/20. Розтяжна машина [Текст] / С. М. Соловйов, А. В. Новошицький ; Національний університет кораблебудування ім. адм. Макарова. – № 2001031675 ; заявл. 12.03.01 ; опубл. 15.11.01, Бюл. № 10.';
const literarySource4 =
    '4. Новошицкий А. В. Технология изготовления тонкостенных профильных элементов судовых конструкций [Текст] / А. В. Новошицкий // Зб. наук. пр. НУК. – Миколаїв : Видавництво НУК, 2010. – № 2 (431). – С. 45–52.';
const literarySource5 =
    '5. Новошицкий А. В. Технология изготовления тонкостенных гнутых элементов теплообменных аппаратов ГТУ гибкой с продольным растяжением [Текст] / А. В. Новошицкий // Восточно-Европейский журнал передовых технологий. – 2009. – № 4/5 (40). – С. 42–45.';
const literarySource6 =
    '6. Новошицький А. В. Пружно-пластичний згин штаби з поздовжнім розтягом [Текст] / А. В. Новошицький // 6-й міжнар. симпозіум укр. інженерів-механіків у Львові, 21–23 травня 2003 р. : тези доп. – Л. : Кінпатрі ЛТД, 2003. – С. 39–40.';
