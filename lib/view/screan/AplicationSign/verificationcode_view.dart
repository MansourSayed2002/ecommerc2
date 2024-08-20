import 'package:ecommerc2/controller/auth/Verificationcode_controller.dart';
import 'package:ecommerc2/core/class/HandlingDatarequest.dart';
import 'package:ecommerc2/core/costant/color/AplicationColors.dart';
import 'package:ecommerc2/view/widget/ApplicationSign/custom_toexplainpage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';

class Verificationcode_view extends StatelessWidget {
  const Verificationcode_view({super.key});

  @override
  Widget build(BuildContext context) {
    Verification_controller controller = Get.put(Verification_controller());
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: ApplicationColors.white,
        centerTitle: true,
        title: Text(
          'Verification Code',
          style: TextStyle(
              fontSize: 25.0,
              fontWeight: FontWeight.bold,
              letterSpacing: .5,
              color: ApplicationColors.black),
        ),
      ),
      body: GetBuilder<Verification_controller>(
        builder: (controller) => HandlingDataRequest(
          widget: Column(
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
                    print(value);
                    controller.checkverify(value);
                  },
                  fieldWidth: 50.0,
                  numberOfFields: 4,
                  borderColor: ApplicationColors.blue,
                ),
              ),
            ],
          ),
          statusrequest: controller.statusrequest,
        ),
      ),
    );
  }
}
