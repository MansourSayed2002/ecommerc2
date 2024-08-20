import 'package:ecommerc2/core/class/crud.dart';
import 'package:ecommerc2/core/costant/StatusRequest.dart';
import 'package:ecommerc2/core/costant/color/AplicationColors.dart';
import 'package:ecommerc2/core/function/handlingData.dart';
import 'package:ecommerc2/core/services/services.dart';
import 'package:ecommerc2/data/datasource/remote/AfterRegister/favorite/favorite.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class Abs_favorite_controller extends GetxController {
  Map isfavorite = {};

  List favorite_items = [];

  Myservices myservices = Get.find();

  Contfavorite contfavorite = Contfavorite(crud: Crud());

  Statusrequest statusrequest = Statusrequest.none;

  addfavorite(String itemsid);

  removefavorite(String itemsid);

  setfavorite(key, value);

  getdata_favoite();
}

class Favorite_controller extends Abs_favorite_controller {
  @override
  void onInit() {
    getdata_favoite();
    super.onInit();
  }

  @override
  addfavorite(itemsid) async {
    statusrequest = Statusrequest.loading;

    var response = await contfavorite.addfavorite(
        itemsid, myservices.sharedpre.getString('userid')!);

    statusrequest = handlingData(response);
    update();
    if (statusrequest == Statusrequest.success) {
      Get.rawSnackbar(
        title: 'اضافه',
        messageText: Text(
          'تم اضافه  المنتج  الي المفضله',
          style: TextStyle(color: ApplicationColors.white),
        ),
      );
    }
    update();
  }

  @override
  removefavorite(itemsid) async {
    statusrequest = Statusrequest.loading;

    var response = await contfavorite.removefavorite(itemsid, '42');

    statusrequest = handlingData(response);

    print(response);
    if (statusrequest == Statusrequest.success) {
      Get.rawSnackbar(
        title: 'ازاله',
        messageText: Text(
          'تم ازاله  المنتج  من المفضله',
          style: TextStyle(color: ApplicationColors.white),
        ),
      );
    }
    update();
  }

  @override
  setfavorite(key, value) {
    isfavorite[key] = value;
    update();
  }

  @override
  getdata_favoite() async {
    favorite_items.clear();
    statusrequest = Statusrequest.loading;

    var response = await contfavorite.getdata('42');

    statusrequest = handlingData(response);

    if (statusrequest == Statusrequest.success) {
      favorite_items.addAll(response['data']);
    }
    update();
  }
}
