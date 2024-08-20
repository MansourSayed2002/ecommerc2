import 'package:ecommerc2/core/localization/MyLocale.dart';
import 'package:ecommerc2/view/screan/StartApplication/Onboarding_view.dart';
import 'package:ecommerc2/view/widget/StartApplicaton/ChooseBottum.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChooseLangauge_view extends StatelessWidget {
  const ChooseLangauge_view({super.key});

  @override
  Widget build(BuildContext context) {
    Languagecontroller controller = Get.put(Languagecontroller());
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              '13'.tr,
              style: const TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.0),
            ),
            ChooseButtom(
              ontap: () {
                controller.mylocale('ar');
                Get.offAll(() => const Onboarding_view());
              },
              title: "11".tr,
            ),
            ChooseButtom(
              ontap: () {
                controller.mylocale('en');
                Get.offAll(() => const Onboarding_view());
              },
              title: "12".tr,
            )
          ],
        ),
      ),
    );
  }
}
