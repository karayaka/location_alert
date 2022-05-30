import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:location_alert/controllers/main_controller.dart';
import 'package:location_alert/views/alerts/alert_list_page.dart';
import 'package:location_alert/views/home_pages/home_page.dart';
import 'package:location_alert/views/locations_pages/locations_list_page.dart';
import 'package:location_alert/views/settings/setting_page.dart';

class MainPage extends StatelessWidget {
  var ctrl = Get.find<MainController>();
  MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.local_airport),
            onPressed: () {
              ctrl.startLocaionService();
            },
          )
        ],
        title: Obx(() => _buildTitle()),
      ),
      bottomNavigationBar: Obx(() {
        var color = Get.theme.primaryColor;
        return BottomNavigationBar(
            onTap: ctrl.onTapChange,
            currentIndex: ctrl.currentIndex.value,
            items: [
              BottomNavigationBarItem(
                backgroundColor: color,
                icon: const Icon(Icons.home_outlined),
                label: "activeAlert".tr,
              ),
              BottomNavigationBarItem(
                backgroundColor: color,
                icon: const Icon(Icons.shopping_basket_outlined),
                label: "alarms".tr,
              ),
              BottomNavigationBarItem(
                backgroundColor: Get.theme.primaryColor,
                icon: const Icon(Icons.local_shipping_outlined),
                label: "myLocations".tr,
              ),
              BottomNavigationBarItem(
                backgroundColor: Get.theme.primaryColor,
                icon: const Icon(Icons.people),
                label: "settings".tr,
              )
            ]);
      }),
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Obx(() => Text(ctrl.locationStr.value)),
          ),
          Expanded(
            flex: 5,
            child: PageView(
              onPageChanged: ctrl.onTapChange,
              controller: ctrl.pageController,
              children: [
                HomePage(),
                AlertListPage(),
                LocationListPage(),
                SettingPage(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTitle() {
    return AnimatedSwitcher(
      duration: const Duration(seconds: 1),
      switchInCurve: Curves.easeInBack,
      switchOutCurve: Curves.easeInBack,
      transitionBuilder: (child, animation) {
        return SizeTransition(
          sizeFactor: animation,
          axis: Axis.horizontal,
          child: child,
        );
      },
      child: Text(
        ctrl.pages[ctrl.currentIndex.value],
        key: Key(ctrl.currentIndex.value.toString()),
      ),
    );
  }
}
