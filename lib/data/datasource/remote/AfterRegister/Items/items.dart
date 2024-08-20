import 'package:ecommerc2/core/class/crud.dart';
import 'package:ecommerc2/core/costant/links/linkserver.dart';

class ContItems {
  ContItems({required this.crud});

  Crud crud;

  getData(int idcat, String userid) async {
    var response = await crud.PostData(Applink.items, {
      "idcat": idcat.toString(),
      "userid": userid,
    });
    return response.fold((l) => l, (r) => r);
  }

  searchdata(String search) async {
    var response = await crud.PostData(Applink.search, {
      "search": search,
    });
    return response.fold((l) => l, (r) => r);
  }
}
