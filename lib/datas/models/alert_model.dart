import 'package:location_alert/datas/models/base_model.dart';
import 'package:location_alert/datas/models/location_place_model.dart';

class AlertModelField {
  static const String id = "id";
  static const String table = "alerts";
  static const String alertName = "alertName";
  static const String alertDesc = "alertDesc";
  static const String alertIsActive = "alertIsActive";
  static const String locationID = "locationID";
  static const String soundID = "soundID";
}

class AlertModel extends BaseModel {
  String? alertName;
  String? alertDesc;
  bool alertIsActive;
  int? locationID;
  LocationPlaceModel? location;
  int soundID;
  @override
  int? id;

  @override
  String table;

  AlertModel(
      {this.table = "alerts",
      this.id,
      this.alertName,
      this.alertDesc,
      this.alertIsActive = false,
      this.locationID,
      this.soundID = 1,
      this.location});

  @override
  Map<String, dynamic> toMap() => {
        AlertModelField.id: id,
        AlertModelField.alertName: alertName,
        AlertModelField.alertDesc: alertDesc,
        AlertModelField.locationID: locationID
      };

  @override
  fromMap(Map<String, dynamic> map) => AlertModel(
      id: map[AlertModelField.id],
      alertName: map[AlertModelField.alertName],
      alertDesc: map[AlertModelField.alertDesc],
      locationID: map[AlertModelField.locationID]);
}
