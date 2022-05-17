import 'package:get/get.dart';
import 'package:location_alert/controllers/alert_controller.dart';
import 'package:location_alert/controllers/home_controller.dart';
import 'package:location_alert/controllers/location_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    //Get.lazyPut(() => LocationController());
    //Get.lazyPut(() => AlertController());
    //Get.lazyPut(() => HomeController());
  }
}
