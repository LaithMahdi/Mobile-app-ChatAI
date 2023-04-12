import 'package:chat_ai/controller/onboradingController.dart';
import 'package:chat_ai/helper/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnboradingScreen extends StatelessWidget {
  const OnboradingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnboradingController());
    return Scaffold(
      body: Column(
        children: [
          Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.center,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(50),
                  bottomRight: Radius.circular(50),
                ),
                child: Image.asset(
                  "assets/images/bg.jpg",
                  fit: BoxFit.fill,
                  width: Get.width,
                  height: Get.height * 0.65,
                ),
              ),
              Positioned(
                bottom: -35,
                child: Image.asset(
                  "assets/images/logoE.png",
                  width: Get.width * 0.2,
                ),
              ),
            ],
          ),
          const Spacer(),
          const Text(
            "Welcome to ChatEve",
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w800,
              color: black,
              letterSpacing: 0.5,
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            "Sign in or create an account to get started",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w300,
              color: textHint,
            ),
          ),
          const SizedBox(height: 25),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              customFirstButton(
                name: "Sign Up",
                isBorder: true,
                onTap: () {
                  Get.offNamed("/signUp");
                  controller.setClick();
                },
              ),
              customFirstButton(
                name: "Log In",
                isBorder: false,
                onTap: () {
                  Get.offNamed("/login");
                  controller.setClick();
                },
              ),
            ],
          ),
          const Spacer(),
        ],
      ),
    );
  }
}

Widget customFirstButton({
  required String name,
  required bool isBorder,
  required VoidCallback onTap,
}) =>
    GestureDetector(
      onTap: onTap,
      child: Container(
        width: Get.width * 0.45,
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(
          vertical: 15,
          horizontal: 25,
        ),
        decoration: BoxDecoration(
          border: Border.all(
            color: lightBlue,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(25),
          color: isBorder ? Colors.transparent : lightBlue,
        ),
        child: Text(
          name,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: isBorder ? lightBlue : lightGray,
          ),
        ),
      ),
    );
