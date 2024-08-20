import 'package:ecommerc2/controller/AfterRegister/setting/Address/Addaddress.dart';
import 'package:ecommerc2/core/costant/color/AplicationColors.dart';
import 'package:ecommerc2/view/widget/AfterRegister/address/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Addaddress_view extends StatelessWidget {
  const Addaddress_view({super.key});

  @override
  Widget build(BuildContext context) {
    Addaddress_controller controllerpage = Get.put(Addaddress_controller());
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,
        backgroundColor: ApplicationColors.alizarin,
        title: const Text(
          'Add Address',
          style: TextStyle(fontSize: 25.0),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            size: 30.0,
          ),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: ListView(
        children: [
          Custom_textField(
            label: 'Country',
            mycontroller: controllerpage.country,
          ),
          Custom_textField(
            label: 'City',
            mycontroller: controllerpage.city,
          ),
          Custom_textField(
            label: 'Street',
            mycontroller: controllerpage.street,
          ),
          InkWell(
            onTap: () {
              controllerpage.addData();
            },
            child: Container(
              color: ApplicationColors.alizarin,
              margin: const EdgeInsets.all(10.0),
              padding: const EdgeInsets.all(10.0),
              alignment: Alignment.center,
              child: Text(
                'save',
                style: TextStyle(
                  color: ApplicationColors.white,
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
