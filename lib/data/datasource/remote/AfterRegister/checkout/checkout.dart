import 'package:ecommerc2/core/class/crud.dart';
import 'package:ecommerc2/core/costant/links/linkserver.dart';

class Contcheckout {
  Contcheckout({required this.crud});

  Crud crud;

  addorder(
    String userid,
    String couponid,
    String delivary,
    String paymentmethod,
    String address,
    String price,
    String pricedelivary,
    String discountcoupon,
  ) async {
    var response = await crud.PostData(Applink.addorder, {
      "userid": userid,
      "couponid": couponid,
      "delivery": delivary,
      "paymentmethod": paymentmethod,
      "address": address,
      "price": price,
      "pricedelivary": pricedelivary,
      "discountcoupon": discountcoupon,
    });

    return response.fold((l) => l, (r) => r);
  }
}
