import 'package:ecommerc2/view/screan/AfterRegister/Setting/Setting_view.dart';
import 'package:ecommerc2/view/screan/AfterRegister/home/home_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class Abs_Homescrean_controller extends GetxController {
  changepage(int currentindex);
}

class Homescrean_controller extends Abs_Homescrean_controller {
  int currentindex = 0;

  List apppages = [
    const Home_view(),
    const Center(
      child: Text('notification'),
    ),
    const Center(
      child: Text('profile'),
    ),
    const Setting_view(),
  ];

  @override
  changepage(int index) {
    currentindex = index;
    update();
  }
}
