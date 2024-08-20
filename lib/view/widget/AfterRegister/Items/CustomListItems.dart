import 'package:ecommerc2/controller/AfterRegister/items/Items_controller.dart';
import 'package:ecommerc2/controller/AfterRegister/favorite/favorite_controller.dart';
import 'package:ecommerc2/core/costant/color/AplicationColors.dart';
import 'package:ecommerc2/core/costant/links/linkserver.dart';
import 'package:ecommerc2/data/model/ItemsModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Custom_ListItems extends GetView<Items_controller> {
  const Custom_ListItems({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Favorite_controller controller2 = Get.find();
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: GridView.builder(
          itemCount: controller.items.length,
          physics: const BouncingScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: 0.7, crossAxisCount: 2),
          itemBuilder: (context, index) {
            controller2.isfavorite[controller.items[index]['i_id']] =
                controller.items[index]['favorite_a'];

            return ListItems(
              itemsmodel: Itemsmodel.fromJson(controller.items[index]),
            );
          }),
    );
  }
}

class ListItems extends GetView<Items_controller> {
  ListItems({super.key, required this.itemsmodel});
  Itemsmodel itemsmodel;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.GoToProductPage(itemsmodel);
      },
      child: Stack(
        children: [
          Card(
            margin: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Hero(
                  tag: "${itemsmodel.iId}",
                  child: Container(
                    width: 100.0,
                    height: 100.0,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(
                                '${Applink.serverimage}/${itemsmodel.iImage}'),
                            fit: BoxFit.contain)),
                  ),
                ),
                Text(
                  itemsmodel.iName!,
                  style: const TextStyle(
                    fontSize: 18.0,
                  ),
                ),
                SizedBox(
                  height: 50.0,
                  child: Text(
                    itemsmodel.iDesc!,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8.0),
                      alignment: Alignment.topLeft,
                      child: Text(
                        '\$${itemsmodel.discountprice}',
                        style: TextStyle(
                          fontSize: 20.0,
                          color: ApplicationColors.red,
                        ),
                      ),
                    ),
                    GetBuilder<Favorite_controller>(
                        builder: (controller) => InkWell(
                              onTap: () {
                                if (controller.isfavorite[itemsmodel.iId] ==
                                    1) {
                                  controller.removefavorite(
                                      itemsmodel.iId.toString());
                                  controller.setfavorite(itemsmodel.iId, 0);
                                } else {
                                  controller
                                      .addfavorite(itemsmodel.iId.toString());
                                  controller.setfavorite(itemsmodel.iId, 1);
                                }
                                print(controller.isfavorite);
                              },
                              child: Container(
                                padding: const EdgeInsets.all(8.0),
                                child: Icon(
                                  controller.isfavorite[itemsmodel.iId] == 1
                                      ? Icons.favorite
                                      : Icons.favorite_outline,
                                  color: ApplicationColors.red,
                                ),
                              ),
                            ))
                  ],
                ),
              ],
            ),
          ),
          itemsmodel.discountprice != itemsmodel.iPrice
              ? SizedBox(
                  width: 50,
                  height: 50,
                  child: Icon(
                    Icons.discount_outlined,
                    color: ApplicationColors.alizarin,
                    size: 40.0,
                  ),
                )
              : const SizedBox()
        ],
      ),
    );
  }
}
