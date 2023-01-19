// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:profiles_plus/generated/codegen_loader.g.dart';
import 'package:profiles_plus/pages/about_app_page.dart';
import 'package:profiles_plus/pages/about_developer_page.dart';
import 'package:profiles_plus/pages/input_data_page_1.dart';
import 'package:profiles_plus/pages/input_data_page_2.dart';
import 'package:profiles_plus/pages/literary_sources_page.dart';
import 'package:profiles_plus/pages/results_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(
    EasyLocalization(
      supportedLocales: [Locale('ru'), Locale('uk')],
      path: 'assets/translations',
      fallbackLocale: Locale('ru'),
      assetLoader: CodegenLoader(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, //! Debug Banner
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,

      title: 'Profiles U',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      // initialRoute: '/',
      // initialRoute: '/page3', // todo: Потом отключить
      routes: <String, WidgetBuilder>{
        '/page1': (context) => InputDataPage1(),
        '/page2': (context) => InputDataPage2(),
        '/page3': (context) => ResultsPage(),
        '/page4': (context) => AboutAppPage(),
        '/page5': (context) => AboutDeveloperPage(),
        '/page6': (context) => LiterarySourcesPage(),
      },

      home: InputDataPage1(),
      // home: RegisterFormPage(),
      // home: AboutAppPage(),
      // home: AboutDeveloperPage(),
    );
  }
}
