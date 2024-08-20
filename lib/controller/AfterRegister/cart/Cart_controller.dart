import 'package:ecommerc2/core/class/crud.dart';
import 'package:ecommerc2/core/costant/StatusRequest.dart';
import 'package:ecommerc2/core/function/handlingData.dart';
import 'package:ecommerc2/core/services/services.dart';
import 'package:ecommerc2/data/datasource/remote/AfterRegister/cart/cart.dart';
import 'package:get/get.dart';

class Cart_controller extends GetxController {
  Contcart contcart = Contcart(crud: Crud());

  Statusrequest statusrequest = Statusrequest.none;

  Myservices myservices = Get.find();

  getcount(itemid) async {
    statusrequest = Statusrequest.loading;

    var response = await contcart.getcount(
        myservices.sharedpre.getString('userid')!, itemid.toString());

    statusrequest = handlingData(response);

    if (statusrequest == Statusrequest.success) {
      int count = 0;
      count = response['counter'];
      print('add=============${response['counter']}=====');
      return count;
    }

    update();
  }

  insertdata(itemid, counter) async {
    statusrequest = Statusrequest.loading;
    var response = await contcart.addcart(
        myservices.sharedpre.getString('userid')!,
        itemid.toString(),
        counter.toString());
    statusrequest = handlingData(response);
    if (statusrequest == Statusrequest.success) {}
    update();
  }

  deletedata(itemid) async {
    statusrequest = Statusrequest.loading;
    var response = await contcart.deletecart(
        myservices.sharedpre.getString('userid')!, itemid.toString());
    statusrequest = handlingData(response);
    if (statusrequest == Statusrequest.success) {}
    update();
  }
}
