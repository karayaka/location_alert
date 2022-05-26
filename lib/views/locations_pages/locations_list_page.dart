import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:location_alert/components/custom_circular_progress.dart';
import 'package:location_alert/controllers/location_controller.dart';
import 'package:location_alert/datas/enums/screan_state.dart';
import 'package:location_alert/routes/route_const.dart';
import 'package:location_alert/views/base_views/base_view.dart';

class LocationListPage extends GetWidget<LocationController> {
  const LocationListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _buildScrean();
  }

  _buildScrean() => Obx(() {
        if (controller.screanState == ScreanState.loading) {
          return CustomCircularProgress();
        } else {
          return _buildList();
        }
      });

  Widget _buildList() {
    return Stack(
      children: [
        ListView.builder(
          itemCount: controller.locations.length,
          itemBuilder: ((context, i) {
            var location = controller.locations[i];
            return Container(child: Text(location.placeName ?? ""));
          }),
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: FloatingActionButton(
              onPressed: () {
                Get.toNamed(RouteConst.addLocation);
              },
              child: const Icon(Icons.add),
            ),
          ),
        )
      ],
    );
  }
}
