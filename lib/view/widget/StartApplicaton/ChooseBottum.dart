import 'package:flutter/material.dart';

class ChooseButtom extends StatelessWidget {
  ChooseButtom({super.key, required this.title, required this.ontap});
  String? title;
  VoidCallback ontap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        padding: const EdgeInsets.all(10.0),
        margin: const EdgeInsets.all(10.0),
        alignment: Alignment.center,
        width: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.0),
          color: Colors.blue,
        ),
        child: Text(
          "$title",
          style: const TextStyle(
              fontSize: 30.0, fontWeight: FontWeight.bold, letterSpacing: 1.0),
        ),
      ),
    );
  }
}
