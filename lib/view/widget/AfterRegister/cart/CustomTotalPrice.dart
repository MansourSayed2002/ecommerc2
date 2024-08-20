import 'package:ecommerc2/controller/AfterRegister/cart/Mycart_controller.dart';
import 'package:ecommerc2/core/costant/color/AplicationColors.dart';
import 'package:ecommerc2/view/screan/AfterRegister/cart/Mycart_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomTotalPrice extends StatelessWidget {
  const CustomTotalPrice({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<Mycart_controller>(
      builder: (controller) => SizedBox(
        height: 290,
        child: Column(
          children: [
            SizedBox(
              child: controller.couponname == null
                  ? Custom_entercoupon(
                      mycontroller: controller.textcontroller,
                      onTap: () {
                        controller.checkcoupon();
                      },
                    )
                  : Text(
                      'coupon:  ${controller.couponname}',
                      style: const TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 10.0, right: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Price',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                    ),
                  ),
                  controller.total['discounttotalprice'] == null
                      ? const Text('0\$')
                      : Text(
                          '${controller.total['discounttotalprice']} \$',
                          style: const TextStyle(fontSize: 18.0),
                        ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(
                left: 10.0,
                right: 10.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'discount',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                    ),
                  ),
                  Text(
                    '${controller.discount} \$',
                    style: const TextStyle(fontSize: 18.0),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(
                left: 10.0,
                right: 10.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Shipping',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                    ),
                  ),
                  Text(
                    '${controller.discountcoupon} %',
                    style: const TextStyle(fontSize: 18.0),
                  ),
                ],
              ),
            ),
            const Divider(
              height: 12.0,
              endIndent: 20.0,
              indent: 20.0,
              thickness: 1.5,
            ),
            Container(
              margin: const EdgeInsets.only(left: 10.0, right: 10.0, top: 5.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Total Price',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                    ),
                  ),
                  Text(
                    '${controller.totalpriceorder}\$',
                    style: TextStyle(
                        color: ApplicationColors.alizarin, fontSize: 20.0),
                  ),
                ],
              ),
            ),
            InkWell(
              onTap: () {
                controller.GoToChckoutPage();
                print(controller.couponid);
              },
              child: Container(
                alignment: Alignment.center,
                margin:
                    const EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
                padding: const EdgeInsets.all(7.0),
                width: MediaQuery.of(context).size.width,
                color: ApplicationColors.alizarin,
                child: Text(
                  'Order',
                  style: TextStyle(
                    color: ApplicationColors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.normal,
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
