import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../helper/color.dart';

Widget customLine() => Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: Get.width * 0.4,
          child: const Divider(
            color: gray,
            thickness: 2,
          ),
        ),
        const Text(
          "Or",
          style: TextStyle(
            color: gray,
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
        ),
        SizedBox(
          width: Get.width * 0.4,
          child: const Divider(
            color: gray,
            thickness: 2,
          ),
        ),
      ],
    );
