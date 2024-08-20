import 'package:ecommerc2/core/class/AppRouting.dart';
import 'package:ecommerc2/core/class/crud.dart';
import 'package:ecommerc2/core/costant/StatusRequest.dart';
import 'package:ecommerc2/core/function/handlingData.dart';
import 'package:ecommerc2/core/services/services.dart';
import 'package:ecommerc2/data/datasource/remote/AfterRegister/address/address.dart';
import 'package:ecommerc2/data/datasource/remote/AfterRegister/checkout/checkout.dart';
import 'package:get/get.dart';

abstract class Abs_Checkout_controller extends GetxController {
  Contaddress contaddress = Contaddress(crud: Crud());

  Contcheckout contcheckout = Contcheckout(crud: Crud());

  Myservices myservices = Get.find();

  Statusrequest? statusrequest;

  int? paymentmethod;

  int? delivary;

  int? totalpriceorder;

  int? pricedelivary;

  int discountcoupon = 0;

  int? couponid;

  int addressid = 0;

  List address = [];

  getData();

  choosepayment(val);

  choosedelivary(val);

  chooseaddress(val);

  executeorder();

  initialData();
}

class Checkout_controller extends Abs_Checkout_controller {
  @override
  void onInit() {
    getData();
    initialData();
    super.onInit();
  }

  @override
  getData() async {
    address.clear();

    statusrequest = Statusrequest.loading;

    var response =
        await contaddress.viewData(myservices.sharedpre.getString('userid')!);

    statusrequest = handlingData(response);

    if (statusrequest == Statusrequest.success) {
      address.addAll(response['data']);
    }
    update();
  }

  @override
  chooseaddress(val) {
    addressid = val;
    update();
  }

  @override
  choosedelivary(val) {
    // Drive => 0
    // Delivary =>1
    delivary = val;
    update();
  }

  @override
  choosepayment(val) {
    // cash => 0
    // payment => 1
    paymentmethod = val;
    update();
  }

  @override
  executeorder() async {
    statusrequest = Statusrequest.loading;
    if (delivary == null) {
      return Get.snackbar('ERROR', 'PLEASE ENTER THE DELIVARY');
    }
    if (paymentmethod == null) {
      return Get.snackbar('ERROR', 'PLEASE ENTER THE PAYMETHOD');
    }

    if (delivary == 1 && addressid == 0) {
      return Get.snackbar('ERROR', 'PLEASE ENTER THE address');
    }

    var response = await contcheckout.addorder(
      myservices.sharedpre.getString('userid')!,
      couponid.toString(),
      delivary.toString(),
      paymentmethod.toString(),
      addressid.toString(),
      totalpriceorder.toString(),
      pricedelivary.toString(),
      discountcoupon.toString(),
    );
    statusrequest = handlingData(response);

    if (statusrequest == Statusrequest.success) {
      Get.offAllNamed(AppRouting.homescrean);
    }
  }

  @override
  initialData() {
    couponid = Get.arguments['couponid'];
    totalpriceorder = Get.arguments['totalpriceorder'];
    discountcoupon = Get.arguments['discountcoupon'];
  }
}
