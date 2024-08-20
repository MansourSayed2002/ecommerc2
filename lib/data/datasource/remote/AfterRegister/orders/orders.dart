import 'package:ecommerc2/core/class/crud.dart';
import 'package:ecommerc2/core/costant/links/linkserver.dart';

class Contorders {
  Contorders({required this.crud});

  Crud crud;

  getData(String userid) async {
    var response = await crud.PostData(Applink.orderview, {
      "userid": userid,
    });
    return response.fold((l) => l, (r) => r);
  }

  deletedata(String userid, String orderid) async {
    var response = await crud.PostData(Applink.orderdelete, {
      "userid": userid,
      "orderid": orderid,
    });
    return response.fold((l) => l, (r) => r);
  }
}
