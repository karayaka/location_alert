import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:location_alert/bindings/main_binding.dart';
import 'package:location_alert/localization/location_alert_localization.dart';
import 'package:location_alert/routes/page_routes.dart';
import 'package:location_alert/routes/route_const.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'location_alert'.tr,
      //theme: customTheme,
      translations: LocationAlertLocalization(),
      locale: Get.deviceLocale,
      getPages: RoutePage.pages,
      initialRoute: RouteConst.main,
      initialBinding: MainBinding(),
    );
  }
}
