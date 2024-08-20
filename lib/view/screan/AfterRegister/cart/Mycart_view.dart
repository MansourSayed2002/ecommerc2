import 'package:ecommerc2/controller/AfterRegister/cart/Mycart_controller.dart';
import 'package:ecommerc2/core/costant/color/AplicationColors.dart';
import 'package:ecommerc2/view/widget/AfterRegister/cart/AppBarCart.dart';
import 'package:ecommerc2/view/widget/AfterRegister/cart/CustomCardItems.dart';
import 'package:ecommerc2/view/widget/AfterRegister/cart/CustomTotalPrice.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Mycart_view extends StatelessWidget {
  const Mycart_view({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(Mycart_controller());
    return Scaffold(
      bottomNavigationBar: const CustomTotalPrice(),
      body: GetBuilder<Mycart_controller>(
        builder: (controller) => SafeArea(
          child: Wrap(
            children: [
              const AppBarCart(),
              Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(3.0),
                margin: const EdgeInsets.all(6.0),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25.0),
                  color: ApplicationColors.alizarin,
                ),
                child: Text(
                  'You have ${controller.total['totalcount']} items in Your cart',
                  style: const TextStyle(fontSize: 18.0),
                ),
              ),
              const CustomCardItems(),
            ],
          ),
        ),
      ),
    );
  }
}

class Custom_entercoupon extends StatelessWidget {
  Custom_entercoupon({
    super.key,
    required this.onTap,
    required this.mycontroller,
  });
  void Function()? onTap;
  TextEditingController? mycontroller;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: Container(
            margin: const EdgeInsets.only(left: 10.0, right: 10.0),
            child: TextFormField(
              controller: mycontroller,
              decoration: InputDecoration(
                hintText: 'coupon code',
                contentPadding: const EdgeInsets.all(10.0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(11.0),
                ),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: InkWell(
            onTap: onTap,
            child: Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(10.0),
                margin:
                    const EdgeInsets.only(left: 10.0, right: 10.0, top: 2.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7.0),
                  color: ApplicationColors.alizarin,
                ),
                child: Text(
                  'Apply',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    color: ApplicationColors.white,
                  ),
                )),
          ),
        ),
      ],
    );
  }
}
