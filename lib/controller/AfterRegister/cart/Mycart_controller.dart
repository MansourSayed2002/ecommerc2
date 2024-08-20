import 'package:ecommerc2/controller/AfterRegister/cart/Cart_controller.dart';
import 'package:ecommerc2/core/class/AppRouting.dart';
import 'package:ecommerc2/core/class/crud.dart';
import 'package:ecommerc2/core/costant/StatusRequest.dart';
import 'package:ecommerc2/core/function/handlingData.dart';
import 'package:ecommerc2/core/services/services.dart';
import 'package:ecommerc2/data/datasource/remote/AfterRegister/cart/cart.dart';
import 'package:ecommerc2/data/model/CouponModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class Abt_Mycart_controller extends GetxController {
  Statusrequest statusrequest = Statusrequest.none;

  Cart_controller cart_controller = Get.put(Cart_controller());

  Contcart contcart = Contcart(crud: Crud());

  Myservices myservices = Get.find();

  CouponModel? couponModel;

  TextEditingController? textcontroller;

  int discountcoupon = 0;

  int totalpriceorder = 0;

  int couponid = 0;

  String? couponname;

  List itemcart = [];

  int discount = 0;

  Map total = {};

  getdata();

  GoToChckoutPage();
}

class Mycart_controller extends Abt_Mycart_controller {
  @override
  void onInit() {
    textcontroller = TextEditingController();
    getdata();
    super.onInit();
  }

  @override
  getdata() async {
    statusrequest = Statusrequest.loading;
    itemcart.clear();
    total.cast();
    var response = await contcart.viewcart('42');

    statusrequest = handlingData(response);

    if (statusrequest == Statusrequest.success) {
      itemcart.addAll(response['data']);

      total.addAll(response['total']);
      discount = response['total']['totalprice'] -
          response['total']['discounttotalprice'];
      totalpriceorder = response['total']['discounttotalprice'];
    }
    update();
  }

  insertdata(itemid, counter) async {
    statusrequest = Statusrequest.loading;
    var response =
        await contcart.addcart('42', itemid.toString(), counter.toString());

    statusrequest = handlingData(response);

    if (statusrequest == Statusrequest.success) {
      getdata();
    }
    update();
  }

  deletedata(itemid) async {
    statusrequest = Statusrequest.loading;
    var response = await contcart.deletecart(
        myservices.sharedpre.getString('userid')!, itemid.toString());
    statusrequest = handlingData(response);
    if (statusrequest == Statusrequest.success) {
      getdata();
    }
    update();
  }

  @override
  GoToChckoutPage() {
    if (itemcart.isNotEmpty) {
      Get.toNamed(AppRouting.checkout, arguments: {
        "totalpriceorder": totalpriceorder,
        "couponid": couponid,
        "discountcoupon": discountcoupon,
      });
    }
  }

  @override
  checkcoupon() async {
    statusrequest = Statusrequest.loading;

    var response = await contcart.checkcoupon(textcontroller!.text);

    statusrequest = handlingData(response);

    if (statusrequest == Statusrequest.success) {
      Map<String, dynamic> coupondata = response['data'];

      couponModel = CouponModel.fromJson(coupondata);
      discountcoupon = couponModel!.couponDicount!;
      couponname = couponModel!.couponName;
      couponid = couponModel!.couponId!;
      totalpriceorder =
          totalpriceorder - (totalpriceorder * discountcoupon ~/ 100);
    } else {
      statusrequest = Statusrequest.none;
      discountcoupon = 0;
    }
    update();
  }
}
