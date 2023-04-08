import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import '../main.dart';

class HomeController extends GetxController {
  bool isload = false;
  void showLoading() {
    isload = !isload;
    update();
  }

  void logout() async {
    showLoading();
    await FirebaseAuth.instance.signOut();
    sharedPref!.setBool("login", false);
    Future.delayed(const Duration(seconds: 2),
        () => Get.offNamed("/login")); //s;howLoading();
  }
}
