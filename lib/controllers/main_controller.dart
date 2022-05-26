//import 'package:permission_handler/permission_handler.dart';
import 'dart:isolate';
import 'dart:ui';
import 'package:background_locator/background_locator.dart';
import 'package:background_locator/location_dto.dart';
import 'package:background_locator/settings/android_settings.dart';
import 'package:background_locator/settings/ios_settings.dart';
import 'package:background_locator/settings/locator_settings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:location_alert/controllers/base_controller.dart';
import 'package:location_alert/datas/helpers/db_helper.dart';
import 'package:location_alert/datas/repositorys/main_repositorys.dart';
import 'package:permission_handler/permission_handler.dart';

class MainController extends BaseController<MainRepositorys> {
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
    await initPlatformState();
    await DbHelper.instance.database; //danabase initialse
  }

  Future<void> initPlatformState() async {
    await BackgroundLocator.initialize();
  }

  void startLocaionService() async {
    if (await _checkLocationPermission()) {
      _startLocationService();
    } else {
      print("Permitiobn Red");
    }
  }

  void _startLocationService() {
    Map<String, dynamic> data = {'countInit': 1};
    BackgroundLocator.registerLocationUpdate(
      (LocationDto location) {},
      initCallback: (params) {},
      initDataCallback: data,
      disposeCallback: () {},
      autoStop: false,
      iosSettings: const IOSSettings(
          accuracy: LocationAccuracy.NAVIGATION, distanceFilter: 0),
      androidSettings: const AndroidSettings(
        accuracy: LocationAccuracy.NAVIGATION,
        interval: 5,
        distanceFilter: 0,
        androidNotificationSettings: AndroidNotificationSettings(
          notificationChannelName: 'Location tracking',
          notificationTitle: 'Konum Takibi Var',
          notificationMsg: 'Track location in background',
          notificationBigMsg:
              'Background location is on to keep the app up-tp-date with your location. This is required for main features to work properly when the app is not running.',
          notificationIcon: '',
          notificationIconColor: Colors.grey,
          //notificationTapCallback: () async {},
        ),
      ),
    );
  }

  Future<bool> _checkLocationPermission() async {
    final access = await Permission.locationAlways.request();
    //final access = await Permission.locationAlways.status;
    return access.isGranted;
  }

  void onTapChange(int value) {
    currentIndex.value = value;
    pageController.jumpToPage(value);
  }
}
