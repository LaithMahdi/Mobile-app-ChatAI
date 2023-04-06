import 'package:chat_ai/helper/color.dart';
import 'package:flutter/material.dart';

Widget textFormCustom({
  required TextEditingController controller,
  required String hintText,
  required TextInputType keyboradType,
}) =>
    TextFormField(
      controller: controller,
      keyboardType: keyboradType,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 25,
          vertical: 20,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
          borderSide: BorderSide.none,
        ),
        filled: true,
        fillColor: darkGray,
        hintText: hintText,
        hintStyle: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: textHint,
        ),
      ),
    );
