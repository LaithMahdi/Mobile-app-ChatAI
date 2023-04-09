import 'package:chat_ai/controller/settingsController.dart';
import 'package:chat_ai/widgets/customAppBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import '../controller/homeController.dart';
import '../helper/color.dart';
import '../widgets/customEndDrawer.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());
    return Scaffold(
      endDrawer: customEndDrawer(
        accountName: controller.auth.currentUser!.displayName.toString(),
        accountEmail: controller.auth.currentUser!.email.toString(),
        accountPicture: controller.auth.currentUser!.photoURL.toString(),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(child: customAppBar()),
            Expanded(
              flex: 10,
              child: SingleChildScrollView(
                padding:
                    const EdgeInsets.symmetric(vertical: 25, horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Stack(
                        children: [
                          Container(
                            width: Get.width * 0.3,
                            height: Get.height * 0.15,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              image: const DecorationImage(
                                image: AssetImage("assets/images/person.jpg"),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: Container(
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: lightGray,
                                borderRadius: BorderRadius.circular(100),
                              ),
                              child: const Icon(
                                FontAwesomeIcons.camera,
                                size: 20,
                                color: black,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 5),
                    const Center(
                      child: Text(
                        "Mahdi Laith",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: black,
                          letterSpacing: 0.8,
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),
                    const Text(
                      "Account",
                      style: TextStyle(
                        color: textHint,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 10),
                    settingsItem(
                      title: "User account",
                      icon: FontAwesomeIcons.user,
                      onTap: () {},
                    ),
                    GetBuilder<SettingsController>(
                      init: SettingsController(),
                      builder: (controller) => ListTile(
                        title: const Text(
                          "Dark mode",
                          style: TextStyle(
                            fontSize: 16,
                            color: black,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        leading: Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: black,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Icon(
                            controller.isChange
                                ? FontAwesomeIcons.moon
                                : FontAwesomeIcons.sun,
                            color: lightGray,
                            size: 20,
                          ),
                        ),
                        trailing: SizedBox(
                          width: Get.width * 0.15,
                          child: FlutterSwitch(
                            toggleColor: lightBlue,
                            activeColor: lightBlue,
                            inactiveColor: lightGray,
                            activeToggleColor: lightGray,
                            valueFontSize: 25.0,
                            //toggleSize: 45.0,
                            borderRadius: 30.0,
                            padding: 5.0,
                            onToggle: (val) {
                              controller.isChange = val;
                              controller.update();
                            },
                            value: controller.isChange,
                          ),
                        ),
                      ),
                    ),
                    settingsItem(
                      title: "Notifications",
                      icon: FontAwesomeIcons.bell,
                      onTap: () {},
                    ),
                    settingsItem(
                      title: "Privacy and Security",
                      icon: FontAwesomeIcons.lock,
                      onTap: () {},
                    ),
                    settingsItem(
                      title: "Language",
                      icon: FontAwesomeIcons.globe,
                      onTap: () {},
                    ),
                    settingsItem(
                      title: "Chatbot Settings",
                      icon: FontAwesomeIcons.gears,
                      onTap: () {},
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget settingsItem({
  required String title,
  required IconData icon,
  required VoidCallback onTap,
}) =>
    ListTile(
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 16,
          color: black,
          fontWeight: FontWeight.w400,
        ),
      ),
      leading: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: black,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Icon(
          icon,
          color: lightGray,
          size: 20,
        ),
      ),
      trailing: GestureDetector(
        onTap: onTap,
        child: const Icon(
          FontAwesomeIcons.angleRight,
          size: 20,
          color: gray,
        ),
      ),
    );
