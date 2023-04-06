import 'package:chat_ai/helper/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget customButton({
  required String title,
  required bool isIcon,
  IconData? icon,
  required VoidCallback onPressed,
}) =>
    ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: isIcon ? darkGray : lightBlue,
        textStyle: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: lightGray,
        ),
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
        minimumSize: Size(Get.width, 0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
      ),
      child: Row(
        mainAxisAlignment:
            isIcon ? MainAxisAlignment.start : MainAxisAlignment.center,
        children: [
          Icon(icon, size: 20, color: lightGray),
          isIcon ? const SizedBox(width: 15) : const SizedBox(width: 0),
          Text(title),
        ],
      ),
    );
