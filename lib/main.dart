import 'package:ecommerc2/core/costant/Routing/Routing.dart';
import 'package:ecommerc2/core/localization/MyLocale.dart';
import 'package:ecommerc2/core/localization/localization.dart';
import 'package:ecommerc2/core/services/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initservices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Languagecontroller controller = Get.put(Languagecontroller());
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Cairo',
        primarySwatch: Colors.blue,
      ),
      translations: MyTranslation(),
      locale: controller.langauge,
      initialRoute: '/',
      getPages: getPages,
    );
  }
}
