import 'package:ecommerc2/core/costant/StatusRequest.dart';
import 'package:ecommerc2/core/class/crud.dart';
import 'package:ecommerc2/core/function/handlingData.dart';
import 'package:ecommerc2/data/datasource/remote/forgetpassword/verifycode.dart';
import 'package:ecommerc2/view/screan/forgetpassword/ResetPassword_view.dart';
import 'package:get/get.dart';

abstract class Abs_Verifycode_forget_controller extends GetxController {
  String? email;
  checkverify(String codeverify);
  GoToResetPassword();
}

class Verifycode_forget_controller extends Abs_Verifycode_forget_controller {
  Contverifycode_forget contverifycode_forget =
      Contverifycode_forget(crud: Crud());

  late Statusrequest statusrequest;
  @override
  void onInit() {
    email = Get.arguments['email'];
    super.onInit();
  }

  @override
  GoToResetPassword() {
    Get.to(() => const ResetPassword_view(), arguments: {
      "email": email,
    });
  }

  @override
  checkverify(codeverify) async {
    statusrequest = Statusrequest.loading;

    var response = await contverifycode_forget.get_data(email!, codeverify);

    statusrequest = handlingData(response);
    if (response['status'] == 'success') {
      GoToResetPassword();
    }
  }
}
