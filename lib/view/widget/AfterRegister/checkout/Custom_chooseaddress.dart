import 'package:ecommerc2/controller/AfterRegister/checkout/checkouot_controller.dart';
import 'package:ecommerc2/core/costant/color/AplicationColors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Custom_chooseAddress extends StatelessWidget {
  const Custom_chooseAddress({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<Checkout_controller>(
        builder: (controller) => controller.delivary == 1
            ? SizedBox(
                height: 250,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Shipping Address',
                      style: TextStyle(
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold,
                        color: ApplicationColors.alizarin,
                      ),
                    ),
                    SizedBox(
                      height: 200,
                      width: MediaQuery.of(context).size.width,
                      child: GetBuilder<Checkout_controller>(
                        builder: (controller) => ListView.builder(
                          itemCount: controller.address.length,
                          itemBuilder: (context, index) =>
                              Custom_containerAddress(
                            isactive: controller.addressid ==
                                    controller.address[index]['address_id']
                                ? true
                                : false,
                            onTap: () {
                              controller.pricedelivary = controller
                                  .address[index]['address_pricedelivary'];

                              controller.chooseaddress(
                                  controller.address[index]['address_id']);
                            },
                            title:
                                '${controller.address[index]['address_city']}/${controller.address[index]['address_street']}',
                            subtitle: controller.address[index]
                                ['address_country'],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            : const SizedBox());
  }
}

class Custom_containerAddress extends StatelessWidget {
  Custom_containerAddress({
    super.key,
    required this.subtitle,
    required this.title,
    required this.onTap,
    required this.isactive,
  });
  String? title;
  String? subtitle;
  void Function()? onTap;
  bool isactive = false;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<Checkout_controller>(
      builder: (controller) => InkWell(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
            color: isactive == true
                ? ApplicationColors.alizarin
                : ApplicationColors.grey,
          ),
          height: 80,
          margin: const EdgeInsets.all(10.0),
          child: ListTile(
            title: Text(
              "$title",
              style: TextStyle(
                fontSize: 20.0,
                color: ApplicationColors.white,
              ),
            ),
            subtitle: Text(
              "$subtitle",
              style: TextStyle(
                fontSize: 20.0,
                color: ApplicationColors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
