import 'package:ecommerc2/core/costant/StatusRequest.dart';
import 'package:ecommerc2/core/class/crud.dart';
import 'package:ecommerc2/core/function/handlingData.dart';
import 'package:ecommerc2/data/datasource/remote/forgetpassword/resetpassword.dart';
import 'package:ecommerc2/view/screan/AplicationSign/register_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class Abs_ResetPassword_controller extends GetxController {
  late TextEditingController newpassord;
  late TextEditingController renewpassord;

  checkvalidate();

  Resetpassword();

  GoToRegisterPage();
}

class ResetPassword_controller extends Abs_ResetPassword_controller {
  String? email;

  late Statusrequest statusrequest;

  Contresetpassword contresetpassword = Contresetpassword(crud: Crud());

  GlobalKey<FormState>? formte = GlobalKey<FormState>();
  @override
  void onInit() {
    email = Get.arguments['email'];

    newpassord = TextEditingController();

    renewpassord = TextEditingController();

    super.onInit();
  }

  @override
  void dispose() {
    newpassord.dispose();

    renewpassord.dispose();

    super.dispose();
  }

  @override
  checkvalidate() {
    var formdata = formte!.currentState;
    if (formdata!.validate()) {
      Resetpassword();
    } else {
      print('NOT VALIDATION');
    }
  }

  @override
  Resetpassword() async {
    statusrequest = Statusrequest.loading;

    var response = await contresetpassword.uploud_Data(
        newpassord.text, renewpassord.text, email!);

    statusrequest = handlingData(response);

    if (response['status'] == 'success') {
      GoToRegisterPage();
    }
  }

  @override
  GoToRegisterPage() {
    Get.offAll(const Register_view());
  }
}
