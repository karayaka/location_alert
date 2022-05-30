import 'dart:isolate';
import 'dart:ui';

import 'package:background_locator/location_dto.dart';

class BackgroundLocatorHelper {
  static const String _isolateName = "LocatorIsolate";
  static Future<void> initCallback(Map<dynamic, dynamic> params) async {
    print("init calback stata");
    print(params);
  }

  static Future<void> disposeCallback() async {}

  static Future<void> callback(LocationDto locationDto) async {
    print("calback locationen");
    print(locationDto.toString());
    final SendPort? send = IsolateNameServer.lookupPortByName(_isolateName);
    send?.send(locationDto);
  }

  static Future<void> notificationCallback() async {
    print('***notificationCallback');
  }
}
