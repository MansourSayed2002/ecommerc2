import 'package:ecommerc2/core/costant/color/AplicationColors.dart';
import 'package:flutter/material.dart';

class Custom_AppBar extends StatelessWidget {
  Custom_AppBar({
    super.key,
    required this.onpressedicon,
    required this.onpressednotific,
    required this.hinttext,
    required this.onpressediconfavorite,
    required this.onchange,
    required this.mycontroller,
  });
  VoidCallback onpressedicon;
  void Function(String)? onchange;
  VoidCallback onpressednotific;
  VoidCallback onpressediconfavorite;
  String hinttext;
  TextEditingController? mycontroller;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Expanded(
              flex: 4,
              child: Container(
                margin: const EdgeInsets.only(right: 10.0),
                child: TextFormField(
                  onChanged: onchange,
                  controller: mycontroller,
                  decoration: InputDecoration(
                      prefixIcon: IconButton(
                        icon: const Icon(
                          Icons.search,
                          size: 25.0,
                        ),
                        onPressed: onpressedicon,
                      ),
                      hintStyle: const TextStyle(fontSize: 18.0),
                      hintText: hinttext,
                      filled: true,
                      fillColor: ApplicationColors.silver,
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(30.0))),
                ),
              )),
          Expanded(
              child: Container(
            padding: const EdgeInsets.only(
                top: 20.0, left: 11.0, right: 11.0, bottom: 20.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30.0),
              color: ApplicationColors.silver,
            ),
            child: InkWell(
                onTap: onpressednotific,
                child: Icon(
                  Icons.notifications_active_outlined,
                  color: ApplicationColors.black,
                  size: 30,
                )),
          )),
          const SizedBox(
            width: 10.0,
          ),
          Expanded(
              child: Container(
            padding: const EdgeInsets.only(
                top: 20.0, left: 11.0, right: 11.0, bottom: 20.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25.0),
              color: ApplicationColors.silver,
            ),
            child: InkWell(
                onTap: onpressediconfavorite,
                child: Icon(
                  Icons.favorite,
                  color: ApplicationColors.alizarin,
                  size: 30,
                )),
          )),
        ],
      ),
    );
  }
}
