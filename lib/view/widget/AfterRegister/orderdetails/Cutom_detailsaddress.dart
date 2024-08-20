import 'package:ecommerc2/controller/AfterRegister/orderdetails/Orderdetails_controller.dart';
import 'package:ecommerc2/core/costant/color/AplicationColors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Custom_detailsAddress extends StatelessWidget {
  const Custom_detailsAddress({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<Orderdetails_controller>(
        builder: (controller) => Column(
              children: [
                Text(
                  'Address',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                    color: ApplicationColors.black,
                  ),
                ),
                Card(
                  margin: const EdgeInsets.only(top: 20.0),
                  child: Container(
                    padding: const EdgeInsets.all(10.0),
                    child: Table(
                      children: [
                        TableRow(children: [
                          Text(
                            'country',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              color: ApplicationColors.alizarin,
                            ),
                          ),
                          Text(
                            'city',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              color: ApplicationColors.alizarin,
                            ),
                          ),
                          Text(
                            'street',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              color: ApplicationColors.alizarin,
                            ),
                          ),
                        ]),
                        TableRow(children: [
                          Text(
                            '${controller.orderAddressModel!.addressCountry}',
                            textAlign: TextAlign.center,
                          ),
                          Text(
                            '${controller.orderAddressModel!.addressCity}',
                            textAlign: TextAlign.center,
                          ),
                          Text(
                            '${controller.orderAddressModel!.addressStreet}',
                            textAlign: TextAlign.center,
                          ),
                        ])
                      ],
                    ),
                  ),
                ),
              ],
            ));
  }
}
