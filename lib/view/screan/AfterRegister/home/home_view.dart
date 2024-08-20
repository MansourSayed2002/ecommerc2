import 'package:ecommerc2/controller/AfterRegister/home/Home_controller.dart';
import 'package:ecommerc2/core/class/HandlingDataView.dart';
import 'package:ecommerc2/core/costant/links/linkserver.dart';
import 'package:ecommerc2/data/model/ItemsModel.dart';
import 'package:ecommerc2/view/widget/AfterRegister/Custom_AppBar.dart';
import 'package:ecommerc2/view/widget/AfterRegister/Home/Custom_Categories.dart';
import 'package:ecommerc2/view/widget/AfterRegister/Home/Custom_Debitcard.dart';
import 'package:ecommerc2/view/widget/AfterRegister/Home/custom_items.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home_view extends StatelessWidget {
  const Home_view({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(Home_controller());
    return GetBuilder<Home_controller>(
      builder: (controller) => Container(
        margin: const EdgeInsets.all(15.0),
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            Custom_AppBar(
              hinttext: "Find Product",
              mycontroller: controller.textcontroller,
              onpressednotific: () {},
              onpressediconfavorite: () {},
              onpressedicon: () {
                controller.onitemsearch();
                print(controller.issearch);
              },
              onchange: (value) {
                controller.checkissearch();
                print(controller.issearch);
              },
            ),
            const SizedBox(
              height: 14.0,
            ),
            HandlingDataView(
                statusrequest: controller.statusrequest,
                widget: controller.issearch == false
                    ? Column(
                        children: [
                          Custom_Debitcard(
                            title: "A Summer Surprise",
                            body: "Cashback 20%",
                          ),
                          const Custom_Categories(),
                          Custom_items(
                            title: 'Ofer',
                          ),
                        ],
                      )
                    : Listitemsearch(
                        alldata: controller.searchdata,
                      )),
          ],
        ),
      ),
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
