import 'package:ecommerc2/controller/AfterRegister/checkout/checkouot_controller.dart';
import 'package:ecommerc2/core/costant/color/AplicationColors.dart';
import 'package:ecommerc2/view/widget/AfterRegister/checkout/Custom_chooseaddress.dart';
import 'package:ecommerc2/view/widget/AfterRegister/checkout/Custom_delivarytype.dart';
import 'package:ecommerc2/view/widget/AfterRegister/checkout/custom_choosepayment.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Checkout_view extends StatelessWidget {
  const Checkout_view({super.key});

  @override
  Widget build(BuildContext context) {
    Checkout_controller controller = Get.put(Checkout_controller());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ApplicationColors.white,
        elevation: 0.0,
        centerTitle: true,
        title: Text(
          'Checkout',
          style: TextStyle(
            fontSize: 25.0,
            fontWeight: FontWeight.bold,
            color: ApplicationColors.alizarin,
          ),
        ),
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              Icons.arrow_back,
              color: ApplicationColors.alizarin,
            )),
      ),
      floatingActionButton: InkWell(
        onTap: () {
          controller.executeorder();
        },
        child: Container(
          height: 50,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: ApplicationColors.alizarin,
          ),
          width: MediaQuery.of(context).size.width,
          child: Text(
            'Checkout',
            style: TextStyle(
              fontSize: 25.0,
              color: ApplicationColors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: Container(
        margin: const EdgeInsets.all(13.0),
        child:
            ListView(physics: const BouncingScrollPhysics(), children: const [
          Custom_choosepayment(),
          Custom_DelivaryType(),
          Custom_chooseAddress(),
        ]),
      ),
    );
  }
}
