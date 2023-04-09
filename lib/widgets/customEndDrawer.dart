import 'package:chat_ai/controller/homeController.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import '../helper/color.dart';
import 'customIconButton.dart';

Drawer customEndDrawer({
  required String accountName,
  required String accountEmail,
  required accountPicture,
}) =>
    Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
              decoration: const BoxDecoration(color: lightBlue),
              accountName: Text(
                accountName == "null" ? "Laith" : accountName,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: lightGray,
                ),
              ),
              accountEmail: Text(
                accountEmail,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              currentAccountPicture: Container(
                width: Get.width * 0.2,
                height: Get.height * 0.2,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  image: const DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage(
                      "assets/images/person.jpg",
                    ),
                  ),
                ),
              )),
          customIconButton(
            title: "Settings",
            icon: FontAwesomeIcons.gear,
            onTap: () => Get.toNamed("/settings"),
          ),
          const SizedBox(height: 15),
          customIconButton(
            title: "Language",
            icon: FontAwesomeIcons.globe,
            onTap: () {},
          ),
          const SizedBox(height: 15),
          customIconButton(
            title: "Feedback and support",
            icon: FontAwesomeIcons.commentDots,
            onTap: () {},
          ),
          const SizedBox(height: 15),
          customIconButton(
            title: "About",
            icon: FontAwesomeIcons.circleInfo,
            onTap: () {},
          ),
          SizedBox(height: Get.height * 0.2),
          GetBuilder<HomeController>(
            init: HomeController(),
            builder: (controller) => controller.isload
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      CircularProgressIndicator(
                        backgroundColor: lightBlue,
                        color: gray,
                      ),
                      SizedBox(height: 5),
                      Text(
                        "Logout ...",
                        style: TextStyle(
                          fontSize: 14,
                          color: lightBlue,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  )
                : customIconButton(
                    title: "Log out",
                    icon: FontAwesomeIcons.rightFromBracket,
                    onTap: () => controller.logout(),
                    isBorder: true,
                  ),
          )
        ],
      ),
    );
