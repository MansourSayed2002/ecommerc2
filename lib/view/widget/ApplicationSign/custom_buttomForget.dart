import 'package:ecommerc2/core/costant/color/AplicationColors.dart';
import 'package:flutter/material.dart';

class Custom_buttomforget extends StatelessWidget {
  Custom_buttomforget({
    super.key,
    required this.title,
    required this.ontap,
  });
  String title;
  VoidCallback ontap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0),
      child: InkWell(
        onTap: ontap,
        child: Text(
          title,
          style: TextStyle(
            color: ApplicationColors.blue,
            fontSize: 15.0,
            fontWeight: FontWeight.w800,
            letterSpacing: 1.0,
            decoration: TextDecoration.underline,
          ),
        ),
      ),
    );
  }
}
