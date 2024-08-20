import 'package:ecommerc2/core/costant/color/AplicationColors.dart';
import 'package:flutter/material.dart';

class Custom_Debitcard extends StatelessWidget {
  Custom_Debitcard({
    super.key,
    required this.body,
    required this.title,
  });
  String title;
  String body;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              color: ApplicationColors.alizarin,
            ),
            height: 150.0,
            child: ListTile(
              title: Text(title,
                  style: TextStyle(
                      color: ApplicationColors.white, fontSize: 20.0)),
              subtitle: Text(body,
                  style: TextStyle(
                      color: ApplicationColors.white, fontSize: 30.0)),
            ),
          ),
          Positioned(
            top: -20,
            right: -20,
            child: Container(
              width: 160,
              height: 160,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: ApplicationColors.pomegranete,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
