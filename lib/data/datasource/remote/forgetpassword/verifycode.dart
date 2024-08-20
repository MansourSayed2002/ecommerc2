import 'package:ecommerc2/core/class/crud.dart';
import 'package:ecommerc2/core/costant/links/linkserver.dart';

class Contverifycode_forget {
  Contverifycode_forget({required this.crud});

  Crud crud;

  get_data(String email, String verify) async {
    var response = await crud.PostData(Applink.verifycode_forget, {
      "users_email": email,
      "users_verifycode": verify,
    });
    return response.fold((l) => l, (r) => r);
  }
}