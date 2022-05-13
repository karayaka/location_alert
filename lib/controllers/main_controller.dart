import 'dart:isolate';
import 'dart:ui';
import 'package:background_locator/background_locator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:location_alert/datas/helpers/db_helper.dart';

class MainController extends GetxController {
  static const String _isolateName = "LocatorIsolate";
  ReceivePort port = ReceivePort();

  succesMessage(String message) {
    Get.snackbar(
      "Başarılı",
      message,
      colorText: Colors.white,
      backgroundColor: Colors.green,
    );
  }

  errorMessage(String message) {
    Get.snackbar(
      "Hata",
      message,
      colorText: Colors.white,
      backgroundColor: Colors.orange.shade600,
    );
  }

  warningMessage(String message) {
    Get.snackbar(
      "Uyarı",
      message,
      colorText: Colors.white,
      backgroundColor: Colors.red,
    );
  }

  @override
  void onInit() async {
    super.onInit();

    IsolateNameServer.registerPortWithName(port.sendPort, _isolateName);
    port.listen((dynamic data) {
      // do something with data
    });
    initPlatformState();
    await DbHelper.instance.database;
  }

  Future<void> initPlatformState() async {
    await BackgroundLocator.initialize();
  }
}
