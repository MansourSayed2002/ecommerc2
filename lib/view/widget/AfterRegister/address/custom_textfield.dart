import 'package:ecommerc2/core/costant/color/AplicationColors.dart';
import 'package:flutter/material.dart';

class Custom_textField extends StatelessWidget {
  Custom_textField({
    super.key,
    required this.label,
    required this.mycontroller,
  });
  String? label;
  TextEditingController? mycontroller;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(15.0),
      child: TextFormField(
        controller: mycontroller,
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0),
              borderSide: BorderSide(
                color: ApplicationColors.black,
              )),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          contentPadding: const EdgeInsets.all(13.0),
          label: Text("$label"),
          labelStyle: TextStyle(
            fontSize: 25.0,
            color: ApplicationColors.alizarin,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
        ),
      ),
    );
  }
}
