import 'package:ecommerc2/core/class/AppRouting.dart';
import 'package:ecommerc2/core/costant/StatusRequest.dart';
import 'package:ecommerc2/core/class/crud.dart';
import 'package:ecommerc2/core/function/checkinternet.dart';
import 'package:ecommerc2/core/function/handlingData.dart';
import 'package:ecommerc2/data/datasource/remote/auth/signup.dart';
import 'package:ecommerc2/view/screan/AplicationSign/verificationcode_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class Abs_signup_controller extends GetxController {
  late TextEditingController name;

  late TextEditingController email;

  late TextEditingController password;

  Statusrequest statusrequest = Statusrequest.none;
  GoToRegister();
  GoToForverifypage();
  checkvalidate();
  CreateEmail();
}

class Signup_controller extends Abs_signup_controller {
  GlobalKey<FormState>? formte = GlobalKey<FormState>();

  Contsignup contsignup = Contsignup(Crud());

  bool hide = false;

  @override
  void onInit() {
    CheckInternet();
    name = TextEditingController();
    email = TextEditingController();
    password = TextEditingController();

    super.onInit();
  }

  @override
  void dispose() {
    name.dispose();
    password.dispose();
    email.dispose();
    super.dispose();
  }

  @override
  GoToRegister() {
    Get.offAllNamed(AppRouting.register);
  }

  @override
  GoToForverifypage() {
    Get.offAll(() => const Verificationcode_view(), arguments: {
      "email": email.text,
    });
  }

  @override
  checkvalidate() {
    var formdata = formte!.currentState;
    if (formdata!.validate()) {
      CreateEmail();
    } else {
      print('No Validation');
    }
  }

  @override
  CreateEmail() async {
    statusrequest = Statusrequest.loading;
    update();
    var response =
        await contsignup.upload_data(name.text, email.text, password.text);
    statusrequest = handlingData(response);
    if (statusrequest == Statusrequest.success) {
      GoToForverifypage();
    } else if (response['message'] == 'THE EMAIL IS A available') {
      return Get.defaultDialog(
        title: 'Email',
        content: const Text(
          'THE EMAIL IS A available,Please Enter Another Email',
          textAlign: TextAlign.center,
        ),
      );
    }
  }
}
