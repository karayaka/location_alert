import 'dart:isolate';
import 'dart:ui';
import 'package:background_locator/background_locator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:location_alert/controllers/base_controller.dart';
import 'package:location_alert/datas/helpers/db_helper.dart';

class MainController extends BaseController {
  static const String _isolateName = "LocatorIsolate";
  ReceivePort port = ReceivePort();
//çeviriler yapılacak
  //pageView
  var pages = ["activeAlert".tr, "alarms".tr, "myLocations".tr, "settings".tr];
  var currentIndex = 0.obs;
  late PageController pageController;

  @override
  void onInit() async {
    super.onInit();
    pageController = PageController(initialPage: currentIndex.value);
    IsolateNameServer.registerPortWithName(port.sendPort, _isolateName);
    port.listen((dynamic data) {
      // do something with data
    });
    initPlatformState();
    await DbHelper.instance.database; //danabase initialse
  }

  Future<void> initPlatformState() async {
    await BackgroundLocator.initialize();
  }

  void onTapChange(int value) {
    currentIndex.value = value;
    pageController.jumpToPage(value);
  }
}
