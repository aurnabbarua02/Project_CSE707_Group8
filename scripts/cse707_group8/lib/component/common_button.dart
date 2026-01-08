import 'package:cse707_group8/component/common_text.dart';
import 'package:cse707_group8/utils/constant/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CommonButton extends StatelessWidget {
  const CommonButton({
    super.key,
    required this.text,
    required this.ontap,
    this.color,
    this.borderColor,
  });
  final String text;
  final Color? color;
  final Color? borderColor;
  final void Function() ontap;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: ontap,
      style: ElevatedButton.styleFrom(
        side: BorderSide(color: borderColor ?? AppColors.primaryColor),
      ),
      child: CommonText(
        text: text,
        fontsize: 18.sp,
        color: color ?? AppColors.primaryColor,
      ),
    );
  }
}
