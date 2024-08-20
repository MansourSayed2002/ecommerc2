import 'dart:async';

import 'package:ecommerc2/core/class/AppRouting.dart';
import 'package:ecommerc2/core/class/crud.dart';
import 'package:ecommerc2/core/costant/StatusRequest.dart';
import 'package:ecommerc2/core/costant/distanceprice.dart';
import 'package:ecommerc2/core/function/handlingData.dart';
import 'package:ecommerc2/core/services/services.dart';
import 'package:ecommerc2/data/datasource/remote/AfterRegister/address/address.dart';
import 'package:flutter/widgets.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Addaddress_controller extends GetxController {
  TextEditingController? city;

  Contaddress contaddress = Contaddress(crud: Crud());

  Myservices myservices = Get.find();

  TextEditingController? country;

  TextEditingController? street;

  Statusrequest? statusrequest;

  double? lat;

  double pricedelivary = 0;

  double? long;

  Position? position;

  late final Completer<GoogleMapController>? googlecompleter;

  CameraPosition? cameraPosition;

  getcurrentposition() async {
    position = await Geolocator.getCurrentPosition();
    //   cameraPosition = CameraPosition(
    //     target: LatLng(position!.altitude, position!.longitude), zoom: 14.5);
    lat = position!.latitude;
    long = position!.longitude;
    double space =
        Geolocator.distanceBetween(30.037997, 31.242087, 30.037868, 31.242710);
    print(space);
    pricedelivary = distanceprice * space;
  }

  addData() async {
    statusrequest = Statusrequest.loading;

    var response = await contaddress.addData(
      myservices.sharedpre.getString('userid')!,
      country!.text,
      city!.text,
      street!.text,
      lat!,
      long!,
      pricedelivary.round(),
    );

    statusrequest = handlingData(response);

    if (statusrequest == Statusrequest.success) {
      Get.rawSnackbar(
        title: 'العنوان',
        messageText: const Text('تم اضافه العنوان'),
      );
      Get.offAllNamed(AppRouting.address);
    }
  }

  @override
  void onInit() {
    googlecompleter = Completer<GoogleMapController>();

    country = TextEditingController();

    city = TextEditingController();

    street = TextEditingController();

    getcurrentposition();

    super.onInit();
  }
}
