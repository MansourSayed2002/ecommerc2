import 'package:ecommerc2/core/class/crud.dart';
import 'package:ecommerc2/core/costant/links/linkserver.dart';

class Contforgetpassword {
  Contforgetpassword({required this.crud});

  Crud crud;

  get_Data(String email) async {
    var response = await crud.PostData(Applink.checkemail, {
      "users_email": email,
    });

    return response.fold((l) => l, (r) => r);
  }
}
