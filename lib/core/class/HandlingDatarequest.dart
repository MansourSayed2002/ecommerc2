import 'package:ecommerc2/core/costant/StatusRequest.dart';
import 'package:ecommerc2/core/costant/constlottie.dart';
import 'package:flutter/widgets.dart';
import 'package:lottie/lottie.dart';

class HandlingDataRequest extends StatelessWidget {
  Widget widget;
  Statusrequest statusrequest;
  HandlingDataRequest(
      {super.key, required this.widget, required this.statusrequest});

  @override
  Widget build(BuildContext context) {
    return statusrequest == Statusrequest.loading
        ? Lottie.asset(Constlottie.lottieloading)
        : statusrequest == Statusrequest.serverfailure
            ? Lottie.asset(Constlottie.lottieserver404)
            : widget;
  }
}
