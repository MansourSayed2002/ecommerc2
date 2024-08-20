import 'package:ecommerc2/core/costant/color/AplicationColors.dart';
import 'package:flutter/material.dart';

class custom_GoToPage extends StatelessWidget {
  custom_GoToPage({
    super.key,
    required this.title,
    required this.ontap,
  });
  String title;
  VoidCallback ontap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        width: MediaQuery.of(context).size.width,
        alignment: Alignment.center,
        child: Text(
          title,
          style: const TextStyle(
              fontSize: 18.0, fontWeight: FontWeight.normal, letterSpacing: .5),
        ),
      ),
    );
  }
}
