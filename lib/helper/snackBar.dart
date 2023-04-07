import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import 'color.dart';

void snackbar({
  required String title,
  required String message,
  required bool isAlert,
}) {
  Get.showSnackbar(
    GetSnackBar(
      backgroundColor: isAlert ? Colors.red.shade500 : Colors.green.shade600,
      barBlur: 0.5,
      title: title,
      message: message,
      dismissDirection: DismissDirection.endToStart,
      reverseAnimationCurve: Curves.easeIn,
      snackStyle: SnackStyle.FLOATING,
      animationDuration: const Duration(seconds: 2),
      //overlayBlur: 5,
      borderRadius: 25,
      icon: isAlert
          ? const Icon(
              Icons.dangerous,
              size: 25,
              color: lightGray,
            )
          : Icon(
              FontAwesomeIcons.circleCheck,
              size: 25,
              color: Colors.green.shade600,
            ),
      snackPosition: SnackPosition.TOP,
      duration: const Duration(seconds: 2),
      margin: const EdgeInsets.symmetric(horizontal: 15),
    ),
  );
}
