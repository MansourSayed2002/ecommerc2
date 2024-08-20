import 'package:ecommerc2/controller/forgetpassword/verifycode_forget_controller.dart';
import 'package:ecommerc2/core/costant/color/AplicationColors.dart';
import 'package:ecommerc2/view/widget/ApplicationSign/custom_toexplainpage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';

class Verifycode_forget_view extends StatelessWidget {
  const Verifycode_forget_view({super.key});

  @override
  Widget build(BuildContext context) {
    Verifycode_forget_controller controller =
        Get.put(Verifycode_forget_controller());
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
          'Verification Code',
          style: TextStyle(
              fontSize: 25.0,
              fontWeight: FontWeight.bold,
              letterSpacing: .5,
              color: ApplicationColors.black),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Custom_toexplainpage(
            subtitle: 'You Should Enter Verification Code To Check It',
            title: "Verification code ",
          ),
          Padding(
            padding: const EdgeInsets.all(40.0),
            child: OtpTextField(
              onSubmit: (value) {
                controller.checkverify(value);
              },
              fieldWidth: 50.0,
              numberOfFields: 4,
              borderColor: ApplicationColors.blue,
            ),
          ),
        ],
      ),
    );
  }
}
