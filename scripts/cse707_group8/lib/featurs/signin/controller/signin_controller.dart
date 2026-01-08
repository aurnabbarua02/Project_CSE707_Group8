import 'package:cse707_group8/config/routes/app_routes.dart';
import 'package:cse707_group8/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SigninController extends GetxController {
  final emailController = TextEditingController(text: "user@gmail.com");
  final passwordController = TextEditingController(text: "1234");

  void signin() {
    if (emailController.text == "user@gmail.com" &&
        passwordController.text == "1234") {
      Utils.snackbar("Successfully logged in");
      Get.offAllNamed(AppRoutes.home);
    } else {
      Utils.snackbar("Invalid email or password");
    }
  }

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }
}
