import 'package:ecommerc2/controller/AfterRegister/cart/Cart_controller.dart';
import 'package:ecommerc2/controller/AfterRegister/productdetails/ProductDetails_controller.dart';
import 'package:ecommerc2/core/costant/color/AplicationColors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Custom_DescAndAdd extends StatelessWidget {
  const Custom_DescAndAdd({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductDetails_controller>(
      builder: (controller) => Container(
        padding: const EdgeInsets.only(left: 15.0, right: 15.0),
        decoration: BoxDecoration(
          color: ApplicationColors.white,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
        ),
        height: Get.height / 1.5,
        child: ListView(
          children: [
            const Desc(),
            controller.desc == false
                ? const SizedBox()
                : Container(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      '${controller.itemsmodel.iDesc}',
                      style: const TextStyle(
                        fontSize: 18.0,
                      ),
                    ),
                  ),
            const SizedBox(
              height: 20.0,
            ),
            const Custom_Color(),
            const SizedBox(
              height: 20.0,
            ),
            const Count(),
            const SizedBox(
              height: 50.0,
            ),
            Buttom_Add(
              itemid: controller.itemsmodel.iId,
              counter: controller.count,
            ),
          ],
        ),
      ),
    );
  }
}

class Buttom_Add extends GetView<Cart_controller> {
  Buttom_Add({super.key, required this.itemid, required this.counter});
  var itemid;
  var counter;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.insertdata(itemid, counter);
      },
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(10.0),
        margin: const EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          color: ApplicationColors.alizarin,
          borderRadius: BorderRadius.circular(20.0),
        ),
        height: 50.0,
        child: Text(
          'Add',
          style: TextStyle(
            color: ApplicationColors.white,
            fontSize: 20.0,
          ),
        ),
      ),
    );
  }
}

class Count extends StatelessWidget {
  const Count({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductDetails_controller>(
        builder: (controller) => SizedBox(
              width: 300,
              child: Row(
                children: [
                  InkWell(
                    onTap: () {
                      controller.removecount();
                    },
                    child: const Icon(Icons.remove),
                  ),
                  Container(
                    alignment: Alignment.center,
                    width: 50,
                    height: 50,
                    margin: const EdgeInsets.all(20.0),
                    decoration: BoxDecoration(
                        border: Border.all(color: ApplicationColors.black)),
                    child: Text('${controller.count}'),
                  ),
                  InkWell(
                    onTap: () {
                      controller.addcount();
                    },
                    child: const Icon(
                      Icons.add,
                    ),
                  ),
                ],
              ),
            ));
  }
}

class Desc extends GetView<ProductDetails_controller> {
  const Desc({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          controller.changedesc();
        },
        child: Row(
          children: [
            const Icon(Icons.arrow_drop_down),
            Text(
              'Description',
              style: TextStyle(
                color: ApplicationColors.pomegranete,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.0,
              ),
            ),
          ],
        ));
  }
}

class Custom_Color extends StatelessWidget {
  const Custom_Color({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductDetails_controller>(
      builder: (controller) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Color',
            style: TextStyle(
              fontSize: 25.0,
              color: ApplicationColors.pomegranete,
              letterSpacing: 1.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          Container(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              children: [
                InkWell(
                  onTap: () {},
                  child: Container(
                    alignment: Alignment.center,
                    height: 70.0,
                    width: 70.0,
                    decoration: BoxDecoration(
                      color: ApplicationColors.black,
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Text(
                      'Black',
                      style: TextStyle(color: ApplicationColors.white),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10.0,
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                    alignment: Alignment.center,
                    height: 70.0,
                    width: 70.0,
                    decoration: BoxDecoration(
                      color: ApplicationColors.red,
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Text(
                      'Red',
                      style: TextStyle(color: ApplicationColors.white),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10.0,
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                    alignment: Alignment.center,
                    height: 70.0,
                    width: 70.0,
                    decoration: BoxDecoration(
                      color: ApplicationColors.blue,
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Text(
                      'blue',
                      style: TextStyle(color: ApplicationColors.white),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
