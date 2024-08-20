import 'package:ecommerc2/controller/AfterRegister/checkout/checkouot_controller.dart';
import 'package:ecommerc2/core/costant/color/AplicationColors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Custom_choosepayment extends StatelessWidget {
  const Custom_choosepayment({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: GetBuilder<Checkout_controller>(
        builder: (controller) => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Choose Payment Method',
              style: TextStyle(
                fontSize: 25.0,
                color: ApplicationColors.alizarin,
                fontWeight: FontWeight.bold,
              ),
            ),
            InkWell(
              onTap: () {
                // cash => 0
                // payment => 1
                controller.choosepayment(0);
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  color: controller.paymentmethod == 0
                      ? ApplicationColors.alizarin
                      : ApplicationColors.grey,
                ),
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.all(10.0),
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  'Cash',
                  style: TextStyle(
                    fontSize: 18.0,
                    color: ApplicationColors.white,
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                // cash => 0
                // payment => 1
                controller.choosepayment(1);
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  color: controller.paymentmethod == 1
                      ? ApplicationColors.alizarin
                      : ApplicationColors.grey,
                ),
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.all(10.0),
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  'Payment Cards',
                  style: TextStyle(
                    fontSize: 18.0,
                    color: ApplicationColors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
