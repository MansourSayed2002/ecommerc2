import 'package:ecommerc2/core/costant/StatusRequest.dart';

handlingData(response) {
  if (response is Statusrequest) {
    return response;
  } else {
    if (response['status'] == 'success') {
      return Statusrequest.success;
    } else {
      return Statusrequest.nodatafailure;
    }
  }
}
