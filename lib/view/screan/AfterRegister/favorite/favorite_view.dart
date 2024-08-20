import 'package:ecommerc2/controller/AfterRegister/favorite/favorite_controller.dart';
import 'package:ecommerc2/core/costant/color/AplicationColors.dart';
import 'package:ecommerc2/core/costant/links/linkserver.dart';
import 'package:ecommerc2/data/model/ItemsModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Favorite_view extends StatelessWidget {
  const Favorite_view({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(Favorite_controller());
    return GetBuilder<Favorite_controller>(
      builder: (controller) => SizedBox(
        height: MediaQuery.of(context).size.height,
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2),
          itemCount: controller.favorite_items.length,
          itemBuilder: (context, index) => Custom_favoriteCard(
              itemsmodel:
                  Itemsmodel.fromJson(controller.favorite_items[index])),
        ),
      ),
    );
  }
}

class Custom_favoriteCard extends StatelessWidget {
  Custom_favoriteCard({super.key, required this.itemsmodel});
  Itemsmodel itemsmodel;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<Favorite_controller>(
      builder: (controller) => Card(
        margin: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 200.0,
              height: 200.0,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(
                          '${Applink.serverimage}/${itemsmodel.iImage}'),
                      fit: BoxFit.contain)),
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
                    '\$${itemsmodel.iPrice}',
                    style: TextStyle(
                      fontSize: 20.0,
                      color: ApplicationColors.red,
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    controller.removefavorite(itemsmodel.iId.toString());
                  },
                  child: Container(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.delete_outline_rounded,
                      color: ApplicationColors.alizarin,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
