import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:location_alert/controllers/home_controller.dart';

class HomePage extends GetWidget<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(child: Text(controller.title.value)),
    );
  }
}
