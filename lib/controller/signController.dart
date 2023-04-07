import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../helper/snackBar.dart';

class SignController extends GetxController {
  bool isload = false;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();

  void showLoading() {
    isload = !isload;
    update();
  }

  void Auth() async {
    showLoading();
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: emailController.text, password: passwordController.text);
      Future.delayed(
        const Duration(milliseconds: 10),
        () {
          snackbar(
            title: "Success",
            message: "Your account has been created with successfuly",
            isAlert: false,
          );
          Get.toNamed("/login");
        },
      );
    } on FirebaseAuthException catch (e) {
      showLoading();
      if (e.code == 'weak-password') {
        snackbar(
          title: "Alert",
          message: "The password provided is too weak",
          isAlert: true,
        );
        showLoading();
      } else if (e.code == 'email-already-in-use') {
        snackbar(
          title: "Alert",
          message: "The account already exists for that email.",
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
}
//mahdi@gmail.com