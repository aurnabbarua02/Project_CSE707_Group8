import 'package:cse707_group8/featurs/home/controller/home_controller.dart';
import 'package:cse707_group8/featurs/signin/controller/signin_controller.dart';
import 'package:cse707_group8/featurs/splash/controller/onboarding_controller.dart';
import 'package:get/get.dart';

class DependencyInjection extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => OnBoardingController(), fenix: true);
    Get.lazyPut(() => SigninController(), fenix: true);
    Get.lazyPut(() => HomeController(), fenix: true);
  }
}
