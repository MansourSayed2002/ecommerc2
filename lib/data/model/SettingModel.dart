import 'package:flutter/material.dart';

class SettingModel {
  SettingModel(
      {required this.title, required this.widget, required this.ontap});
  String? title;
  late Widget widget;
  late VoidCallback ontap;
}
