// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:profiles_plus/generated/locale_keys.g.dart';
import 'package:profiles_plus/styles_colors_borders.dart';
import 'package:profiles_plus/text_labels.dart';

class AboutDeveloperPage extends StatelessWidget {
  const AboutDeveloperPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: backgroundColorOfScreen,
        appBar: AppBar(
          backgroundColor: mainDesignColor,
          title: Text(
            LocaleKeys.textAppBar5.tr(),
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
              // SizedBox(
              //   height: 150,
              // ),
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
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              //?====================================================
                              // SizedBox(height: heightSizedBoxBetweenFields),
                              //?====================================================
                              ClipRRect(
                                borderRadius:
                                    BorderRadius.circular(borderRadius),
                                child: Image.asset(
                                  "assets/images/developer.jpg",
                                  fit: BoxFit.fitWidth,
                                  height: 140.0,
                                ),
                              ),

                              //?====================================================

                              //?====================================================
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      LocaleKeys.nameDeveloperText.tr(),
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 20.0,
                                        // fontStyle: FontStyle.italic,
                                      ),
                                    ),
                                    SizedBox(height: 8.0),
                                    Text(
                                      LocaleKeys.aboutDeveloperText.tr(),
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Colors.black,
                                        // color: Colors.blue,
                                        fontSize: 12.0,
                                        // fontStyle: FontStyle.italic,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              //?====================================================
                            ],
                          ),
                          SizedBox(height: 5),
                          Divider(
                            thickness: 1.0,
                            // indent: 10.0,
                            // endIndent: 10.0,
                            color: Colors.black,
                          ),
                          Text(
                            contactsDeveloperText,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16.0,
                              // fontStyle: FontStyle.italic,
                            ),
                          ),
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
