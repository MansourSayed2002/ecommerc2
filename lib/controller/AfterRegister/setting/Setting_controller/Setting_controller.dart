import 'package:ecommerc2/core/class/AppRouting.dart';
import 'package:ecommerc2/core/services/services.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

abstract class Abst_setting_controller extends GetxController {
  Myservices myservices = Get.find();
  longout();
  contactus();
}

class Setting_controller extends Abst_setting_controller {
  @override
  longout() {
    String? id = myservices.sharedpre.getString('userid');
    FirebaseMessaging.instance.unsubscribeFromTopic('mansour');
    FirebaseMessaging.instance.unsubscribeFromTopic('user$id');
    myservices.sharedpre.clear();
    Get.offAllNamed(AppRouting.register);
  }

  @override
  contactus() async {
    final url = Uri(scheme: 'tel', path: '+0201113912230');
    await launchUrl(url);
  }
}
