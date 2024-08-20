import 'package:ecommerc2/core/costant/StatusRequest.dart';
import 'package:ecommerc2/core/class/crud.dart';
import 'package:ecommerc2/core/function/handlingData.dart';
import 'package:ecommerc2/data/datasource/remote/forgetpassword/forgetpassword.dart';
import 'package:ecommerc2/view/screan/forgetpassword/verifycode_forget.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

abstract class Abs_ForgetPassword_controller extends GetxController {
  TextEditingController? email;
  GoToverificationcode();
  checkvalidate();
  checkemail();
}

class ForgetPassword_controller extends Abs_ForgetPassword_controller {
  GlobalKey<FormState>? formte = GlobalKey<FormState>();

  late Statusrequest statusrequest;

  Contforgetpassword contforgetpassword = Contforgetpassword(crud: Crud());

  @override
  void onInit() {
    email = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email!.dispose();

    super.dispose();
  }

  @override
  checkvalidate() {
    var formdata = formte!.currentState;
    if (formdata!.validate()) {
      checkemail();
    } else {
      print('NOT VALIDATION');
    }
  }

  @override
  GoToverificationcode() {
    Get.to(const Verifycode_forget_view(), arguments: {
      "email": email!.text,
    });
  }

  @override
  checkemail() async {
    statusrequest = Statusrequest.loading;

    var response = await contforgetpassword.get_Data(email!.text);

    statusrequest = handlingData(response);

    if (response['status'] == 'success') {
      GoToverificationcode();
    }
  }
}
