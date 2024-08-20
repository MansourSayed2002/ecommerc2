import 'package:ecommerc2/controller/AfterRegister/setting/orders/orders_controller.dart';
import 'package:ecommerc2/core/costant/color/AplicationColors.dart';
import 'package:ecommerc2/view/widget/AfterRegister/order/Custom_orderAchive.dart';
import 'package:ecommerc2/view/widget/AfterRegister/order/Custom_orderontheway.dart';
import 'package:ecommerc2/view/widget/AfterRegister/order/Custom_orderprepare.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Orders_view extends StatelessWidget {
  const Orders_view({super.key});

  @override
  Widget build(BuildContext context) {
    Orders_controller controller = Get.put(Orders_controller());
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: ApplicationColors.alizarin,
            title: const Text(
              'Orders',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            centerTitle: true,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Get.back();
              },
            ),
            bottom:
                TabBar(indicatorColor: ApplicationColors.white, tabs: const [
              Tab(
                child: Text('prepare'),
              ),
              Tab(
                child: Text('on the way'),
              ),
              Tab(
                child: Text('archive'),
              ),
            ]),
          ),
          body: const TabBarView(children: [
            Custom_orderprepare(),
            Custom_orderontheway(),
            Custom_orderAchive(),
          ]),
        ));
  }
}
