import 'package:ecommerc2/controller/AfterRegister/home/Home_controller.dart';
import 'package:ecommerc2/core/costant/color/AplicationColors.dart';
import 'package:ecommerc2/core/costant/links/linkserver.dart';
import 'package:ecommerc2/data/model/CategoriesModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Custom_Categories extends GetView<Home_controller> {
  const Custom_Categories({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Categories',
            style: TextStyle(
              fontSize: 25.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 140.0,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: controller.categories.length,
              itemBuilder: (context, index) => Categories(
                i: index,
                categoriesModel:
                    CategoriesModel.fromJson(controller.categories[index]),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Categories extends GetView<Home_controller> {
  Categories({super.key, required this.categoriesModel, required this.i});
  CategoriesModel categoriesModel;
  int? i;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        children: [
          InkWell(
            onTap: () {
              controller.GoToItemsPage(
                  controller.categories, i!, categoriesModel.cId!);
            },
            child: Container(
              width: 80.0,
              height: 80.0,
              margin: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  color: ApplicationColors.pomegranete,
                  image: DecorationImage(
                      image: NetworkImage(
                        "${Applink.serverimage}/${categoriesModel.cImage}",
                      ),
                      fit: BoxFit.fill)),
            ),
          ),
          Text(
            '${categoriesModel.cName}',
            style: const TextStyle(
              fontSize: 18.0,
            ),
          ),
        ],
      ),
    );
  }
}
