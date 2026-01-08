import 'package:cse707_group8/featurs/splash/model/user_model.dart';
import 'package:cse707_group8/utils/constant/app_images.dart';
import 'package:get/get.dart';

class OnBoardingController extends GetxController {
  final user = <UserModel>[].obs;

  @override
  void onInit() async {
    super.onInit();
    user.value = [
      UserModel(
        name: "Aurnab Barua",
        id: "1000055766",
        image: AppImages.person1,
      ),
      UserModel(
        name: "Emadul Islam",
        id: "1000058872",
        image: AppImages.person2,
      ),
    ];
  }
}
