import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import '../main.dart';

class HomeController extends GetxController {
  var x = FirebaseFirestore.instance.collection("users").doc().get();
  //await FirebaseAuth.instance.useAuthEmulator('localhost', 9099);
  FirebaseAuth auth = FirebaseAuth.instance;
  bool isload = false;
  void showLoading() {
    isload = !isload;
    update();
  }

  void logout() async {
    showLoading();
    await FirebaseAuth.instance.signOut();
    sharedPref!.setBool("login", false);
    Future.delayed(
      const Duration(seconds: 2),
      () => Get.offNamed("/login"),
    );
  }
}
