import 'package:ecommerc2/core/class/crud.dart';
import 'package:ecommerc2/core/costant/links/linkserver.dart';

class Contaddress {
  Crud crud;

  Contaddress({required this.crud});

  viewData(String userid) async {
    var response = await crud.PostData(Applink.addressview, {
      "userid": userid,
    });
    return response.fold((l) => l, (r) => r);
  }

  addData(String userid, String country, String city, String street, double lat,
      double long, int pricedelivary) async {
    var response = await crud.PostData(Applink.addressadd, {
      "userid": userid,
      "country": country,
      "city": city,
      "street": street,
      "lat": lat.toString(),
      "long": long.toString(),
      "pricedelivary": pricedelivary.toString(),
    });
    return response.fold((l) => l, (r) => r);
  }

  deleteData(String userid, String addressid) async {
    var response = await crud.PostData(Applink.addressdelete, {
      "userid": userid,
      "addressid": addressid,
    });
    return response.fold((l) => l, (r) => r);
  }

  editData(String userid, String country, String city, String street,
      String lat, String long) async {
    var response = await crud.PostData(Applink.addressedit, {
      "userid": userid,
      "country": country,
      "city": city,
      "street": street,
      "lat": lat,
      "long": long,
    });
    return response.fold((l) => l, (r) => r);
  }
}
