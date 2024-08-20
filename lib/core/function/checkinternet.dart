import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

CheckInternet() async {
  try {
    var result = await InternetAddress.lookup("google.com");

    if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
      return true;
    }
  } on SocketException catch (e) {
    print('erorr=================$e');
    return Get.defaultDialog(
      title: 'No Internet',
      content: const Text('Please Check The Internet'),
    );
  }
}
