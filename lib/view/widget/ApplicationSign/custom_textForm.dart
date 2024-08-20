import 'package:flutter/material.dart';

class custom_textForm extends StatelessWidget {
  custom_textForm({
    super.key,
    required this.label,
    required this.icon,
    required this.obscure,
    required this.controller,
    required this.validator,
  });
  String label;
  Widget icon;
  bool obscure;
  TextEditingController controller;
  String? Function(String?)? validator;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(15.0),
      child: TextFormField(
        validator: validator,
        controller: controller,
        obscureText: obscure,
        decoration: InputDecoration(
            suffixIcon: icon,
            label: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(label),
            ),
            floatingLabelBehavior: FloatingLabelBehavior.always,
            contentPadding: const EdgeInsets.all(13.0),
            labelStyle: const TextStyle(
              fontSize: 30.0,
            ),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(20.0))),
      ),
    );
  }
}
