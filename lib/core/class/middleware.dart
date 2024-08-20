import 'package:ecommerc2/core/class/AppRouting.dart';
import 'package:ecommerc2/core/services/services.dart';
import 'package:flutter/src/widgets/navigator.dart';
import 'package:get/get.dart';

class Middle extends GetMiddleware {
  Myservices myservice = Get.find();
  @override
  int? get priority => 1;
  @override
  RouteSettings? redirect(String? route) {
    if (myservice.sharedpre.getString('step') == '1') {
      return const RouteSettings(name: AppRouting.signup);
    } else if (myservice.sharedpre.getString('step') == '2') {
      return const RouteSettings(name: AppRouting.homescrean);
    }
    return null;
  }
}
