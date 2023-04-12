import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../helper/snackBar.dart';

class SignUpController extends GetxController {
  bool isload = false;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  final _db = FirebaseFirestore.instance;
  final _credential = FirebaseAuth.instance;

  getUid() {
    String? uid;
    User? user = _credential.currentUser;
    if (user != null) {
      uid = user.uid;
      print(uid);
    }
    return uid;
  }

  @override
  void dispose() {
    // TODO: implement dispose
    nameController.dispose();
    passwordController.dispose();
    emailController.dispose();
    super.dispose();
  }

  void showLoading() {
    isload = !isload;
    update();
  }

  Future<void> addUser() {
    return _db
        .collection("users")
        .doc(getUid())
        .set({
          "uid": getUid(),
          "name": nameController.text.trim(),
          "mail": emailController.text.trim(),
          "password": passwordController.text.trim(),
          "picture": "",
        })
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }

  void createAccount() async {
    showLoading();
    try {
      await _credential.createUserWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );

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
