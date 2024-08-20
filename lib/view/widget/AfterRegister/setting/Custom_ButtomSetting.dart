import 'package:ecommerc2/data/datasource/static/datalist/List_ButtomSetting.dart';
import 'package:flutter/material.dart';

class Custom_ButtomSetting extends StatelessWidget {
  const Custom_ButtomSetting({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
        margin: const EdgeInsets.symmetric(vertical: 40.0, horizontal: 20.0),
        child: Column(children: [
          ...List.generate(
              listsetting.length,
              (index) => ButtomSetting(
                    title: '${listsetting[index].title}',
                    widget: listsetting[index].widget,
                    onTap: listsetting[index].ontap,
                  )),
        ]));
  }
}

class ButtomSetting extends StatelessWidget {
  ButtomSetting(
      {super.key,
      required this.title,
      required this.widget,
      required this.onTap});
  String title;
  Widget widget;
  void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 18.0),
            ),
            widget,
          ],
        ),
      ),
    );
  }
}
