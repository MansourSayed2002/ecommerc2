import 'package:ecommerc2/core/class/crud.dart';
import 'package:ecommerc2/core/costant/links/linkserver.dart';

class Contresetpassword {
  Contresetpassword({required this.crud});

  Crud crud;

  uploud_Data(String password, String repassword, String email) async {
    var response = await crud.PostData(Applink.resetpassword, {
      "users_password": password,
      "re_users_password": repassword,
      "users_email": email,
    });
    return response.fold((l) => l, (r) => r);
  }
}
