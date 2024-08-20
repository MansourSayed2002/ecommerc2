import 'package:ecommerc2/view/widget/AfterRegister/setting/Custom_ButtomSetting.dart';
import 'package:ecommerc2/view/widget/AfterRegister/setting/Custom_imageprofile.dart';
import 'package:flutter/material.dart';

class Setting_view extends StatelessWidget {
  const Setting_view({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        Custom_imageProfile(),
        Custom_ButtomSetting(),
      ],
    );
  }
}
