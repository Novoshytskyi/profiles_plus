// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:profiles_plus/generated/locale_keys.g.dart';
import 'package:profiles_plus/styles_colors_borders.dart';
import 'package:profiles_plus/text_labels.dart';

class LiterarySourcesPage extends StatelessWidget {
  const LiterarySourcesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: backgroundColorOfScreen,
        appBar: AppBar(
          backgroundColor: mainDesignColor,
          title: Text(
            LocaleKeys.textAppBar6.tr(),
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
              literaryCard(literarySource1),
              literaryCard(literarySource2),
              literaryCard(literarySource3),
              literaryCard(literarySource4),
              literaryCard(literarySource5),
              literaryCard(literarySource6),
            ],
          ),
        ),
      ),
    );
  }
}

Card literaryCard(String text) {
  return Card(
    color: backgroundColorOfCard,
    elevation: 4.0,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(borderRadius),
      side: BorderSide(color: mainDesignColor, width: 2.0),
    ),
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Text(
            text,
            textAlign: TextAlign.justify,
            style: TextStyle(
              color: Colors.black,
              fontSize: 18.0,
              // fontStyle: FontStyle.italic,
            ),
          ),
        ],
      ),
    ),
  );
}
