import 'package:ecommerc2/controller/test_controller.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Test extends StatelessWidget {
  const Test({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(Test_controller());
    return Scaffold(
      backgroundColor: Colors.amber,
      body: Center(
          child: ElevatedButton(
        child: const Text('sss'),
        onPressed: () {
          FirebaseMessaging.instance.subscribeToTopic('user');
        },
      )),
    );
  }
}
