import 'package:location_alert/datas/models/base_model.dart';

class LocationPlaceConst {
  static const String id = "id";
  static const String table = "locationPlaces";
  static const String placeName = "placeName";
  static const String placeDesc = "placeDesc";
  static const String lat = "lat";
  static const String long = "long";
}

class LocationPlaceModel extends BaseModel {
  //location ile ilgili bilgiler tutulacak

  String placeName;
  String placeDesc;
  double lat;
  double long;

  @override
  int? id;
  @override
  String table;

  LocationPlaceModel({
    this.table = "locationPlaces",
    this.id,
    required this.placeName,
    required this.placeDesc,
    required this.long,
    required this.lat,
  });
  @override
  fromMap(Map<String, dynamic> map) => LocationPlaceModel(
      id: map[LocationPlaceConst.id],
      placeName: map[LocationPlaceConst.placeName],
      placeDesc: map[LocationPlaceConst.placeDesc],
      long: map[LocationPlaceConst.long],
      lat: map[LocationPlaceConst.lat]);
  @override
  Map<String, dynamic> toMap() => {
        LocationPlaceConst.id: id,
        LocationPlaceConst.lat: lat,
        LocationPlaceConst.long: long,
        LocationPlaceConst.placeDesc: placeDesc,
        LocationPlaceConst.placeName: placeName,
      };
}
