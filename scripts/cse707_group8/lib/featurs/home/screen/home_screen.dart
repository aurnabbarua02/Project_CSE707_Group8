import 'package:cse707_group8/component/common_button.dart';
import 'package:cse707_group8/component/common_image.dart';
import 'package:cse707_group8/component/common_text.dart';
import 'package:cse707_group8/featurs/home/controller/home_controller.dart';
import 'package:cse707_group8/featurs/home/model/friend_model.dart';
import 'package:cse707_group8/utils/constant/app_colors.dart';
import 'package:cse707_group8/utils/constant/app_images.dart';
import 'package:cse707_group8/utils/extensions/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _controller = Get.find<HomeController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("User"),
        backgroundColor: Colors.blue,
        actionsPadding: EdgeInsets.only(right: 10.w),
        actions: [Icon(Icons.info, color: Colors.white)],
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: .circular(15.r),
                ),
                child: Row(
                  children: [
                    CommonImage(imageSrc: AppImages.currency, size: 80.w),
                    10.width,
                    Column(
                      mainAxisAlignment: .center,
                      crossAxisAlignment: .start,
                      children: [
                        CommonText(
                          text: "Balance",
                          fontsize: 18.sp,
                          fontWeight: .bold,
                        ),
                        Obx(
                          () => CommonText(
                            text:
                                "${_controller.balance.value.toString().toIndianFormat} taka",
                            fontsize: 15.sp,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              20.height,
              // CommonButton(
              //   text: "See All Friends",
              //   ontap: () => Get.toNamed(AppRoutes.friend),
              // ),
              Divider(thickness: 2, color: AppColors.primaryColor),
              20.height,
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(20.r),
                ),
                child: Center(
                  child: CommonText(text: "Connected Users", fontsize: 20.sp),
                ),
              ),
              10.height,
              ...List.generate(_controller.friends.length, (index) {
                final friend = _controller.friends[index];
                return Container(
                  margin: EdgeInsets.all(10),
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: .circular(15.r),
                  ),
                  child: Row(
                    children: [
                      CommonImage(imageSrc: friend.image, size: 30.w),
                      5.width,
                      CommonText(text: friend.name, fontsize: 15.sp),
                      Spacer(),
                      CommonButton(
                        text: "Report",
                        color: Colors.red,
                        borderColor: Colors.red,
                        ontap: () => _report(friend),
                      ),
                      5.width,
                      CommonButton(
                        text: "Send",
                        color: AppColors.primaryColor,
                        ontap: () => _sendMoney(friend),
                      ),
                    ],
                  ),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }

  void _processing(FriendModel friend) {
    int currentStep = 0;
    double progress = 0.0;
    bool completed = false;

    final List<String> steps = [
      "Sending money to Connector 1",
      "Connector 1 is sending money to Connector 2",
      "Connector 2 is sending money to Connector 3",
      "Connector 3 is sending money to ${friend.name}",
    ];

    showDialog(
      context: context,      
      barrierDismissible: false,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            void startStepProgress() {
              progress = 0.0;

              Future.doWhile(() async {
                await Future.delayed(const Duration(seconds: 2));
                setState(() {
                  progress += 0.1;
                });

                if (progress >= 1.0) {
                  if (currentStep < steps.length - 1) {
                    setState(() {
                      currentStep++;
                      progress = 0.0;
                    });
                    startStepProgress(); // start next step
                  } else {
                    setState(() {
                      completed = true;
                    });
                  }
                  return false;
                }
                return true;
              });
            }

            // Start progress only once
            if (!completed && progress == 0.0) {
              startStepProgress();
            }

            return AlertDialog.adaptive(
              title: CommonText(
                text: completed ? "Completed" : "Processing...",
                fontsize: 20.sp,
              ),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CommonText(
                    text: completed
                        ? "${_controller.amountController.text} taka is successfully sent to ${friend.name}"
                        : steps[currentStep],
                    fontsize: 14.sp,
                  ),
                  SizedBox(height: 20.h),
                  if (!completed) LinearProgressIndicator(value: progress),
                  if (completed) ...[
                    SizedBox(height: 24.h),
                    ElevatedButton(
                      onPressed: () {
                        _controller.balance.value -= int.parse(
                          _controller.amountController.text,
                        );
                        Navigator.pop(context);
                      },
                      style: ElevatedButton.styleFrom(side: BorderSide()),
                      child: CommonText(text: "OK", fontsize: 18.sp),
                    ),
                  ],
                ],
              ),
            );
          },
        );
      },
    );
  }

  void _report(FriendModel friend) {
    int currentStep = 0;
    double progress = 0.0;
    bool completed = false;

    final List<String> steps = [
      "Checking if the transaction qualifies for a refund",
      "Fraud or dispute confirmed — initiating return",
      "${friend.name} is returning the money to Connector 3",
      "Connector 3 is returning the money to Connector 2",
      "Connector 2 is returning the money to Connector 1",
      "Connector 1 is returning the money to you",
    ];

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            void startStepProgress() {
              progress = 0.0;

              Future.doWhile(() async {
                await Future.delayed(const Duration(seconds: 2));
                setState(() {
                  progress += 0.1;
                });

                if (progress >= 1.0) {
                  if (currentStep < steps.length - 1) {
                    setState(() {
                      currentStep++;
                      progress = 0.0;
                    });
                    startStepProgress(); // start next step
                  } else {
                    setState(() {
                      completed = true;
                    });
                  }
                  return false;
                }
                return true;
              });
            }

            // Start progress only once
            if (!completed && progress == 0.0) {
              startStepProgress();
            }

            return AlertDialog.adaptive(
              title: CommonText(
                text: completed ? "Completed" : "Processing...",
                fontsize: 20.sp,
              ),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CommonText(
                    text: completed
                        ? "Your money is successfully refunded"
                        : steps[currentStep],
                    fontsize: 14.sp,
                  ),
                  SizedBox(height: 20.h),
                  if (!completed) LinearProgressIndicator(value: progress),
                  if (completed) ...[
                    SizedBox(height: 24.h),
                    ElevatedButton(
                      onPressed: () {
                        _controller.balance.value += 1000;
                        Navigator.pop(context);
                      },
                      style: ElevatedButton.styleFrom(side: BorderSide()),
                      child: CommonText(text: "OK", fontsize: 18.sp),
                    ),
                  ],
                ],
              ),
            );
          },
        );
      },
    );
  }

  void _sendMoney(FriendModel friend) {
    showModalBottomSheet(
      context: context,
      builder: (context) => BottomSheet(
        onClosing: () => Navigator.pop(context),
        builder: (context) => Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: .min,
            crossAxisAlignment: .start,
            children: [
              CommonText(text: "Amount", fontsize: 20.sp),
              TextFormField(
                decoration: InputDecoration(
                  hintText: "Enter amount",
                  suffixText: "Taka",
                  border: OutlineInputBorder(borderRadius: .circular(15.r)),
                ),
                controller: _controller.amountController,
              ),
              30.height,
              Align(
                alignment: .centerRight,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                    _processing(friend);
                  },
                  style: ElevatedButton.styleFrom(side: BorderSide()),
                  child: CommonText(text: "Send", fontsize: 20.sp),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
