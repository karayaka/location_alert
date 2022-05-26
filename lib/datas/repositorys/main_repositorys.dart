import 'package:location_alert/datas/helpers/db_helper.dart';
import 'package:location_alert/datas/models/alert_model.dart';
import 'package:location_alert/datas/models/location_place_model.dart';

class MainRepositorys {
  Future<List<AlertModel>> getActiveAlertModel() async {
    try {
      var alerts = await DbHelper.instance.getAlertByStatus(true);
      for (var alert in alerts) {
        alert.location = await DbHelper.instance.getByID(
          alert.id ?? 0,
          LocationPlaceModel(),
        );
      }
      return alerts;
    } catch (e) {
      throw e;
    }
  }

  Future<List<LocationPlaceModel>> getLocations() async {
    try {
      return await DbHelper.instance.getData<LocationPlaceModel>(
        LocationPlaceModel(),
      );
    } catch (e) {
      throw e;
    }
  }

  Future<LocationPlaceModel> addLocation(LocationPlaceModel model) async {
    try {
      return await DbHelper.instance.create<LocationPlaceModel>(model);
    } catch (e) {
      throw e;
    }
  }
}
