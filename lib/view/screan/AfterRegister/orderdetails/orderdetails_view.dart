import 'package:ecommerc2/controller/AfterRegister/orderdetails/Orderdetails_controller.dart';
import 'package:ecommerc2/core/costant/color/AplicationColors.dart';
import 'package:ecommerc2/view/widget/AfterRegister/orderdetails/Custom_tabledetails.dart';
import 'package:ecommerc2/view/widget/AfterRegister/orderdetails/Cutom_detailsaddress.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Orderdetails_view extends StatelessWidget {
  const Orderdetails_view({super.key});

  @override
  Widget build(BuildContext context) {
    Orderdetails_controller controller = Get.put(Orderdetails_controller());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ApplicationColors.alizarin,
        elevation: 0.0,
        centerTitle: true,
        title: Text(
          'OrderDetails',
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            color: ApplicationColors.white,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: Column(
        children: const [
          Custom_tabledetails(),
          Custom_detailsAddress(),
        ],
      ),
    );
  }
}
