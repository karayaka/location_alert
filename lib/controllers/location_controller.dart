import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:location_alert/controllers/base_controller.dart';
import 'package:location_alert/datas/enums/screan_state.dart';
import 'package:location_alert/datas/models/location_place_model.dart';
import 'package:location_alert/datas/repositorys/main_repositorys.dart';

class LocationController extends BaseController<MainRepositorys> {
  List<LocationPlaceModel> locations = [];

  var addLoding = false.obs;
  var formKey = GlobalKey<FormState>();
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getLocations();
  }

  getLocations() async {
    try {
      screanState.value = ScreanState.loading;
      locations = await repo.getLocations();
      screanState.value = ScreanState.loaded;
    } catch (e) {
      errorMessage("Bir Hata Oluştu");
      screanState.value = ScreanState.loaded;
    }
  }

  addLocation(LocationPlaceModel location) async {
    try {
      addLoding.value = true;
      location.lat = 010020030.0342;
      location.long = 0087978655.7565678;
      var model = await repo.addLocation(location);
      locations.add(model);
      addLoding.value = false;
      Get.back();
      screanState.value = ScreanState.loading;
      screanState.value = ScreanState.loaded;
    } catch (e) {
      print(e);
      errorMessage("Bir Sorunla Karşılaşıld");
    }
  }
}
