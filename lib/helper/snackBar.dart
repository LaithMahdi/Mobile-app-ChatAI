import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'color.dart';

void snackbar({
  required String title,
  required String message,
}) {
  Get.showSnackbar(
    GetSnackBar(
      backgroundColor: Colors.red.shade500,
      barBlur: 0.5,
      title: title,
      message: message,
      dismissDirection: DismissDirection.endToStart,
      reverseAnimationCurve: Curves.easeIn,
      snackStyle: SnackStyle.FLOATING,
      animationDuration: const Duration(seconds: 2),
      //overlayBlur: 5,
      borderRadius: 25,
      icon: const Icon(
        Icons.dangerous,
        size: 25,
        color: lightGray,
      ),
      snackPosition: SnackPosition.TOP,
      duration: const Duration(seconds: 2),
      margin: const EdgeInsets.symmetric(horizontal: 15),
    ),
  );
}
