import 'package:ecommerc2/core/class/AppRouting.dart';
import 'package:ecommerc2/core/class/crud.dart';
import 'package:ecommerc2/core/costant/StatusRequest.dart';
import 'package:ecommerc2/core/function/handlingData.dart';
import 'package:ecommerc2/core/services/services.dart';
import 'package:ecommerc2/data/datasource/remote/AfterRegister/Items/items.dart';
import 'package:ecommerc2/data/model/ItemsModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class Abs_Items_controller extends GetxController {
  Statusrequest statusrequest = Statusrequest.none;

  ContItems contItems = ContItems(crud: Crud());

  Myservices myservices = Get.find();

  int? selectindex;

  int? idcate;

  TextEditingController? textcontroller;

  bool issearch = false;

  List categories = [];

  List items = [];

  List<Itemsmodel> searchdata = [];

  getData();

  initialData();

  searchData();

  checkissearch();

  onitemsearch();

  changeindex(int index, int idcat);

  GoToProductPage(Itemsmodel itemsmodel);
}

class Items_controller extends Abs_Items_controller {
  @override
  void onInit() {
    initialData();
    getData();
    textcontroller = TextEditingController();
    super.onInit();
  }

  @override
  getData() async {
    statusrequest = Statusrequest.loading;

    var response = await contItems.getData(
        idcate!, myservices.sharedpre.getString('userid')!);

    statusrequest = handlingData(response);
    update();
    if (statusrequest == Statusrequest.success) {
      items.addAll(response['data']);
    }
    update();
  }

  @override
  initialData() {
    categories = Get.arguments['categories'];

    selectindex = Get.arguments['index'];

    idcate = Get.arguments['id_cat'];
  }

  @override
  changeindex(index, idcat) {
    selectindex = index;
    idcate = idcat;
    items.clear();
    getData();
    update();
  }

  @override
  GoToProductPage(Itemsmodel itemsmodel) {
    Get.toNamed(AppRouting.Productdetails,
        arguments: {"itemsmodel": itemsmodel});
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
    print('object');
    searchData();
    update();
  }

  @override
  searchData() async {
    statusrequest = Statusrequest.loading;

    var response = await contItems.searchdata(textcontroller!.text);

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
}
