import 'package:ecommerc2/core/class/crud.dart';
import 'package:ecommerc2/core/costant/StatusRequest.dart';
import 'package:ecommerc2/core/function/handlingData.dart';
import 'package:ecommerc2/data/datasource/remote/AfterRegister/orderdetails/orderdetails.dart';
import 'package:ecommerc2/data/model/OrderAddressModel.dart';
import 'package:get/get.dart';

abstract class Abst_Orderdetails_controller extends GetxController {
  Contorderdetails contorderdetails = Contorderdetails(crud: Crud());

  Statusrequest statusrequest = Statusrequest.none;

  List details = [];

  OrderAddressModel? orderAddressModel;

  get_Data();

  initData();
}

class Orderdetails_controller extends Abst_Orderdetails_controller {
  @override
  void onInit() {
    initData();
    get_Data();
    super.onInit();
  }

  @override
  initData() {
    orderAddressModel = Get.arguments['orderAddressModel'];
  }

  @override
  get_Data() async {
    statusrequest = Statusrequest.loading;

    details.clear();

    var response =
        await contorderdetails.viewdata(orderAddressModel!.ordersId.toString());

    statusrequest = handlingData(response);

    if (statusrequest == Statusrequest.success) {
      details.addAll(response['data']);
    }
    update();
  }
}
