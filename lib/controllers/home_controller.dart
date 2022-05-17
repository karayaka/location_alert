import 'package:get/get.dart';
import 'package:location_alert/controllers/base_controller.dart';

class HomeController extends BaseController {
  var title = "Home".obs;
  @override
  void onInit() {
    super.onInit();
    print("initial Edildi");
  }
}
