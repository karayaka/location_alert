import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:location_alert/routes/route_const.dart';
import 'package:location_alert/views/home_pages/home_page.dart';

class RoutePage {
  static final pages = [
    GetPage(
      name: RouteConst.home,
      page: () => HomePage(),
      //binding: HomeBinding(),
    ),
  ];
}
