import 'package:ecommerc2/core/class/crud.dart';
import 'package:ecommerc2/core/costant/links/linkserver.dart';

class Contorderdetails {
  Contorderdetails({required this.crud});

  Crud crud;
  viewdata(String orderid) async {
    var response = await crud.PostData(Applink.orderdetails, {
      "orderid": orderid,
    });

    return response.fold((l) => l, (r) => r);
  }
}
