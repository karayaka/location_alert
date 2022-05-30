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
import 'package:location_alert/datas/helpers/background_locator_helper.dart';
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
  var locationStr = "".obs;
  late PageController pageController;

  @override
  void onInit() async {
    super.onInit();
    pageController = PageController(initialPage: currentIndex.value);
    IsolateNameServer.registerPortWithName(port.sendPort, _isolateName);
    if (IsolateNameServer.lookupPortByName(_isolateName) != null) {
      IsolateNameServer.removePortNameMapping(_isolateName);
    }

    IsolateNameServer.registerPortWithName(port.sendPort, _isolateName);

    port.listen(
      (dynamic data) async {
        print(data);
        if (data != null) {
          //print(data);
          updateTempStr(data);
        }
      },
    );
    await initPlatformState();
    await DbHelper.instance.database; //danabase initialse
  }

  updateTempStr(LocationDto data) {
    locationStr.value = data.toString();
  }

  Future<void> initPlatformState() async {
    print('Initializing...');
    await BackgroundLocator.initialize();

    print('Initialization done');
    final _isRunning = await BackgroundLocator.isServiceRunning();

    print('Rnning ${_isRunning.toString()}');
  }

  void onStop() async {
    await BackgroundLocator.unRegisterLocationUpdate();
    final _isRunning = await BackgroundLocator.isServiceRunning();
    //çalışıyormu Bak
  }

  void startLocaionService() async {
    if (await _checkLocationPermission()) {
      await _startLocator();
    } else {
      print("red");
    }
  }

  Future<bool> _checkLocationPermission() async {
    await Permission.locationAlways.request();
    final access = await Permission.locationAlways.status;
    if (access.isDenied) {
      return false;
    } else {
      return true;
    }
  }

  Future<void> _startLocator() async {
    Map<String, dynamic> data = {'countInit': 1};
    return await BackgroundLocator.registerLocationUpdate(
      BackgroundLocatorHelper.callback,
      initCallback: BackgroundLocatorHelper.initCallback,
      initDataCallback: data,
      disposeCallback: BackgroundLocatorHelper.disposeCallback,
      iosSettings: const IOSSettings(
        accuracy: LocationAccuracy.HIGH,
        distanceFilter: 0,
      ),
      autoStop: false,
      androidSettings: const AndroidSettings(
        accuracy: LocationAccuracy.HIGH,
        interval: 2, //loacationa sorma
        distanceFilter: 0,
        client: LocationClient.android,
        androidNotificationSettings: AndroidNotificationSettings(
          notificationChannelName: 'Location tracking',
          notificationTitle: 'Start Location Tracking',
          notificationMsg: 'Track location in background',
          notificationBigMsg:
              'Background location is on to keep the app up-tp-date with your location. This is required for main features to work properly when the app is not running.',
          notificationIconColor: Colors.grey,
          notificationTapCallback: BackgroundLocatorHelper.notificationCallback,
        ),
      ),
    );
  }

/*  Future<bool> _checkLocationPermission() async {
    final access = await Permission.locationAlways.request();
    //final access = await Permission.locationAlways.status;
    return access.isGranted;
  }*/

  Future<void> notificationCallback() async {
    print('***notificationCallback');
  }

  void onTapChange(int value) {
    currentIndex.value = value;
    pageController.jumpToPage(value);
  }
}
