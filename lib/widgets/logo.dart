import 'package:flutter/material.dart';

import '../helper/color.dart';

Widget logo() => Container(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: lightBlue,
      ),
      child: const Center(
        child: Text(
          "e",
          style: TextStyle(
            fontSize: 36,
            fontWeight: FontWeight.w700,
            color: lightGray,
          ),
        ),
      ),
    );
