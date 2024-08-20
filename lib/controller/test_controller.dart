import 'package:ecommerc2/core/class/crud.dart';
import 'package:ecommerc2/core/costant/StatusRequest.dart';
import 'package:ecommerc2/data/datasource/remote/test.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';

class Test_controller extends GetxController {
  Statusrequest statusrequest = Statusrequest.offlinefailure;

  Conttest conttest = Conttest(crud: Crud());

  @override
  void onInit() {
    gettoken();
    super.onInit();
  }

  gettoken() async {
    String? token = await FirebaseMessaging.instance.getToken();
    print(token);
    FirebaseMessaging.instance.subscribeToTopic('user');
  }
}
