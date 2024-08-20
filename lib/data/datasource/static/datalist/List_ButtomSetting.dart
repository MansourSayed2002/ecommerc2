import 'package:ecommerc2/controller/AfterRegister/setting/Setting_controller/Setting_controller.dart';
import 'package:ecommerc2/core/class/AppRouting.dart';
import 'package:ecommerc2/data/model/SettingModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Setting_controller controller = Get.put(Setting_controller());

List<SettingModel> listsetting = [
  SettingModel(
    title: "Disable Notification",
    widget: Switch(
      onChanged: (value) {},
      value: true,
    ),
    ontap: () {},
  ),
  SettingModel(
      title: "Address",
      widget: const Icon(Icons.location_city_outlined),
      ontap: () {
        Get.toNamed(AppRouting.address);
      }),
  SettingModel(
      title: "Orders",
      widget: const Icon(Icons.card_travel_outlined),
      ontap: () {
        Get.toNamed(AppRouting.order);
      }),
  SettingModel(
      title: "About Us", widget: const Icon(Icons.help_outline), ontap: () {}),
  SettingModel(
      title: "Contact Us",
      widget: const Icon(Icons.phone_callback_outlined),
      ontap: () {
        controller.contactus();
      }),
  SettingModel(
      title: "Long Out",
      widget: const Icon(Icons.exit_to_app_outlined),
      ontap: () {
        controller.longout();
      }),
];
