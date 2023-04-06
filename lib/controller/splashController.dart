import 'package:get/get.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    Future.delayed(
      const Duration(seconds: 2),
      () => Get.offAllNamed("/login"),
    );
  }
}
