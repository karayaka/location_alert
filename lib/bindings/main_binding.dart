import 'package:get/get.dart';
import 'package:location_alert/controllers/main_controller.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.create(() => MainController());
  }
}
