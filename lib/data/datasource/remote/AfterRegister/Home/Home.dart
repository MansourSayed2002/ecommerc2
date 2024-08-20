import 'package:ecommerc2/core/class/crud.dart';
import 'package:ecommerc2/core/costant/links/linkserver.dart';

class Conthome {
  Conthome({required this.crud});

  Crud crud;

  get_Data() async {
    var response = await crud.PostData(Applink.home, {});
    return response.fold((l) => l, (r) => r);
  }

  searchdata(String search) async {
    var response = await crud.PostData(Applink.search, {
      "search": search,
    });
    return response.fold((l) => l, (r) => r);
  }
}
