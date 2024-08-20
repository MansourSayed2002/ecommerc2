import 'package:ecommerc2/controller/AfterRegister/home/HomeScrean_controller.dart';
import 'package:ecommerc2/core/costant/color/AplicationColors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Custom_BottomNavigationBar extends GetView<Homescrean_controller> {
  const Custom_BottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<Homescrean_controller>(
        builder: (controller) => BottomAppBar(
              notchMargin: 10.0,
              shape: const CircularNotchedRectangle(),
              height: 60.0,
              child: Container(
                margin: const EdgeInsets.only(left: 10.0, right: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    BottomNavigationBar(
                      active: controller.currentindex == 0 ? true : false,
                      icon: controller.currentindex == 0
                          ? Icons.home
                          : Icons.home_outlined,
                      title: "Home",
                      ontap: () {
                        controller.changepage(0);
                      },
                    ),
                    BottomNavigationBar(
                      active: controller.currentindex == 1 ? true : false,
                      icon: controller.currentindex == 1
                          ? Icons.notifications_active
                          : Icons.notifications_active_outlined,
                      title: "Notification",
                      ontap: () {
                        controller.changepage(1);
                      },
                    ),
                    const SizedBox(
                      width: 50.0,
                    ),
                    BottomNavigationBar(
                      active: controller.currentindex == 2 ? true : false,
                      icon: controller.currentindex == 2
                          ? Icons.person_4
                          : Icons.person_4_outlined,
                      title: "Profile",
                      ontap: () {
                        controller.changepage(2);
                      },
                    ),
                    BottomNavigationBar(
                      active: controller.currentindex == 3 ? true : false,
                      icon: controller.currentindex == 3
                          ? Icons.settings
                          : Icons.settings_outlined,
                      title: "Settings",
                      ontap: () {
                        controller.changepage(3);
                      },
                    ),
                  ],
                ),
              ),
            ));
  }
}

class BottomNavigationBar extends StatelessWidget {
  BottomNavigationBar({
    super.key,
    required this.icon,
    required this.title,
    required this.active,
    required this.ontap,
  });
  IconData icon;
  String title;
  bool active;
  VoidCallback ontap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        margin: const EdgeInsets.only(left: 15.0, right: 15.0, top: 10.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              color: active == true
                  ? ApplicationColors.pomegranete
                  : ApplicationColors.grey,
            ),
            Text(
              title,
              style: TextStyle(
                  color: active == true
                      ? ApplicationColors.pomegranete
                      : ApplicationColors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
