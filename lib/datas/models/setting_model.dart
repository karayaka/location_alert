import 'package:location_alert/datas/models/base_model.dart';

class SettingCounst {
  static const String id = "id";
  static const String table = "setting";
  static const String soundActive = "soundActive";
  static const String vibrationActive = "vibrationActive";
  static const String volume = "volume";
  static const String defauldAlarmSoundID = "defauldAlarmSoundID";
}

class SettingModel extends BaseModel {
  bool soundActive;
  bool vibrationActive;
  double volume;
  int defauldAlarmSoundID;
  SettingModel({
    this.table = "setting",
    this.id,
    this.soundActive = true,
    this.vibrationActive = true,
    this.volume = 1,
    this.defauldAlarmSoundID = 1,
  });

  @override
  int? id;

  @override
  String table;

  @override
  fromMap(Map<String, dynamic> map) => SettingModel(
      id: map[SettingCounst.id],
      defauldAlarmSoundID: map[SettingCounst.defauldAlarmSoundID],
      soundActive: map[SettingCounst.soundActive],
      vibrationActive: map[SettingCounst.vibrationActive],
      volume: map[SettingCounst.volume]);

  @override
  Map<String, dynamic> toMap() => {
        SettingCounst.id: id,
        SettingCounst.defauldAlarmSoundID: defauldAlarmSoundID,
        SettingCounst.soundActive: soundActive,
        SettingCounst.vibrationActive: vibrationActive,
        SettingCounst.volume: volume,
      };
}
