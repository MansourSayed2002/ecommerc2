import 'package:ecommerc2/core/class/crud.dart';
import 'package:ecommerc2/core/costant/links/linkserver.dart';

class Contsignup {
  Crud crud;
  Contsignup(this.crud);
  upload_data(String name, String email, String password) async {
    var response = await crud.PostData(Applink.signup, {
      "users_name": name,
      "users_email": email,
      "users_password": password,
    });
    return response.fold((l) => l, (r) => r);
  }
}
