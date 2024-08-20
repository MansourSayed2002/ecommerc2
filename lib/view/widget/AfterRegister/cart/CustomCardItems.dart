import 'package:ecommerc2/controller/AfterRegister/cart/Mycart_controller.dart';
import 'package:ecommerc2/core/class/HandlingDataView.dart';
import 'package:ecommerc2/core/costant/color/AplicationColors.dart';
import 'package:ecommerc2/core/costant/links/linkserver.dart';
import 'package:ecommerc2/data/model/cartviewmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomCardItems extends StatelessWidget {
  const CustomCardItems({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<Mycart_controller>(
      builder: (controller) => HandlingDataView(
          statusrequest: controller.statusrequest,
          widget: SizedBox(
            height: MediaQuery.of(context).size.height / 2.2,
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: controller.itemcart.length,
              itemBuilder: (context, index) => CardItems(
                cartViewModel:
                    CartViewModel.fromJson(controller.itemcart[index]),
              ),
            ),
          )),
    );
  }
}

class CardItems extends GetView<Mycart_controller> {
  CardItems({super.key, required this.cartViewModel});
  CartViewModel cartViewModel;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 100,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ImageItem(
                url: "${Applink.serverimage}/${cartViewModel.iImage}",
              ),
              Detailes(
                iname: cartViewModel.iName!,
                iprice: cartViewModel.iPrice,
              ),
              GetBuilder<Mycart_controller>(
                builder: (controller) => Count(
                  count: cartViewModel.countitems,
                  add: () {
                    controller.insertdata(cartViewModel.iId, 0);
                  },
                  remove: () {
                    controller.deletedata(cartViewModel.iId);
                  },
                ),
              )
            ],
          ),
        ),
        const Divider(
          endIndent: 15.0,
          indent: 15.0,
          height: 10.0,
          thickness: 3,
        ),
      ],
    );
  }
}

class ImageItem extends StatelessWidget {
  ImageItem({super.key, required this.url});
  var url;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 10.0),
      width: 100.0,
      height: 80.0,
      decoration: BoxDecoration(
          image:
              DecorationImage(image: NetworkImage(url), fit: BoxFit.contain)),
    );
  }
}

class Detailes extends StatelessWidget {
  Detailes({super.key, required this.iname, required this.iprice});
  String iname;
  var iprice;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 150.0,
        height: 90.0,
        child: Column(
          children: [
            Text(
              iname,
              style: const TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Text(
              '$iprice\$',
              style: TextStyle(
                  fontSize: 19.0,
                  fontWeight: FontWeight.normal,
                  color: ApplicationColors.alizarin),
            ),
          ],
        ));
  }
}

class Count extends StatelessWidget {
  Count({
    super.key,
    required this.count,
    required this.add,
    required this.remove,
  });
  var count;
  VoidCallback remove;
  VoidCallback add;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100.0,
      height: 90.0,
      child: Column(
        children: [
          InkWell(
            onTap: remove,
            child: const Icon(Icons.remove),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('$count'),
          ),
          InkWell(
            onTap: add,
            child: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
