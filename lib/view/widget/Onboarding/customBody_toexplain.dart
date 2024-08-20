import 'package:flutter/material.dart';

class customBody_toexplain extends StatelessWidget {
  customBody_toexplain(
      {super.key,
      required this.image,
      required this.tiltebody,
      required this.title});
  String image;
  String? title;
  String? tiltebody;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "$title",
          style: const TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
        ),
        Container(
          margin: const EdgeInsets.only(top: 20.0, bottom: 30.0),
          width: 250,
          height: 300,
          decoration: BoxDecoration(
              image:
                  DecorationImage(image: AssetImage(image), fit: BoxFit.fill)),
        ),
        Text(
          "$tiltebody",
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
