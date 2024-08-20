import 'package:ecommerc2/core/class/AppRouting.dart';
import 'package:ecommerc2/core/costant/StatusRequest.dart';
import 'package:ecommerc2/core/class/crud.dart';
import 'package:ecommerc2/core/function/handlingData.dart';
import 'package:ecommerc2/core/services/services.dart';
import 'package:ecommerc2/data/datasource/remote/auth/verifycationcode.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class Abs_Verification_controller extends GetxController {
  String? email;

  Statusrequest statusrequest = Statusrequest.none;

  Myservices myservices = Get.find();

  checkverify(String codeverify);

  GoToCongratulatonpage();
}

class Verification_controller extends Abs_Verification_controller {
  Verifycationcode verifycationcode = Verifycationcode(crud: Crud());

  @override
  void onInit() {
    email = Get.arguments['email'];
    super.onInit();
  }

  @override
  GoToCongratulatonpage() {
    Get.offAllNamed(AppRouting.congratulation);
  }

  @override
  checkverify(codeverify) async {
    statusrequest = Statusrequest.loading;

    print(email);
    var response = await verifycationcode.get_data(email!, codeverify);
    statusrequest = handlingData(response);
    if (statusrequest == Statusrequest.success) {
      GoToCongratulatonpage();
    } else {
      Get.defaultDialog(
          title: "VerifyCode",
          content: const Text('The Verifycation Code Is Wrong'));
      Get.back();
    }
    update();
  }
}
