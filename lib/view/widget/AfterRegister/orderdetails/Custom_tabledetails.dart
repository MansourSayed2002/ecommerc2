import 'package:ecommerc2/controller/AfterRegister/orderdetails/Orderdetails_controller.dart';
import 'package:ecommerc2/core/costant/color/AplicationColors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Custom_tabledetails extends StatelessWidget {
  const Custom_tabledetails({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<Orderdetails_controller>(
        builder: (controller) => Card(
              child: Column(
                children: [
                  Table(
                    children: [
                      TableRow(children: [
                        Text(
                          'Item',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            color: ApplicationColors.alizarin,
                          ),
                        ),
                        Text(
                          'Qiy',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            color: ApplicationColors.alizarin,
                          ),
                        ),
                        Text(
                          'Price',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            color: ApplicationColors.alizarin,
                          ),
                        ),
                      ]),
                      ...List.generate(
                          controller.details.length,
                          (index) => TableRow(children: [
                                Text(
                                  '${controller.details[index]['i_name']}',
                                  textAlign: TextAlign.center,
                                ),
                                Text(
                                  '${controller.details[index]['countitems']}',
                                  textAlign: TextAlign.center,
                                ),
                                Text(
                                  '${controller.details[index]['sumpricediscountitems']}',
                                  textAlign: TextAlign.center,
                                ),
                              ])),
                    ],
                  ),
                  const Divider(
                    endIndent: 10.0,
                    indent: 10.0,
                    thickness: 2,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 75.0, right: 90.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Totalprice :',
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '${controller.orderAddressModel!.ordersTotalprice} \$',
                          style: TextStyle(
                            fontSize: 25.0,
                            color: ApplicationColors.alizarin,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ));
  }
}
