import 'package:ecommerc2/controller/forgetpassword/ForgetPassword_controller.dart';
import 'package:ecommerc2/core/costant/color/AplicationColors.dart';
import 'package:ecommerc2/core/function/validation/vaidator.dart';
import 'package:ecommerc2/view/widget/ApplicationSign/custom_textForm.dart';
import 'package:ecommerc2/view/widget/ApplicationSign/custom_toexplainpage.dart';
import 'package:ecommerc2/view/widget/Onboarding/customBody_buttomONE.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgetPassword_view extends StatelessWidget {
  const ForgetPassword_view({super.key});

  @override
  Widget build(BuildContext context) {
    ForgetPassword_controller controller = Get.put(ForgetPassword_controller());
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
          'Forget Password',
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
              subtitle: 'You Should Enter The Email To Check it ',
              title: "Forget Password",
            ),
            custom_textForm(
              controller: controller.email!,
              validator: (value) {
                return validationinput(value!, 50, 8, "none");
              },
              icon: Icon(
                Icons.email,
                color: ApplicationColors.blue,
              ),
              obscure: false,
              label: 'Email',
            ),
            customBody_buttomONE(
              title: 'Check Email',
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
