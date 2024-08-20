import 'package:ecommerc2/controller/AfterRegister/checkout/checkouot_controller.dart';
import 'package:ecommerc2/core/costant/Onboarding_Image.dart';
import 'package:ecommerc2/core/costant/color/AplicationColors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Custom_DelivaryType extends StatelessWidget {
  const Custom_DelivaryType({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 210.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Choose Delivary Type',
            style: TextStyle(
              fontSize: 25.0,
              fontWeight: FontWeight.bold,
              color: ApplicationColors.alizarin,
            ),
          ),
          SizedBox(
              child: GetBuilder<Checkout_controller>(
            builder: (controller) => Row(
              children: [
                Custom_chooseDrive(
                  // Drive => 0
                  // Delivary => 1
                  isactive: controller.delivary == 1 ? true : false,
                  onTap: () {
                    controller.choosedelivary(1);
                  },
                  image: AppOnboarding_Image.picute1,
                  title: 'Delivary',
                ),
                Custom_chooseDrive(
                  // Drive => 0
                  // Delivary => 1
                  isactive: controller.delivary == 0 ? true : false,
                  onTap: () {
                    controller.choosedelivary(0);
                  },
                  image: AppOnboarding_Image.picute2,
                  title: 'Drive Thru',
                ),
              ],
            ),
          )),
        ],
      ),
    );
  }
}

class Custom_chooseDrive extends GetView<Checkout_controller> {
  Custom_chooseDrive({
    super.key,
    required this.image,
    required this.title,
    required this.onTap,
    required this.isactive,
  });
  String image;
  String title;
  void Function()? onTap;
  bool isactive = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(
          width: 2,
          color: ApplicationColors.alizarin,
        )),
        height: 130,
        width: 130,
        margin: const EdgeInsets.all(10.0),
        child: isactive == true
            ? Stack(
                alignment: Alignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                          flex: 2,
                          child: Image.asset(
                            image,
                          )),
                      Text(
                        title,
                        style: TextStyle(
                          color: ApplicationColors.alizarin,
                          fontSize: 20.0,
                        ),
                      )
                    ],
                  ),
                  Icon(
                    Icons.done_all,
                    size: 100.0,
                    color: ApplicationColors.alizarin,
                  )
                ],
              )
            : Column(
                children: [
                  Expanded(
                      flex: 2,
                      child: Image.asset(
                        image,
                      )),
                  Text(
                    title,
                    style: TextStyle(
                      color: ApplicationColors.alizarin,
                      fontSize: 20.0,
                    ),
                  )
                ],
              ),
      ),
    );
  }
}
