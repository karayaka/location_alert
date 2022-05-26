import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:location_alert/controllers/home_controller.dart';
import 'package:location_alert/views/base_views/base_view.dart';

class HomePage extends GetWidget<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<HomeController>(child: _buildList());
  }

  ListView _buildList() {
    return ListView.builder(
      itemCount: controller.activeAlert.length,
      itemBuilder: ((context, i) {
        var alert = controller.activeAlert[i];
        return Container(child: Text(alert.alertName ?? ""));
      }),
    );
  }
}
