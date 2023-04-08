import 'package:chat_ai/controller/homeController.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../helper/color.dart';
import '../widgets/customAppBar.dart';
import '../widgets/customSearchBar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());
    return Scaffold(
      drawer: customDrawer(onTap: () => controller.logout()),
      body: SafeArea(
          child: GetBuilder<HomeController>(
        init: HomeController(),
        builder: (c) => c.isload
            ? Column(
                children: const [
                  CircularProgressIndicator(
                    backgroundColor: lightBlue,
                    color: gray,
                  ),
                  Text("Deconnect"),
                ],
              )
            : Column(
                children: [
                  customAppBar(),
                  //const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 25, horizontal: 10),
                    child: customSearchBar(),
                  ),
                ],
              ),
      )),
    );
  }
}

Drawer customDrawer({
  required VoidCallback onTap,
}) =>
    Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const UserAccountsDrawerHeader(
            decoration: BoxDecoration(color: lightBlue),
            accountName: Text(
              "Pinkesh Darji",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            accountEmail: Text(
              "pinkesh.earth@gmail.com",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            currentAccountPicture: FlutterLogo(),
          ),
          ListTile(
            trailing: GestureDetector(
              onTap: onTap,
              child: const Icon(
                FontAwesomeIcons.rightFromBracket,
                color: gray,
                size: 20,
              ),
            ),
            title: const Text(
              'Log out',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                letterSpacing: 0.7,
                color: darkGray,
              ),
            ),
            onTap: () {
              //Navigator.pop(context);
            },
          ),
        ],
      ),
    );
