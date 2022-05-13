import 'package:location_alert/datas/models/base_model.dart';

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
  String alertName;
  String alertDesc;
  bool alertIsActive;
  int locationID;
  int soundID;
  @override
  int? id;

  @override
  String table;

  AlertModel({
    this.table = "alerts",
    this.id,
    required this.alertName,
    required this.alertDesc,
    this.alertIsActive = false,
    required this.locationID,
    this.soundID = 1,
  });


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
