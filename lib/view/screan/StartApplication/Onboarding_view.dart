import 'package:ecommerc2/controller/Onboarding_controller.dart';
import 'package:ecommerc2/data/datasource/static/datalist/ListOnboardingData.dart';
import 'package:ecommerc2/view/widget/Onboarding/customBody_buttomONE.dart';
import 'package:ecommerc2/view/widget/Onboarding/customBody_buttomTWO.dart';
import 'package:ecommerc2/view/widget/Onboarding/customBody_controller.dart';
import 'package:ecommerc2/view/widget/Onboarding/customBody_toexplain.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Onboarding_view extends StatelessWidget {
  const Onboarding_view({super.key});

  @override
  Widget build(BuildContext context) {
    Onboarding_controller controller = Get.put(Onboarding_controller());
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: PageView.builder(
            onPageChanged: (value) {
              controller.changepage(value);
            },
            controller: controller.controller,
            itemCount: OnboardingData.length,
            itemBuilder: (context, index) => Column(
              children: [
                customBody_toexplain(
                  image: '${OnboardingData[index].image}',
                  tiltebody: OnboardingData[index].titlebody,
                  title: OnboardingData[index].title,
                ),
                const customBody_controller(),
                customBody_buttomONE(
                  ontap: () {
                    controller.Next();
                  },
                  title: '${OnboardingData[index].titlebuttom_one}',
                ),
                customBody_buttomTWO(
                  ontap: () {
                    controller.GoToPageSignUp();
                  },
                  title: '${OnboardingData[index].titlebuttom_two}',
                )
              ],
            ),
          ),
        ));
  }
}
