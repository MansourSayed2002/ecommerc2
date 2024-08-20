import 'package:ecommerc2/core/costant/StatusRequest.dart';
import 'package:ecommerc2/core/costant/constlottie.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class HandlingDataView extends StatelessWidget {
  HandlingDataView(
      {super.key, required this.statusrequest, required this.widget});
  Widget widget;
  Statusrequest statusrequest = Statusrequest.none;
  @override
  Widget build(BuildContext context) {
    return statusrequest == Statusrequest.loading
        ? Center(child: Lottie.asset(Constlottie.lottieloading))
        : statusrequest == Statusrequest.offlinefailure
            ? Center(child: Lottie.asset(Constlottie.lottieoffline))
            : statusrequest == Statusrequest.nodatafailure
                ? Center(child: Lottie.asset(Constlottie.lottienodata))
                : statusrequest == Statusrequest.serverfailure
                    ? Center(child: Lottie.asset(Constlottie.lottieserver404))
                    : widget;
  }
}
