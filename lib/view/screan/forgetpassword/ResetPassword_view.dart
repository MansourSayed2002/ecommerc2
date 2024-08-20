import 'package:ecommerc2/controller/forgetpassword/ResetPassword_controller.dart';
import 'package:ecommerc2/core/costant/color/AplicationColors.dart';
import 'package:ecommerc2/core/function/validation/vaidator.dart';
import 'package:ecommerc2/view/widget/ApplicationSign/custom_textForm.dart';
import 'package:ecommerc2/view/widget/ApplicationSign/custom_toexplainpage.dart';
import 'package:ecommerc2/view/widget/Onboarding/customBody_buttomONE.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResetPassword_view extends StatelessWidget {
  const ResetPassword_view({super.key});

  @override
  Widget build(BuildContext context) {
    ResetPassword_controller controller = Get.put(ResetPassword_controller());
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: ApplicationColors.white,
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(Icons.arrow_back_ios),
          color: ApplicationColors.black,
        ),
        title: Text(
          'Reset Password',
          style: TextStyle(
              fontSize: 25.0,
              fontWeight: FontWeight.bold,
              letterSpacing: .5,
              color: ApplicationColors.black),
        ),
      ),
      body: Form(
        key: controller.formte,
        child: ListView(
          children: [
            Custom_toexplainpage(
              subtitle: 'You Can Reset Password Now',
              title: "Reset Password",
            ),
            custom_textForm(
              controller: controller.newpassord,
              validator: (value) {
                return validationinput(value!, 50, 8, "none");
              },
              icon: Icon(
                Icons.lock,
                color: ApplicationColors.blue,
              ),
              obscure: false,
              label: 'NewPassord',
            ),
            custom_textForm(
              controller: controller.renewpassord,
              validator: (value) {
                return validationinput(value!, 50, 8, "none");
              },
              icon: Icon(
                Icons.lock,
                color: ApplicationColors.blue,
              ),
              obscure: false,
              label: 'ReNewPassord',
            ),
            customBody_buttomONE(
              title: 'Reset Password',
              ontap: () {
                controller.checkvalidate();
              },
            ),
          ],
        ),
      ),
    );
  }
}
