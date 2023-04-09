import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../helper/color.dart';

Widget item({
  required String title,
  required String substitle,
  required String paragraph,
  required String date,
}) =>
    Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: lightGray.withOpacity(0.5),
      ),
      child: ListTile(
        trailing: Text(
          date,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: textHint,
          ),
        ),
        leading: Container(
          width: Get.width * 0.15,
          height: Get.height * 0.15,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: darkGray,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Text(
            title.substring(0, 2).toUpperCase(),
            style: const TextStyle(
              color: lightGray,
              fontSize: 14,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        title: Text(
          title,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: black,
          ),
        ),
        subtitle: Text(
          paragraph,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: textHint,
          ),
        ),
      ),
    );
