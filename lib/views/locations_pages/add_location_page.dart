import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:location_alert/components/custom_circular_progress.dart';
import 'package:location_alert/controllers/location_controller.dart';
import 'package:location_alert/datas/models/location_place_model.dart';

class AddLocationPage extends GetWidget<LocationController> {
  AddLocationPage({Key? key}) : super(key: key);
  var location = LocationPlaceModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Yeni Konum"),
      ),
      body: Container(
        child: Padding(
          padding: EdgeInsets.all(8),
          child: Form(
            key: controller.formKey,
            child: Column(
              children: [
                TextFormField(
                  decoration: const InputDecoration(hintText: "Konum Adı"),
                  onChanged: (val) {
                    location.placeName = val;
                  },
                ),
                const SizedBox(
                  height: 5,
                ),
                TextFormField(
                  decoration: const InputDecoration(hintText: "Konum Desc"),
                  onChanged: (val) {
                    location.placeDesc = val;
                  },
                ),
                const SizedBox(
                  height: 5,
                ),
                Container(
                  child: Obx((() {
                    if (controller.addLoding.value) {
                      return CustomCircularProgress();
                    } else {
                      return ElevatedButton(
                        child: const Text("Kaydet"),
                        onPressed: () {
                          controller.addLocation(location);
                        },
                      );
                    }
                  })),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
