import 'dart:io';

import 'package:ecommerc2/controller/AfterRegister/home/HomeScrean_controller.dart';
import 'package:ecommerc2/core/class/AppRouting.dart';
import 'package:ecommerc2/core/costant/color/AplicationColors.dart';
import 'package:ecommerc2/view/widget/AfterRegister/Home/Custom_BottomNavigationBar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScrean_view extends StatelessWidget {
  const HomeScrean_view({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(Homescrean_controller());
    return GetBuilder<Homescrean_controller>(
      builder: (controller) => Scaffold(
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          floatingActionButton: FloatingActionButton(
            backgroundColor: ApplicationColors.pomegranete,
            onPressed: () {
              Get.toNamed(AppRouting.mycart);
            },
            child: const Icon(Icons.shopping_bag_outlined),
          ),
          bottomNavigationBar: const Custom_BottomNavigationBar(),
          body: WillPopScope(
            child: controller.apppages.elementAt(controller.currentindex),
            onWillPop: () {
              Get.defaultDialog(
                title: 'Exit',
                content: const Text('Do you want close the app'),
                onConfirm: () {
                  exit(0);
                },
                onCancel: () {},
              );
              return Future.value(false);
            },
          )),
    );
  }
}
