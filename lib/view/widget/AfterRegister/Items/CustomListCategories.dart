import 'package:ecommerc2/controller/AfterRegister/items/Items_controller.dart';
import 'package:ecommerc2/core/costant/color/AplicationColors.dart';
import 'package:ecommerc2/data/model/CategoriesModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Custom_List_Categories extends GetView<Items_controller> {
  const Custom_List_Categories({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 70.0,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: controller.categories.length,
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) => List_Categories(
            i: index,
            categoriesModel:
                CategoriesModel.fromJson(controller.categories[index]),
          ),
        ));
  }
}

class List_Categories extends StatelessWidget {
  List_Categories({
    super.key,
    required this.categoriesModel,
    required this.i,
  });
  CategoriesModel categoriesModel;

  int i;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<Items_controller>(
      builder: (controller) => InkWell(
        onTap: () {
          controller.changeindex(i, categoriesModel.cId!);
        },
        child: Column(
          children: [
            Container(
              color: Colors.amber,
              alignment: Alignment.center,
              width: 100.0,
              margin: const EdgeInsets.all(10.0),
              child: Text(
                categoriesModel.cName!,
                style: const TextStyle(
                  fontSize: 18.0,
                ),
              ),
            ),
            controller.selectindex == i
                ? Container(
                    width: 80.0,
                    height: 2.0,
                    decoration: BoxDecoration(
                      color: ApplicationColors.pomegranete,
                    ),
                  )
                : const SizedBox(),
          ],
        ),
      ),
    );
  }
}
