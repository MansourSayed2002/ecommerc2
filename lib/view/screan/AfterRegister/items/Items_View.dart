import 'package:ecommerc2/controller/AfterRegister/home/Home_controller.dart';
import 'package:ecommerc2/controller/AfterRegister/items/Items_controller.dart';
import 'package:ecommerc2/controller/AfterRegister/favorite/favorite_controller.dart';
import 'package:ecommerc2/core/class/HandlingDataView.dart';
import 'package:ecommerc2/core/costant/links/linkserver.dart';
import 'package:ecommerc2/data/model/ItemsModel.dart';
import 'package:ecommerc2/view/widget/AfterRegister/Custom_AppBar.dart';
import 'package:ecommerc2/view/widget/AfterRegister/Items/CustomListCategories.dart';
import 'package:ecommerc2/view/widget/AfterRegister/Items/CustomListItems.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Items_view extends StatelessWidget {
  const Items_view({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(Items_controller());
    Get.put(Favorite_controller());
    return Scaffold(
      body: GetBuilder<Items_controller>(
          builder: (controller) => Container(
                margin: const EdgeInsets.all(15.0),
                child: ListView(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    Custom_AppBar(
                      mycontroller: controller.textcontroller,
                      onpressedicon: () {
                        controller.onitemsearch();
                      },
                      onpressednotific: () {},
                      hinttext: 'Find Product',
                      onpressediconfavorite: () {},
                      onchange: (value) {
                        controller.checkissearch();
                      },
                    ),
                    controller.issearch == false
                        ? Column(
                            children: [
                              const Custom_List_Categories(),
                              HandlingDataView(
                                statusrequest: controller.statusrequest,
                                widget: const Custom_ListItems(),
                              ),
                            ],
                          )
                        : Listitemsearch(
                            alldata: controller.searchdata,
                          ),
                  ],
                ),
              )),
    );
  }
}

class Listitemsearch extends GetView<Home_controller> {
  Listitemsearch({super.key, required this.alldata});
  List<Itemsmodel> alldata;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: alldata.length,
      itemBuilder: (context, index) => InkWell(
        onTap: () {
          controller.GoToProductPage(alldata[index]);
          print('object');
        },
        child: Card(
          child: Row(
            children: [
              Container(
                margin: const EdgeInsets.all(10.0),
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                    color: Colors.red,
                    image: DecorationImage(
                        image: NetworkImage(
                            '${Applink.serverimage}/${alldata[index].iImage}'),
                        fit: BoxFit.contain)),
              ),
              Text(
                '${alldata[index].iName}',
                style: const TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w500,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
