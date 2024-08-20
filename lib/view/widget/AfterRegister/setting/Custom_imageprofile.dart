import 'package:flutter/material.dart';

import '../../../../core/costant/color/AplicationColors.dart';

class Custom_imageProfile extends StatelessWidget {
  const Custom_imageProfile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: 200,
            decoration: BoxDecoration(
              color: ApplicationColors.alizarin,
            ),
          ),
          Positioned(
            top: 130,
            left: 130,
            child: Container(
              height: 130,
              width: 130,
              decoration: const BoxDecoration(
                color: Colors.amber,
                shape: BoxShape.circle,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
