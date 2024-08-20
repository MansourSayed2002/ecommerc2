import 'package:ecommerc2/controller/auth/SignUp_controller.dart';
import 'package:ecommerc2/core/class/HandlingDatarequest.dart';
import 'package:ecommerc2/core/costant/color/AplicationColors.dart';
import 'package:ecommerc2/core/function/validation/vaidator.dart';
import 'package:ecommerc2/view/widget/ApplicationSign/custom_buttomGoToPage.dart';
import 'package:ecommerc2/view/widget/ApplicationSign/custom_textForm.dart';
import 'package:ecommerc2/view/widget/ApplicationSign/custom_toexplainpage.dart';
import 'package:ecommerc2/view/widget/Onboarding/customBody_buttomONE.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Signup_view extends StatelessWidget {
  const Signup_view({super.key});

  @override
  Widget build(BuildContext context) {
    Signup_controller controller = Get.put(Signup_controller());

    return GetBuilder<Signup_controller>(
      builder: (controller) => Scaffold(
          backgroundColor: ApplicationColors.white,
          appBar: AppBar(
            elevation: 0.0,
            backgroundColor: ApplicationColors.white,
            centerTitle: true,
            title: Text(
              'Sign Up',
              style: TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                  letterSpacing: .5,
                  color: ApplicationColors.black),
            ),
          ),
          body: HandlingDataRequest(
            widget: Form(
              key: controller.formte,
              child: ListView(
                children: [
                  Custom_toexplainpage(
                    subtitle:
                        'Sign Up with your Email And Password OR\n Continue With Social Media',
                    title: "complete profile",
                  ),
                  custom_textForm(
                    controller: controller.name,
                    validator: (value) {
                      return validationinput(value!, 30, 4, "none");
                    },
                    icon: Icon(
                      Icons.abc,
                      color: ApplicationColors.blue,
                    ),
                    obscure: false,
                    label: 'Name',
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
                    icon: IconButton(
                        icon: controller.hide == false
                            ? Icon(
                                Icons.visibility,
                                color: ApplicationColors.blue,
                              )
                            : Icon(
                                Icons.visibility_off,
                                color: ApplicationColors.blue,
                              ),
                        onPressed: () {
                          controller.hide = !controller.hide;
                          print(controller.hide);
                        }),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  customBody_buttomONE(
                    title: 'Sign Up',
                    ontap: () {
                      controller.checkvalidate();
                    },
                  ),
                  const SizedBox(
                    height: 60.0,
                  ),
                  custom_GoToPage(
                    ontap: () {
                      controller.GoToRegister();
                    },
                    title: 'Go To Screan Register',
                  )
                ],
              ),
            ),
            statusrequest: controller.statusrequest,
          )),
    );
  }
}
