import 'package:ecommerc2/core/class/AppRouting.dart';
import 'package:ecommerc2/core/costant/StatusRequest.dart';
import 'package:ecommerc2/core/class/crud.dart';
import 'package:ecommerc2/core/function/checkinternet.dart';
import 'package:ecommerc2/core/function/handlingData.dart';
import 'package:ecommerc2/core/services/services.dart';
import 'package:ecommerc2/data/datasource/remote/auth/Register.dart';
import 'package:ecommerc2/view/screan/forgetpassword/ForgetPassword_view.dart';
import 'package:ecommerc2/view/screan/AplicationSign/signup_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

abstract class Abs_Register_controller extends GetxController {
  late TextEditingController name;

  late TextEditingController email;

  late TextEditingController password;

  GlobalKey<FormState> formte = GlobalKey<FormState>();

  String? token;

  GoToSignUp();

  GoToForgetPassword();

  Myservices myservices = Get.find();

  checkvalidate();

  RegisterEmail();

  gettoken();

  GoToVerifycodePage();
}

class Register_controller extends Abs_Register_controller {
  Contregister contregister = Contregister(crud: Crud());

  bool hide = false;

  late Statusrequest statusrequest = Statusrequest.none;

  @override
  void onInit() {
    CheckInternet();
    gettoken();
    name = TextEditingController();
    email = TextEditingController();
    password = TextEditingController();

    super.onInit();
  }

  @override
  void dispose() {
    name.dispose();
    email.dispose();
    password.dispose();
    formte.currentState!.dispose();
    super.dispose();
    
  }

  @override
  GoToSignUp() {
    Get.offAll(() => const Signup_view());
  }

  @override
  GoToVerifycodePage() {
    Get.offAllNamed(AppRouting.verifycationcode, arguments: {
      "email": email.text,
    });
  }

  @override
  GoToForgetPassword() {
    Get.to(() => const ForgetPassword_view());
  }

  @override
  checkvalidate() {
    var formdata = formte.currentState;
    if (formdata!.validate()) {
      RegisterEmail();
    } else {
      print('NOT VALIDATION');
    }
  }

  @override
  RegisterEmail() async {
    statusrequest = Statusrequest.loading;
    var response = await contregister.Check_Data(email.text, password.text);
    statusrequest = handlingData(response);
    if (statusrequest == Statusrequest.success) {
      print(statusrequest);
      if (response['data']['users_aprove'] == 1) {
        myservices.sharedpre
            .setString('userid', response['data']['users_id'].toString());
        myservices.sharedpre
            .setString('email', response['data']['users_email']);
        myservices.sharedpre
            .setString('username', response['data']['users_name']);
        myservices.sharedpre.setString('step', '2');
        String? id = myservices.sharedpre.getString('userid');
        await FirebaseMessaging.instance.subscribeToTopic('user$id');
        Get.offAllNamed(AppRouting.homescrean);
      } else {
        GoToVerifycodePage();
      }
    }
  }

  @override
  gettoken() async {
    token = await FirebaseMessaging.instance.getToken();
    print('===============$token');
  }
}
