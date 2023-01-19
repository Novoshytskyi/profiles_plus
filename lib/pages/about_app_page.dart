// ignore_for_file: prefer_const_constructors

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:profiles_plus/generated/locale_keys.g.dart';
import 'package:profiles_plus/styles_colors_borders.dart';
import 'package:profiles_plus/text_labels.dart';

class AboutAppPage extends StatelessWidget {
  const AboutAppPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: backgroundColorOfScreen,
        appBar: AppBar(
          backgroundColor: mainDesignColor,
          title: Text(
            LocaleKeys.textAppBar4.tr(),
          ),
          centerTitle: true,
          leading: InkWell(
            onTap: () {
              Navigator.pushNamed(context, '/page1');
            },
            child: Icon(
              Icons.arrow_back,
              // color: Colors.black54,
            ),
          ),
        ),
        body: GestureDetector(
          onHorizontalDragStart: (details) {
            Navigator.pushNamed(context, '/page1');
          },
          child: ListView(
            padding: EdgeInsets.all(8.0),
            children: [
              Card(
                color: backgroundColorOfCard,
                elevation: 4.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(borderRadius),
                  side: BorderSide(color: mainDesignColor, width: 2.0),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          SizedBox(height: heightSizedBoxBetweenFields),

                          Image.asset(
                            "assets/images/logo.png",
                            fit: BoxFit.fitWidth,
                            height: 85.0,
                          ),

                          SizedBox(height: heightSizedBoxBetweenFields - 5),

                          Text(
                            nameApp,
                            style: TextStyle(
                              color: mainDesignColor,
                              fontSize: 26.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          // SizedBox(height: heightSizedBoxBetweenFields - 5),

                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              LocaleKeys.aboutAppText1.tr(),
                              textAlign: TextAlign.justify,
                              style: TextStyle(
                                fontSize: 18,
                                fontStyle: FontStyle.italic,
                              ),
                            ),
                          ),

                          SizedBox(height: heightSizedBoxBetweenFields - 5),

                          Padding(
                            padding:
                                const EdgeInsets.only(left: 8.0, right: 8.0),
                            child: Image.asset(
                              "assets/images/prozes.png",
                              // fit: BoxFit.fitWidth,
                              // height: 180.0,
                            ),
                          ),

                          SizedBox(height: heightSizedBoxBetweenFields - 5),

                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              LocaleKeys.aboutAppText2.tr(),
                              textAlign: TextAlign.justify,
                              style: TextStyle(
                                fontSize: 18,
                                fontStyle: FontStyle.italic,
                              ),
                            ),
                          ),

                          Image.asset(
                            "assets/images/profil_1.png",
                            fit: BoxFit.fitWidth,
                            height: 140.0,
                          ),

                          SizedBox(height: heightSizedBoxBetweenFields - 5),

                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              LocaleKeys.aboutAppText3.tr(),
                              textAlign: TextAlign.justify,
                              style: TextStyle(
                                fontSize: 18,
                                fontStyle: FontStyle.italic,
                              ),
                            ),
                          ),

                          Image.asset(
                            "assets/images/profil_2.png",
                            fit: BoxFit.fitWidth,
                            height: 140.0,
                          ),

                          SizedBox(height: heightSizedBoxBetweenFields - 5),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
