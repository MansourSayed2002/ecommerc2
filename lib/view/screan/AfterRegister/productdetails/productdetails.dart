import 'package:ecommerc2/controller/AfterRegister/cart/Cart_controller.dart';
import 'package:ecommerc2/controller/AfterRegister/productdetails/ProductDetails_controller.dart';
import 'package:ecommerc2/core/costant/color/AplicationColors.dart';
import 'package:ecommerc2/view/widget/AfterRegister/productdetails/Custom_DescandAdd.dart';
import 'package:ecommerc2/view/widget/AfterRegister/productdetails/Custom_price.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductDetais_view extends StatelessWidget {
  const ProductDetais_view({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ProductDetails_controller());
    Get.put(Cart_controller());
    return Scaffold(
        backgroundColor: ApplicationColors.pomegranete,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: const [
            Custom_price(),
            Custom_DescAndAdd(),
          ],
        ));
  }
}
