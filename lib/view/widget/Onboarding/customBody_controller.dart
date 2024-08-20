import 'package:ecommerc2/controller/Onboarding_controller.dart';
import 'package:ecommerc2/data/datasource/static/datalist/ListOnboardingData.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class customBody_controller extends StatelessWidget {
  const customBody_controller({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10.0),
      width: MediaQuery.of(context).size.width,
      height: 40.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ...List.generate(
              OnboardingData.length,
              (index) =>
                  GetBuilder<Onboarding_controller>(builder: (controller) {
                    return AnimatedContainer(
                      margin: const EdgeInsets.all(2.0),
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(30.0)),
                      width: controller.indexpage == index ? 20.0 : 10.0,
                      height: 5.0,
                      duration: const Duration(milliseconds: 200),
                    );
                  }))
        ],
      ),
    );
  }
}
