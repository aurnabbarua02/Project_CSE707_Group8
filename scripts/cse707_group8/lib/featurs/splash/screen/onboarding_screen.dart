import 'package:cse707_group8/component/common_button.dart';
import 'package:cse707_group8/component/common_image.dart';
import 'package:cse707_group8/config/routes/app_routes.dart';
import 'package:cse707_group8/featurs/splash/controller/onboarding_controller.dart';
import 'package:cse707_group8/utils/extensions/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final controller = Get.find<OnBoardingController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16.w),
        child: Column(
          mainAxisAlignment: .center,
          children: [
            Row(
              mainAxisAlignment: .end,
              children: [
                Column(
                  children: [
                    Text(
                      controller.user.first.name,
                      style: TextStyle(fontSize: 40),
                    ),
                    Text(
                      "ID: ${controller.user.first.id}",
                      style: TextStyle(fontSize: 30),
                    ),
                  ],
                ),
                10.width,
                ClipOval(
                  child: CommonImage(
                    imageSrc: controller.user.first.image,
                    fill: BoxFit.cover,
                    size: 100.w,
                  ),
                ),
              ],
            ),
            20.height,
            Row(
              mainAxisAlignment: .start,
              children: [
                ClipOval(
                  child: CommonImage(
                    imageSrc: controller.user.last.image,
                    fill: BoxFit.cover,
                    size: 100.w,
                  ),
                ),
                10.width,
                Column(
                  children: [
                    Text(
                      controller.user.last.name,
                      style: TextStyle(fontSize: 40),
                    ),
                    Text(
                      "ID: ${controller.user.last.id}",
                      style: TextStyle(fontSize: 30),
                    ),
                  ],
                ),
              ],
            ),
            20.height,
            Row(
              children: [
                Spacer(),
                CommonButton(
                  text: "Continue  >",
                  ontap: () => Get.toNamed(AppRoutes.signin),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
