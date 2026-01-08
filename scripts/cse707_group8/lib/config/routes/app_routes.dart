import 'package:cse707_group8/featurs/home/screen/home_screen.dart';
import 'package:cse707_group8/featurs/signin/screen/signin_screen.dart';
import 'package:cse707_group8/featurs/splash/screen/onboarding_screen.dart';
import 'package:get/get.dart';

class AppRoutes {
  static const String onBoarding = "/onboarding_screen";
  static const String signin = "/signin_screen";
  static const String home = "/home_screen";
  static const String friend = "/friend_screen";

  static List<GetPage> routes = [
    GetPage(name: onBoarding, page: () => OnBoardingScreen()),
    GetPage(name: signin, page: () => SigninScreen()),
    GetPage(name: home, page: () => HomeScreen()),
  ];
}
