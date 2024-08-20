import 'package:ecommerc2/core/class/AppRouting.dart';
import 'package:ecommerc2/core/class/crud.dart';
import 'package:ecommerc2/core/costant/StatusRequest.dart';
import 'package:ecommerc2/core/function/handlingData.dart';
import 'package:ecommerc2/data/datasource/remote/AfterRegister/Home/Home.dart';
import 'package:ecommerc2/data/model/ItemsModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class Abs_home_controller extends GetxController {
  Conthome conthome = Conthome(crud: Crud());

  Statusrequest statusrequest = Statusrequest.none;

  TextEditingController? textcontroller;

  bool issearch = false;

  List categories = [];

  List items = [];

  List<Itemsmodel> searchdata = [];

  get_data();

  checkissearch();

  GoToProductPage(Itemsmodel itemsmodel);

  onitemsearch();

  searchData();

  GoToItemsPage(List categ, int i, int idcat);
}

class Home_controller extends Abs_home_controller {
  @override
  void onInit() {
    textcontroller = TextEditingController();
    get_data();
    super.onInit();
  }

  @override
  get_data() async {
    statusrequest = Statusrequest.loading;
    categories.clear();
    items.clear();
    var response = await conthome.get_Data();

    statusrequest = handlingData(response);
    if (statusrequest == Statusrequest.success) {
      update();
      if (response['status'] == 'success') {
        categories.addAll(response['catigories']);
        items.addAll(response['items']);
      }
    }
  }

  @override
  GoToItemsPage(categ, i, idcat) {
    Get.toNamed('Items_view', arguments: {
      "categories": categ,
      "index": i,
      "id_cat": idcat,
    });
  }

  @override
  searchData() async {
    statusrequest = Statusrequest.loading;

    var response = await conthome.searchdata(textcontroller!.text);

    statusrequest = handlingData(response);
    if (statusrequest == Statusrequest.success) {
      update();
      if (response['status'] == 'success') {
        List data = response['data'];
        searchdata.addAll(data.map((e) => Itemsmodel.fromJson(e)));
      }
    }
    update();
  }

  @override
  checkissearch() {
    if (textcontroller!.text == "") {
      statusrequest = Statusrequest.none;
      issearch = false;
    }
    update();
  }

  @override
  onitemsearch() {
    issearch = true;
    searchData();
    update();
  }

  @override
  GoToProductPage(Itemsmodel itemsmodel) {
    Get.toNamed(AppRouting.Productdetails,
        arguments: {"itemsmodel": itemsmodel});
  }
}
