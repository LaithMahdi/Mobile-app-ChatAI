import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import '../helper/color.dart';

Widget customAppBar() => Card(
      margin: EdgeInsets.zero,
      color: lightGray,
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Builder(
              builder: (context) => GestureDetector(
                child: const Text(
                  "Chats",
                  style: TextStyle(
                    color: black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.5,
                  ),
                ),
                onTap: () => Scaffold.of(context).openDrawer(),
              ),
            ),
            Image.asset(
              "assets/images/logoE.png",
              width: Get.width * 0.1,
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                FontAwesomeIcons.gear,
                size: 25,
                color: black,
              ),
            )
          ],
        ),
      ),
    );
