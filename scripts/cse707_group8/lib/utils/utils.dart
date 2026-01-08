import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Utils {
  static void snackbar(String message) {
    ScaffoldMessenger.of(Get.context!)
      ..clearSnackBars()
      ..showSnackBar(SnackBar(content: Text(message)));
  }
}
