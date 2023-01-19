// ignore_for_file: prefer_const_constructors, sort_child_properties_last, non_constant_identifier_names

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:profiles_plus/generated/locale_keys.g.dart';
import 'package:profiles_plus/styles_colors_borders.dart';
import 'package:url_launcher/url_launcher.dart';
// https://pub.dev/packages/url_launcher

final Uri _urlNUOS = Uri.parse('https://nuos.edu.ua/');
final Uri _urlNUOSYouTube =
    Uri.parse('https://www.youtube.com/channel/UCUftAB131p3nIKAun5uWNbA');
final Uri _urlNUOSfacebook =
    Uri.parse('https://www.facebook.com/infocenterNUK/');
final Uri _urlMNNI = Uri.parse(
    'https://nuos.edu.ua/pro-universitet/struktura/mashinobudivnij-navchalno-naukovij-institut');
// final Uri _urlAnton =
//     Uri.parse('http://eir.nuos.edu.ua/xmlui/handle/123456789/5582');
// final Uri _urlAnton = Uri.parse(
//     'http://eir.nuos.edu.ua/xmlui/bitstream/handle/123456789/5582/Novoshytskyi%20Anton%20Monograph.pdf?sequence=1&isAllowed=y');

Drawer myDrawer(context) {
  return Drawer(
    elevation: 4.0,
    backgroundColor: backgroundColorOfScreen,
    // shape: RoundedRectangleBorder(
    //   // borderRadius: BorderRadius.circular(borderRadius),
    //   side: BorderSide(color: mainDesignColor, width: 2.0),
    // ),
    child: ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
        DrawerHeader(
          padding: EdgeInsets.fromLTRB(12.0, 102.0, 5.0, 5.0),
          // margin: EdgeInsets.only(top: 48.0),
          margin: EdgeInsets.only(top: 23.0),
          child: Center(
            child: TextButton(
              onPressed: () => _launchUrl(_urlNUOS),
              child: Text(
                LocaleKeys.nuosDrawerText1.tr(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16.0, //!
                  color: backgroundColorOfScreen,
                  // color: Colors.blue,
                  // color: Colors.white,
                  // fontStyle: FontStyle.italic,
                ),
              ),
            ),
          ),
          decoration: BoxDecoration(
            // color: Colors.blue,
            image: DecorationImage(
              image: AssetImage("assets/images/header_drawer.jpg"),
              fit: BoxFit.cover,
              // colorFilter: ColorFilter.linearToSrgbGamma(),
            ),
          ),
        ),
        //?-------------------------
        DrawerCard(
          child: ListTile(
            leading: Icon(Icons.info, color: mainDesignColor),
            // leading: Icon(Icons.info_outline, color: mainDesignColor),
            title: Text(
              LocaleKeys.aboutAppDrawerText.tr(),
              style: textStyleDrawerAndPopupMenu,
            ),
            onTap: () {
              Navigator.pushNamed(context, '/page4');
            },
          ),
        ),
        //?-------------------------
        // Divider(
        //   thickness: 1.0,
        //   indent: 10.0,
        //   endIndent: 10.0,
        //   color: mainDesignColor,
        // ),
        //?-------------------------
        DrawerCard(
          child: Column(
            children: [
              ListTile(
                leading: Icon(Icons.web_rounded, color: mainDesignColor),
                title: Text(
                  LocaleKeys.nuosDrawerText2.tr(),
                  style: textStyleDrawerAndPopupMenu,
                ),
                onTap: () => _launchUrl(_urlNUOS),
              ),
              //?-------------------------
              ListTile(
                // leading: Icon(IconData(0xe32d, fontFamily: 'MaterialIcons'),color: mainDesignColor),
                leading: Icon(Icons.web_rounded, color: mainDesignColor),
                title: Text(
                  LocaleKeys.mnniDrawerText.tr(),
                  style: textStyleDrawerAndPopupMenu,
                ),
                onTap: () => _launchUrl(_urlMNNI),
              ),
              //?-------------------------
              ListTile(
                leading: Icon(
                    const IconData(0xe457, fontFamily: 'MaterialIcons'), //!
                    color: mainDesignColor),
                title: Text(
                  LocaleKeys.youtubeNUOSDrawerText.tr(),
                  style: textStyleDrawerAndPopupMenu,
                ),
                onTap: () => _launchUrl(_urlNUOSYouTube),
              ),
              //?-------------------------
              ListTile(
                leading: Icon(
                    const IconData(0xe255, fontFamily: 'MaterialIcons'), //!
                    color: mainDesignColor),
                title: Text(
                  LocaleKeys.facebookeNUOSDrawerText.tr(),
                  style: textStyleDrawerAndPopupMenu,
                ),
                onTap: () => _launchUrl(_urlNUOSfacebook),
              ),
            ],
          ),
        ),

        //?-------------------------
        // Divider(
        //   thickness: 1.0,
        //   indent: 10.0,
        //   endIndent: 10.0,
        //   color: mainDesignColor,
        // ),
        //?-------------------------

        DrawerCard(
          child: Column(
            children: [
              ListTile(
                leading: Icon(
                    const IconData(0xe1c7, fontFamily: 'MaterialIcons'), //!
                    color: mainDesignColor),
                // leading: Icon(Icons.info_outline, color: mainDesignColor),
                title: Text(
                  LocaleKeys.aboutDeveloperDrawerText.tr(),
                  style: textStyleDrawerAndPopupMenu,
                ),
                onTap: () {
                  Navigator.pushNamed(context, '/page5');
                },
              ),
              //?-------------------------
              // ListTile(
              //   leading: Icon(Icons.settings, color: mainDesignColor),
              //   title: Text(
              //?     LocaleKeys.settingsDrawerText.tr(),
              //     style: textStyleDrawerAndPopupMenu,
              //   ),
              //   onTap: () {},
              // ),
              //?-------------------------
              // ListTile(
              //   leading: Icon(IconData(0xf160, fontFamily: 'MaterialIcons'),
              //       color: mainDesignColor),
              //   title: Text(
              //?     'Инструкция',
              //     style: textStyleDrawerAndPopupMenu,
              //   ),
              //   onTap: () {},
              // ),
              //?-------------------------
              ListTile(
                leading: Icon(
                    const IconData(0xe3dd, fontFamily: 'MaterialIcons'), //!
                    color: mainDesignColor),
                title: Text(
                  LocaleKeys.literatureDrawerText.tr(),
                  style: textStyleDrawerAndPopupMenu,
                ),
                // onTap: () {},
                onTap: () {
                  Navigator.pushNamed(context, '/page6');
                },
              ),
            ],
          ),
        ),

        //?-------------------------
        // Divider(
        //   thickness: 1.0,
        //   indent: 10.0,
        //   endIndent: 10.0,
        //   color: mainDesignColor,
        // ),
        //?-------------------------
        // ListTile(
        //   onTap: () {
        //     Navigator.of(context).pop();
        //   },
        //   leading: Icon(
        //     Icons.exit_to_app_sharp,
        //     color: mainDesignColor,
        //   ),
        //   title: Text(
        //     LocaleKeys.exitDrawerText.tr(),
        //     style: textStyleDrawerAndPopupMenu,
        //   ),
        // ),
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        DrawerCard(
          child: ListTile(
            onTap: () {
              Navigator.of(context).pop();
            },
            leading: Icon(
              Icons.exit_to_app_sharp,
              color: mainDesignColor,
            ),
            title: Text(
              LocaleKeys.exitDrawerText.tr(),
              style: textStyleDrawerAndPopupMenu,
            ),
          ),
        ),
      ],
    ),
    //
    //
  );
}

Future<void> _launchUrl(url) async {
  if (!await launchUrl(url)) {
    throw 'Could not launch $url';
  }
  // await launch(url, forceWebView: false, enableJavaScript: true);
}

Card DrawerCard({required Widget child}) {
  return Card(
    margin: EdgeInsets.fromLTRB(8, 4, 8, 4),
    color: backgroundColorOfCard,
    elevation: 4.0,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(borderRadius),
      side: BorderSide(color: mainDesignColor, width: 2.0),
    ),
    child: Padding(padding: const EdgeInsets.all(0.0), child: child
        // Column(
        //   children: [
        //     ,
        //   ],
        // ),
        ),
  );
}
