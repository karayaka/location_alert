import 'package:get/get.dart';
import 'package:location_alert/controllers/base_controller.dart';
import 'package:location_alert/datas/enums/screan_state.dart';
import 'package:location_alert/datas/models/alert_model.dart';
import 'package:location_alert/datas/repositorys/main_repositorys.dart';

class HomeController extends BaseController<MainRepositorys> {
  List<AlertModel> activeAlert = [];
  @override
  void onInit() {
    super.onInit();
  }

  getActiveAlert() async {
    try {
      screanState.value = ScreanState.loading;
      activeAlert = await repo.getActiveAlertModel();
      screanState.value = ScreanState.loaded;
    } catch (e) {
      errorMessage("Bir Hata Oluştu");
    }
  }
}
