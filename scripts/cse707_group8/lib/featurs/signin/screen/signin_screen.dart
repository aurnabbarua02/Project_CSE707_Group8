import 'package:cse707_group8/component/common_image.dart';
import 'package:cse707_group8/component/common_text.dart';
import 'package:cse707_group8/component/common_textfield.dart';
import 'package:cse707_group8/featurs/signin/controller/signin_controller.dart';
import 'package:cse707_group8/utils/constant/app_images.dart';
import 'package:cse707_group8/utils/extensions/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SigninScreen extends StatefulWidget {
  const SigninScreen({super.key});

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  final _controller = Get.find<SigninController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: .center,
          children: [
            CommonImage(imageSrc: AppImages.profile),
            Align(
              alignment: Alignment.centerLeft,
              child: CommonText(
                text: "Email",
                fontsize: 15.sp,
                fontWeight: .bold,
              ),
            ),
            CommonTextfield(
              hintText: "Enter your email",
              controller: _controller.emailController,
            ),

            20.height,
            Align(
              alignment: Alignment.centerLeft,
              child: CommonText(
                text: "Password",
                fontsize: 15.sp,
                fontWeight: .bold,
              ),
            ),
            CommonTextfield(
              hintText: "Enter your password",
              controller: _controller.passwordController,
            ),

            30.height,
            ElevatedButton(
              onPressed: () => _controller.signin(),
              style: ElevatedButton.styleFrom(side: BorderSide()),
              child: CommonText(text: "Login", fontsize: 18.sp),
            ),
          ],
        ),
      ),
    );
  }
}
