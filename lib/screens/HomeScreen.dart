import 'package:chat_ai/controller/homeController.dart';
import 'package:chat_ai/widgets/customAppBar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../helper/data.dart';
import '../widgets/customEndDrawer.dart';
import '../widgets/customSearchBar.dart';
import '../widgets/item.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
          children: [
            Expanded(child: customAppBar()),
            Expanded(
              flex: 10,
              child: SingleChildScrollView(
                padding:
                    const EdgeInsets.symmetric(vertical: 25, horizontal: 10),
                child: Column(
                  children: [
                    customSearchBar(),
                    const SizedBox(height: 20),
                    ListView.separated(
                      itemCount: listItem.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) => item(
                        title: listItem[index].title,
                        substitle: listItem[index].substitle,
                        paragraph: listItem[index].paragraph,
                        date: listItem[index].date,
                      ),
                      separatorBuilder: (context, index) =>
                          const SizedBox(height: 15),
                    )
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
