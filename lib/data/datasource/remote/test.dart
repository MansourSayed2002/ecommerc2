import 'package:ecommerc2/core/class/crud.dart';
import 'package:ecommerc2/core/costant/links/linkserver.dart';

class Conttest {
  Conttest({required this.crud});

  Crud crud;

  get_Data(String id) async {
    var response = await crud.PostData(Applink.favoriteAdd, {
      "users_id": id,
    });

    return response.fold((l) => l, (r) => r);
  }
}
