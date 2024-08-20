import 'package:ecommerc2/core/costant/theme/Apptheme.dart';
import 'package:ecommerc2/core/function/fcmconfig.dart';
import 'package:ecommerc2/core/services/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Languagecontroller extends GetxController {
  Locale? langauge;

  Myservices services = Get.find();

  ThemeData apptheme = englishtheme;

  mylocale(locale) {
    Locale localy = Locale(locale);
    services.sharedpre.setString('lang', locale);
    locale == 'ar' ? apptheme = arabictheme : englishtheme;
    Get.changeTheme(apptheme);
    Get.updateLocale(localy);
  }

  @override
  void onInit() {
    var checklang = services.sharedpre.getString('lang');
    if (checklang == "ar") {
      langauge = const Locale('ar');
      apptheme = arabictheme;
    } else if (checklang == "en") {
      langauge = const Locale('en');
      apptheme = englishtheme;
    } else {
      langauge = Locale(Get.deviceLocale!.languageCode);
    }
    permissionnotification();
    fcmconfig();
    super.onInit();
  }
}
