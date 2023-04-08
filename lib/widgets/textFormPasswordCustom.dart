import 'package:chat_ai/controller/textFormController.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import '../helper/color.dart';

Widget textFormPasswordCustom({
  required TextEditingController controller,
  required String hintText,
  required TextInputType keyboradType,
}) =>
    GetBuilder<TextFormController>(
      init: TextFormController(),
      builder: (c) => TextFormField(
        controller: controller,
        keyboardType: keyboradType,
        cursorColor: gray,
        style: const TextStyle(
          fontSize: 16,
          color: gray,
          fontWeight: FontWeight.w700,
        ),
        obscureText: c.isObscure,
        obscuringCharacter: "*",
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
          suffixIcon: GestureDetector(
            child: Icon(
              size: 15,
              color: lightGray,
              c.isObscure ? FontAwesomeIcons.eyeSlash : FontAwesomeIcons.eye,
            ),
            onTap: () => c.changeObscure(),
          ),
          hintStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: textHint,
          ),
        ),
      ),
    );
