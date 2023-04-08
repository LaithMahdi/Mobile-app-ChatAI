import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../helper/color.dart';

Widget customSearchBar() => TextFormField(
      cursorColor: black,
      style: const TextStyle(
        fontSize: 16,
        color: black,
        fontWeight: FontWeight.w700,
      ),
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 30,
          vertical: 20,
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(25),
        ),
        filled: true,
        fillColor: lightGray,
        prefixIcon: const Icon(
          FontAwesomeIcons.magnifyingGlass,
          size: 20,
          color: black,
        ),
        hintText: "Search",
        hintStyle: const TextStyle(
          color: textHint,
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
