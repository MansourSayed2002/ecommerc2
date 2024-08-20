import 'package:ecommerc2/core/class/crud.dart';
import 'package:ecommerc2/core/costant/links/linkserver.dart';

class Contcart {
  Crud crud;

  Contcart({required this.crud});

  getcount(String userid, String itemid) async {
    var response = await crud.PostData(Applink.getcount, {
      "userid": userid,
      "itemid": itemid,
    });
    return response.fold((l) => l, (r) => r);
  }

  addcart(String userid, String itemid, String counter) async {
    var response = await crud.PostData(Applink.cartadd, {
      "userid": userid,
      "itemid": itemid,
      "counter": counter,
    });
    return response.fold((l) => l, (r) => r);
  }

  deletecart(String userid, String itemid) async {
    var response = await crud.PostData(Applink.cartdelete, {
      "userid": userid,
      "itemid": itemid,
    });
    return response.fold((l) => l, (r) => r);
  }

  viewcart(String userid) async {
    var response = await crud.PostData(Applink.cartview, {
      "userid": userid,
    });
    return response.fold((l) => l, (r) => r);
  }

  checkcoupon(String coupon) async {
    var response = await crud.PostData(Applink.checkcoupon, {
      "coupon": coupon,
    });
    return response.fold((l) => l, (r) => r);
  }
}
