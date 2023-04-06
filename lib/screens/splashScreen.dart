import 'package:chat_ai/helper/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/splashController.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SplashController());
    return Scaffold(
      backgroundColor: black,
      body: SafeArea(
        child: Center(
          child: Image.asset(
            "assets/images/logoE.png",
            width: Get.width * 0.4,
          ),
        ),
      ),
    );
  }
}
