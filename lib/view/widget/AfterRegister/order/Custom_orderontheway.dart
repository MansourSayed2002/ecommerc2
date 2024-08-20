import 'package:ecommerc2/controller/AfterRegister/setting/orders/orders_controller.dart';
import 'package:ecommerc2/core/costant/color/AplicationColors.dart';
import 'package:ecommerc2/data/model/OrderAddressModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';

class Custom_orderontheway extends StatelessWidget {
  const Custom_orderontheway({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<Orders_controller>(
        builder: (controller) => Container(
            margin: const EdgeInsets.all(10.0),
            child: ListView.builder(
              itemCount: controller.orders.length,
              itemBuilder: (context, index) => controller.orders[index]
                          ['orders_status'] ==
                      3
                  ? Custom_cardOrders(
                      orderAddressModel:
                          OrderAddressModel.fromJson(controller.orders[index]),
                    )
                  : const SizedBox(),
            )));
  }
}

class Custom_cardOrders extends GetView<Orders_controller> {
  Custom_cardOrders({
    super.key,
    required this.orderAddressModel,
  });
  OrderAddressModel orderAddressModel;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.gotoorderdetails(orderAddressModel);
      },
      child: Card(
          child: Container(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Order Number : #${orderAddressModel.ordersId}',
                  style: const TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(Jiffy.parse('${orderAddressModel.ordersTime}',
                        pattern: 'yyyy-MM-dd')
                    .fromNow())
              ],
            ),
            const SizedBox(
              height: 30.0,
            ),
            Text(
              'Order Type : ${controller.ordertype(orderAddressModel.ordersDelivery)}',
              style: const TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.normal,
              ),
            ),
            Text(
              'Order Price : ${orderAddressModel.ordersPrice}\$',
              style: const TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.normal,
              ),
            ),
            Text(
              'Delivary Price : ${orderAddressModel.ordersPricedelivary}\$',
              style: const TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.normal,
              ),
            ),
            Text(
              'Payment Method : ${controller.paymentmethod(orderAddressModel.ordersPaymentmethod)}',
              style: const TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.normal,
              ),
            ),
            Text(
              'Order Status : ${controller.orderstatus(orderAddressModel.ordersStatus)}',
              style: const TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.normal,
              ),
            ),
            const Divider(
              height: 10.0,
              endIndent: 7.0,
              indent: 7.0,
              thickness: 2.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total Price : ${orderAddressModel.ordersTotalprice}\$',
                  style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: ApplicationColors.alizarin),
                ),
                InkWell(
                  onTap: () {
                    controller.deleteorder(orderAddressModel.ordersId);
                  },
                  child: Container(
                    padding: const EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: orderAddressModel.ordersStatus == 0
                          ? ApplicationColors.green
                          : ApplicationColors.red2,
                    ),
                    child: Text(
                      'Delete',
                      style: TextStyle(
                        fontSize: 15.0,
                        color: ApplicationColors.white,
                      ),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      )),
    );
  }
}
