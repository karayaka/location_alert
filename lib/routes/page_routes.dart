import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:location_alert/bindings/main_binding.dart';
import 'package:location_alert/routes/route_const.dart';
import 'package:location_alert/views/main_pages/main_page.dart';

class RoutePage {
  static final pages = [
    GetPage(
      name: RouteConst.main,
      page: () => MainPage(),
      //binding: MainBinding(),
    ),
  ];
}
