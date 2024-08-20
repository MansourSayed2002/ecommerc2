import 'package:ecommerc2/controller/auth/Register_controller.dart';
import 'package:ecommerc2/core/costant/color/AplicationColors.dart';
import 'package:ecommerc2/core/function/validation/vaidator.dart';
import 'package:ecommerc2/view/widget/ApplicationSign/custom_buttomGoToPage.dart';
import 'package:ecommerc2/view/widget/ApplicationSign/custom_textForm.dart';
import 'package:ecommerc2/view/widget/ApplicationSign/custom_toexplainpage.dart';
import 'package:ecommerc2/view/widget/Onboarding/customBody_buttomONE.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Register_view extends StatelessWidget {
  const Register_view({super.key});

  @override
  Widget build(BuildContext context) {
    Register_controller controller = Get.put(Register_controller());

    return Scaffold(
      backgroundColor: ApplicationColors.white,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: ApplicationColors.white,
        centerTitle: true,
        title: Text(
          'Register',
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
              subtitle:
                  'Register with your Email And Password OR\n Continue With Social Media',
              title: "complete profile",
            ),
            custom_textForm(
              controller: controller.email,
              validator: (value) {
                return validationinput(value!, 50, 10, "none");
              },
              icon: Icon(
                Icons.email_outlined,
                color: ApplicationColors.blue,
              ),
              obscure: false,
              label: 'Username',
            ),
            custom_textForm(
                controller: controller.password,
                validator: (value) {
                  return validationinput(value!, 50, 8, "none");
                },
                obscure: controller.hide,
                label: 'Password',
                icon: Icon(
                  Icons.visibility,
                  color: ApplicationColors.blue,
                )),
            const SizedBox(
              height: 20.0,
            ),
            customBody_buttomONE(
              title: 'Register',
              ontap: () {
                controller.checkvalidate();
              },
            ),
            const SizedBox(
              height: 140,
            ),
            custom_GoToPage(
              ontap: () {
                controller.GoToSignUp();
              },
              title: 'Go To Screan Signup',
            )
          ],
        ),
      ),
    );
  }
}
