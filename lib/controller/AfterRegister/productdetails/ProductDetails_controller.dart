import 'package:ecommerc2/data/model/ItemsModel.dart';
import 'package:get/get.dart';

abstract class Abs_Productdetails_controller extends GetxController {
  late Itemsmodel itemsmodel;

  bool desc = false;

  int count = 1;

  InitialData();

  changedesc();

  addcount();

  removecount();
}

class ProductDetails_controller extends Abs_Productdetails_controller {
  @override
  void onInit() {
    InitialData();
    super.onInit();
  }

  @override
  InitialData() {
    itemsmodel = Get.arguments['itemsmodel'];
  }

  @override
  changedesc() {
    desc == false ? desc = true : desc = false;
    update();
  }

  @override
  addcount() {
    count++;
    update();
  }

  @override
  removecount() {
    if (count > 1) {
      count--;
      update();
    }
  }
}
