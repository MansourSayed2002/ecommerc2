import 'package:ecommerc2/core/class/crud.dart';
import 'package:ecommerc2/core/costant/StatusRequest.dart';
import 'package:ecommerc2/core/function/handlingData.dart';
import 'package:ecommerc2/core/services/services.dart';
import 'package:ecommerc2/data/datasource/remote/AfterRegister/address/address.dart';
import 'package:get/get.dart';

class Viewaddress_controller extends GetxController {
  Statusrequest? statusrequest;

  Contaddress contaddress = Contaddress(crud: Crud());

  Myservices myservices = Get.find();

  List address = [];

  @override
  void onInit() {
    getData();
    super.onInit();
  }

  getData() async {
    address.clear();
    statusrequest = Statusrequest.loading;
    update();
    var response =
        await contaddress.viewData(myservices.sharedpre.getString('userid')!);

    statusrequest = handlingData(response);

    if (statusrequest == Statusrequest.success) {
      address.addAll(response['data']);
    }
    update();
  }

  deletedata(addressid) async {
    statusrequest = Statusrequest.loading;
    update();
    var response = await contaddress.deleteData(
        myservices.sharedpre.getString('userid')!, addressid.toString());

    statusrequest = handlingData(response);

    if (statusrequest == Statusrequest.success) {
      Get.rawSnackbar(title: 'Delete', message: 'Address Deleted');
      getData();
    }
    update();
  }
}
