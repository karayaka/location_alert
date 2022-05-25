import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:location_alert/components/custom_circular_progress.dart';
import 'package:location_alert/controllers/base_controller.dart';
import 'package:location_alert/datas/enums/screan_state.dart';

class BaseView<T extends BaseController> extends StatelessWidget {
  late Widget child;
  BaseView({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => GetX<T>(builder: (controller) {
        if (controller.screanState.value == ScreanState.loading) {
          return const CustomCircularProgress();
        } else {
          return child;
        }
      });
}
