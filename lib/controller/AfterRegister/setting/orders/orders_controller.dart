import 'package:ecommerc2/core/class/AppRouting.dart';
import 'package:ecommerc2/core/class/crud.dart';
import 'package:ecommerc2/core/costant/StatusRequest.dart';
import 'package:ecommerc2/core/function/handlingData.dart';
import 'package:ecommerc2/core/services/services.dart';
import 'package:ecommerc2/data/datasource/remote/AfterRegister/orders/orders.dart';
import 'package:get/get.dart';

abstract class Abst_orders_controller extends GetxController {
  Statusrequest statusrequest = Statusrequest.none;

  Contorders contorders = Contorders(crud: Crud());

  Myservices myservices = Get.find();

  List orders = [];

  getorders();

  ordertype(val);

  paymentmethod(val);

  orderstatus(val);

  gotoorderdetails(orderAddressModel);

  deleteorder(orderid);
}

class Orders_controller extends Abst_orders_controller {
  @override
  void onInit() {
    getorders();
    super.onInit();
  }

  @override
  getorders() async {
    orders.clear();
    statusrequest = Statusrequest.loading;

    var response =
        await contorders.getData(myservices.sharedpre.getString('userid')!);

    statusrequest = handlingData(response);

    if (statusrequest == Statusrequest.success) {
      orders.addAll(response['data']);
    }
    update();
  }

  @override
  deleteorder(orderid) async {
    statusrequest = Statusrequest.loading;

    var response = await contorders.deletedata(
        myservices.sharedpre.getString('userid')!, orderid.toString());

    statusrequest = handlingData(response);

    if (statusrequest == Statusrequest.success) {
      Get.snackbar('Delete', 'The request has been cleared');
      getorders();
    } else {
      Get.snackbar('Delete', 'do not delete the request ');
    }
    update();
  }

  @override
  ordertype(val) {
    if (val == 0) {
      return "Drive";
    } else {
      return "Delivary";
    }
  }

  @override
  paymentmethod(val) {
    if (val == 0) {
      return "Cash On Delivary";
    } else {
      return "Payment On Delivary";
    }
  }

  @override
  orderstatus(val) {
    if (val == 0) {
      return "Pending Approval";
    } else if (val == 1) {
      return "The Order is being prepared";
    } else if (val == 2) {
      return "On the May";
    } else if (val == 3) {
      return "Archive";
    }
  }

  @override
  gotoorderdetails(orderAddressModel) {
    Get.toNamed(AppRouting.orderdetails, arguments: {
      "orderAddressModel": orderAddressModel,
    });
  }
}
