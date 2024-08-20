import 'package:flutter/material.dart';

class Custom_toexplainpage extends StatelessWidget {
  Custom_toexplainpage({
    super.key,
    required this.title,
    required this.subtitle,
  });
  String title;
  String subtitle;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(30.0),
      child: Column(
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 30.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            subtitle,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
