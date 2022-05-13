import 'dart:convert';

abstract class BaseModel {
  fromJson(String str) => fromMap(json.decode(str));
  fromMap(Map<String, dynamic> map);

  Map<String, dynamic> toMap();
  String toJson() => json.encode(toMap());

  String get table;
  set table(String table);

  int? get id;
  set id(int? value);
}
