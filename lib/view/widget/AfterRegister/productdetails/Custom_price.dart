import 'package:ecommerc2/controller/AfterRegister/productdetails/ProductDetails_controller.dart';
import 'package:ecommerc2/core/costant/color/AplicationColors.dart';
import 'package:ecommerc2/core/costant/links/linkserver.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class Custom_price extends GetView<ProductDetails_controller> {
  const Custom_price({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Hero(
          tag: "${controller.itemsmodel.iId}",
          child: Container(
            height: 200,
            width: 200,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(
                      '${Applink.serverimage}/${controller.itemsmodel.iImage!}'),
                  fit: BoxFit.contain),
            ),
          ),
        ),
        controller.itemsmodel.iPrice == controller.itemsmodel.discountprice
            ? Column(
                children: [
                  Text(
                    '${controller.itemsmodel.iName}',
                    style: TextStyle(
                      fontSize: 30.0,
                      color: ApplicationColors.white,
                    ),
                  ),
                  Text(
                    '\$${controller.itemsmodel.iPrice}',
                    style: TextStyle(
                      fontSize: 30.0,
                      color: ApplicationColors.white,
                    ),
                  ),
                ],
              )
            : Column(
                children: [
                  Text(
                    '${controller.itemsmodel.iName}',
                    style: TextStyle(
                      fontSize: 30.0,
                      color: ApplicationColors.white,
                    ),
                  ),
                  Text(
                    '\$${controller.itemsmodel.iPrice}',
                    style: TextStyle(
                        fontSize: 30.0,
                        color: ApplicationColors.white,
                        decoration: TextDecoration.lineThrough),
                  ),
                  Text(
                    '\$${controller.itemsmodel.discountprice}',
                    style: TextStyle(
                      fontSize: 30.0,
                      color: ApplicationColors.white,
                    ),
                  ),
                ],
              )
      ],
    );
  }
}
