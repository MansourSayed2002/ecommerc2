import 'package:ecommerc2/controller/AfterRegister/home/Home_controller.dart';
import 'package:ecommerc2/core/costant/links/linkserver.dart';
import 'package:ecommerc2/data/model/ItemsModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

class Custom_items extends GetView<Home_controller> {
  Custom_items({super.key, required this.title});
  String title;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
                fontSize: 25.0, letterSpacing: .5, fontWeight: FontWeight.bold),
          ),
          SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 200,
              child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: controller.items.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => Items(
                        itemsmodel:
                            Itemsmodel.fromJson(controller.items[index]),
                      ))),
        ],
      ),
    );
  }
}

class Items extends StatelessWidget {
  Itemsmodel itemsmodel;
  Items({super.key, required this.itemsmodel});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: NetworkImage('${Applink.serverimage}/${itemsmodel.iImage}'),
            fit: BoxFit.fill),
        borderRadius: BorderRadius.circular(20.0),
      ),
      margin: const EdgeInsets.all(10.0),
      padding: const EdgeInsets.all(10.0),
      alignment: Alignment.bottomLeft,
      width: 250,
      child: Text(
        '${itemsmodel.iName}',
        style: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.normal),
      ),
    );
  }
}
