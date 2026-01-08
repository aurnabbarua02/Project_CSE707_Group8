import 'package:cse707_group8/featurs/home/model/friend_model.dart';
import 'package:cse707_group8/utils/constant/app_images.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final balance = 100000.obs;

  final friends = <FriendModel>[].obs;
  final amountController = TextEditingController();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    friends.value = [
      FriendModel(name: "John", image: AppImages.profile),
      FriendModel(name: "Bob", image: AppImages.profile),
      FriendModel(name: "Kamrul", image: AppImages.profile),
      FriendModel(name: "Babor", image: AppImages.profile),
    ];
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    amountController.dispose();
  }
}
