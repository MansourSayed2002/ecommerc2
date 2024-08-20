import 'package:ecommerc2/core/class/AppRouting.dart';
import 'package:ecommerc2/core/costant/color/AplicationColors.dart';
import 'package:ecommerc2/view/widget/Onboarding/customBody_buttomONE.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Congratulation_view extends StatelessWidget {
  const Congratulation_view({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.library_add_check_outlined,
              size: 200,
              color: ApplicationColors.alizarin,
            ),
            const SizedBox(
              height: 100,
            ),
            customBody_buttomONE(
              ontap: () {
                Get.toNamed(AppRouting.register);
              },
              title: 'Go To Register Page',
            )
          ],
        ),
      ),
    );
  }
}
