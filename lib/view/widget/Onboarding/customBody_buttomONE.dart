import 'package:flutter/material.dart';

class customBody_buttomONE extends StatelessWidget {
  customBody_buttomONE({super.key, required this.title, required this.ontap});
  String? title;
  VoidCallback ontap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        alignment: Alignment.center,
        width: MediaQuery.of(context).size.width,
        margin: const EdgeInsets.only(
            left: 10.0, right: 10.0, bottom: 20.0, top: 10.0),
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(
                blurRadius: 10.0,
                color: Colors.blue,
                blurStyle: BlurStyle.normal,
                spreadRadius: 1,
                offset: Offset(0, 2))
          ],
          color: Colors.blue,
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Text(
          '$title',
          style: const TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
