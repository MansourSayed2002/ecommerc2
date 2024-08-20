import 'package:ecommerc2/core/costant/color/AplicationColors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppBarCart extends StatelessWidget {
  const AppBarCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          IconButton(
            icon: Icon(
              Icons.arrow_back_ios_new_sharp,
              color: ApplicationColors.black,
            ),
            onPressed: () {
              Get.back();
            },
          ),
          const SizedBox(
            width: 110.0,
          ),
          Text(
            'MyCart',
            style: TextStyle(
              color: ApplicationColors.grey2,
              fontWeight: FontWeight.bold,
              fontSize: 30.0,
            ),
          ),
        ],
      ),
    );
  }
}
