import 'package:ecommerc2/core/class/crud.dart';
import 'package:ecommerc2/core/costant/links/linkserver.dart';

class Contregister {
  Contregister({required this.crud});

  Crud crud;

  Check_Data(String email, String password) async {
    var response = await crud.PostData(Applink.register, {
      "users_email": email,
      "users_password": password,
    });
    return response.fold((l) => l, (r) => r);
  }
}
