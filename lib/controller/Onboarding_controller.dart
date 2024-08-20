import 'package:ecommerc2/core/services/services.dart';
import 'package:ecommerc2/data/datasource/static/datalist/ListOnboardingData.dart';
import 'package:ecommerc2/view/screan/AplicationSign/signup_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

abstract class Abs_Onboarding_controller extends GetxController {
  late PageController controller;
  Myservices myservice = Get.find();
  Next();
  GoToPageSignUp();
  changepage(int vlaue);
}

class Onboarding_controller extends Abs_Onboarding_controller {
  int indexpage = 0;
  @override
  void onInit() {
    controller = PageController();

    super.onInit();
  }

  @override
  Next() {
    indexpage++;
    if (indexpage > OnboardingData.length - 1) {
      myservice.sharedpre.setString("step", "1");

      GoToPageSignUp();
    }
    controller.animateToPage(indexpage,
        duration: const Duration(milliseconds: 200), curve: Curves.bounceIn);
  }

  @override
  GoToPageSignUp() {
    Get.offAll(() => const Signup_view());
  }

  @override
  changepage(vlaue) {
    indexpage = vlaue;
    update();
  }
}
