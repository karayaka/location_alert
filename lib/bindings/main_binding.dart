import 'package:get/get.dart';
import 'package:location_alert/controllers/alert_controller.dart';
import 'package:location_alert/controllers/home_controller.dart';
import 'package:location_alert/controllers/location_controller.dart';
import 'package:location_alert/controllers/main_controller.dart';
import 'package:location_alert/datas/repositorys/main_repositorys.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.create(() => MainController());
    Get.lazyPut(() => MainRepositorys());
    Get.lazyPut(() => HomeController());
    Get.lazyPut(() => LocationController());
    Get.lazyPut(() => AlertController());
  }
}
