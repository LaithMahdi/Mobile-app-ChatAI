import 'package:chat_ai/main.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../helper/snackBar.dart';

class SignController extends GetxController {
  bool isload = false;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  CollectionReference users = FirebaseFirestore.instance.collection('users');

  @override
  void dispose() {
    // TODO: implement dispose
    nameController.dispose();
    passwordController.dispose();
    emailController.dispose();
    super.dispose();
  }

  void loginAccount() async {
    showLoading();
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      Get.offNamed("/home");
      nameController.text = "";
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

  Future<void> addUser() {
    return users
        .add({
          "Name": nameController.text.trim(),
          "Mail": emailController.text.trim(),
          "Password": passwordController.text.trim(),
          "Picture": "",
        })
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }

  void createAccount() async {
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
          addUser();
          Get.toNamed("/login");
          nameController.text = "";
          emailController.text = "";
          passwordController.text = "";
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
