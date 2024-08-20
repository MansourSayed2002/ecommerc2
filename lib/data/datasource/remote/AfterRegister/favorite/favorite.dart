import 'package:ecommerc2/core/class/crud.dart';
import 'package:ecommerc2/core/costant/links/linkserver.dart';

class Contfavorite {
  Contfavorite({required this.crud});

  Crud crud;

  addfavorite(String itemsid, String userid) async {
    var response = await crud.PostData(Applink.favoriteAdd, {
      "userid": userid,
      "itemid": itemsid,
    });

    return response.fold((l) => l, (r) => r);
  }

  removefavorite(String itemsid, String userid) async {
    var response = await crud.PostData(Applink.favoriteRemove, {
      "itemid": itemsid,
      "userid": userid,
    });

    return response.fold((l) => l, (r) => r);
  }

  getdata(String userid) async {
    var response = await crud.PostData(Applink.favoriteView, {
      "userid": userid,
    });

    return response.fold((l) => l, (r) => r);
  }
}
