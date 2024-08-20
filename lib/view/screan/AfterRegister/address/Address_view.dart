import 'package:ecommerc2/controller/AfterRegister/setting/Address/viewaddress.dart';
import 'package:ecommerc2/core/class/AppRouting.dart';
import 'package:ecommerc2/core/class/HandlingDataView.dart';
import 'package:ecommerc2/core/costant/color/AplicationColors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Address_view extends StatelessWidget {
  const Address_view({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(Viewaddress_controller());
    return Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          centerTitle: true,
          backgroundColor: ApplicationColors.alizarin,
          title: const Text(
            'Address',
            style: TextStyle(fontSize: 25.0),
          ),
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              size: 30.0,
            ),
            onPressed: () {
              Get.back();
            },
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: ApplicationColors.alizarin,
          splashColor: ApplicationColors.white,
          onPressed: () {
            Get.toNamed(AppRouting.addaddress);
          },
          child: const Icon(Icons.add),
        ),
        body: GetBuilder<Viewaddress_controller>(
          builder: (controller) => HandlingDataView(
            statusrequest: controller.statusrequest!,
            widget: Container(
                child: ListView.builder(
              itemCount: controller.address.length,
              itemBuilder: (context, index) => Card(
                  margin: const EdgeInsets.all(13.0),
                  child: ListTile(
                    title: Text(
                        '${controller.address[index]['address_city']}/${controller.address[index]['address_street']}'),
                    subtitle:
                        Text('${controller.address[index]['address_country']}'),
                    trailing: IconButton(
                      onPressed: () {
                        controller.deletedata(
                            controller.address[index]['address_id']);
                      },
                      icon: const Icon(Icons.delete_forever_outlined),
                      color: ApplicationColors.alizarin,
                    ),
                  )),
            )),
          ),
        ));
  }
}
