import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../helper/snackBar.dart';
import '../main.dart';

class SignInController extends GetxController {
  bool isload = false;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final _credential = FirebaseAuth.instance;

  @override
  void dispose() {
    // TODO: implement dispose
    passwordController.dispose();
    emailController.dispose();
    super.dispose();
  }

  // @override
  // void onInit() {
  //   // TODO: implement onInit
  //   sharedPref!.setBool("login", false);
  //   super.onInit();
  // }

  void loginAccount() async {
    showLoading();
    try {
      await _credential.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
      Get.offNamed("/home");
      emailController.text = "";
      passwordController.text = "";
      sharedPref!.setBool("login", true);
    } on FirebaseAuthException catch (e) {
      showLoading();
      if (e.code == 'user-not-found') {
        snackbar(
          title: "Alert",
          message: "No user found for that email.",
          isAlert: true,
        );
        showLoading();
      } else if (e.code == 'wrong-password') {
        snackbar(
          title: "Alert",
          message: "Wrong password provided for that user.",
          isAlert: true,
        );
        showLoading();
      }
    } catch (e) {
      snackbar(
        title: "Alert",
        message: "$e",
        isAlert: true,
      );
      showLoading();
    }
    showLoading();
  }

  void showLoading() {
    isload = !isload;
    update();
  }
}
