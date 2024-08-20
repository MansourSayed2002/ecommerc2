import 'package:ecommerc2/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Myservices extends GetxService {
  late SharedPreferences sharedpre;

  getcurrentposition() async {
    bool serviceenable;
    serviceenable = await Geolocator.isLocationServiceEnabled();
    if (!serviceenable) {
      return;
    }
    LocationPermission locationPermission = await Geolocator.checkPermission();

    if (locationPermission == LocationPermission.denied) {
      locationPermission = await Geolocator.requestPermission();

      if (locationPermission == LocationPermission.denied) {}

      if (locationPermission == LocationPermission.deniedForever) {}
    }
  }

  Future<Myservices> init() async {
    sharedpre = await SharedPreferences.getInstance();
    getcurrentposition();
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    return this;
  }
}

Future initservices() async {
  await Get.putAsync(() => Myservices().init());
}
