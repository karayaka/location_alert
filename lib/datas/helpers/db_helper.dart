import 'dart:async';
import 'package:location_alert/datas/models/base_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as p;
import '../models/alert_model.dart';
import '../models/location_place_model.dart';
import '../models/setting_model.dart';

class DbHelper {
  static final DbHelper instance = DbHelper._init();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('locatorAlert.db');
    return _database!;
  }

  DbHelper._init();

  Future<Database> _initDB(String s) async {
    final dbPath = await getDatabasesPath();
    final path = p.join(dbPath, s);
    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  FutureOr<void> _createDB(Database db, int version) {
    ///TAblolar oluşturulacak ardından arka plan denenecek!
    ///
    db.execute('''CREATE TABLE ${LocationPlaceConst.table} 
        (${LocationPlaceConst.id} INTEGER PRIMARY KEY,
         ${LocationPlaceConst.placeName} TEXT NOT NULL,
         ${LocationPlaceConst.placeDesc} TEXT NOT NULL,
         ${LocationPlaceConst.lat} REAL NOT NULL,
         ${LocationPlaceConst.long} REAL NOT NULL,
          )''');
    db.execute('''CREATE TABLE ${AlertModelField.table} 
        (${AlertModelField.id} INTEGER PRIMARY KEY,
         ${AlertModelField.alertDesc} TEXT NOT NULL,
         ${AlertModelField.alertIsActive} BOOLEAN NOT NULL,
         ${AlertModelField.locationID} INTEGER NOT NULL,
         ${AlertModelField.soundID} INTEGER NOT NULL,
          )''');
    db.execute('''CREATE TABLE ${SettingCounst.table} 
        (${SettingCounst.id} INTEGER PRIMARY KEY,
         ${SettingCounst.defauldAlarmSoundID} INTEGER NOT NULL,
         ${SettingCounst.soundActive} BOOLEAN NOT NULL,
         ${SettingCounst.vibrationActive} BOOLEAN NOT NULL,
         ${SettingCounst.volume} REAL NOT NULL,
          )''');
  }

  Future<BaseModel> create(BaseModel model) async {
    try {
      final db = await instance.database;
      final id = await db.insert(model.table, model.toMap());
      model.id = id;
      return model;
    } catch (e) {
      throw e;
    }
  }

  Future<BaseModel> update(BaseModel model) async {
    try {
      final db = await instance.database;
      final id = await db.update(model.table, model.toMap());
      return model;
    } catch (e) {
      throw e;
    }
  }

  Future<int> delete(String table, int id) async {
    try {
      final db = await instance.database;
      return await db.delete(table, where: 'id = ?', whereArgs: [id]);
    } catch (e) {
      throw e;
    }
  }

  //get komutları özelleştirilecek list ve ıd ile sorgulamalar

  Future close() async {
    final db = await instance.database;
    db.close();
  }
}
