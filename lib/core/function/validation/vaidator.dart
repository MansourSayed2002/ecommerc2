import 'package:get/get.dart';

validationinput(String value, int max, int min, String type) {
  if (type == 'username') {
    if (!GetUtils.isEmail(value)) {
      return 'it has error in email';
    }
  }

  if (value.isEmpty) {
    return "16".tr;
  } else if (value.length > max) {
    return "15".tr;
  } else if (value.length < min) {
    return "14".tr;
  }
}
