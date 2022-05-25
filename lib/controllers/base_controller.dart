import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:location_alert/datas/enums/screan_state.dart';

class BaseController extends GetxController {
  var screanState = ScreanState.loaded.obs;
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
}
