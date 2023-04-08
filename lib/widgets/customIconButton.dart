import 'package:flutter/material.dart';
import '../helper/color.dart';

Widget customIconButton({
  required String title,
  required IconData icon,
  required VoidCallback onTap,
  bool? isBorder = false,
}) =>
    GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
        decoration: BoxDecoration(
          border: Border.all(
            color: isBorder == false ? lightBlue : Colors.transparent,
            width: isBorder == false ? 2 : 0,
          ),
          borderRadius: BorderRadius.circular(10),
          color: isBorder == true ? lightBlue : Colors.transparent,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 20,
              color: isBorder == false ? lightBlue : lightGray,
            ),
            const SizedBox(width: 10),
            Text(
              title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                letterSpacing: 0.7,
                color: isBorder == false ? lightBlue : lightGray,
              ),
            ),
          ],
        ),
      ),
    );
