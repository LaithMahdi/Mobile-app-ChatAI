import 'package:chat_ai/main.dart';
import 'package:get/get.dart';

class OnboradingController extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit

    // if (sharedPref!.getBool("onborad") == true) {
    //   Get.offNamed("/login");
    // }
    super.onInit();
  }

  void setClick() {
    sharedPref!.setBool("onborad", true);
  }
}
