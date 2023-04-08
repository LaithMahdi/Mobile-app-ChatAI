import 'package:chat_ai/controller/homeController.dart';
import 'package:chat_ai/helper/data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../helper/color.dart';
import '../widgets/customAppBar.dart';
import '../widgets/customEndDrawer.dart';
import '../widgets/customSearchBar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());
    return controller.isload
        ? const CircularProgressIndicator()
        : Scaffold(
            endDrawer: customEndDrawer(
              accountName: controller.auth.currentUser!.displayName.toString(),
              accountEmail: controller.auth.currentUser!.email.toString(),
              accountPicture: controller.auth.currentUser!.photoURL.toString(),
            ),
            body: SafeArea(
              child: Column(
                children: [
                  customAppBar(),
                  //const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 25, horizontal: 10),
                    child: Column(
                      children: [
                        customSearchBar(),
                        const SizedBox(height: 20),
                        ListView.builder(
                          itemCount: listItem.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) => item(
                            title: listItem[index].title,
                            substitle: listItem[index].substitle,
                            paragraph: listItem[index].paragraph,
                            date: listItem[index].date,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
  }
}

Widget item({
  required String title,
  required String substitle,
  required String paragraph,
  required String date,
}) =>
    ListTile(
      trailing: Text(
        date,
        style: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w500,
          color: textHint,
        ),
      ),
      leading: Container(
        width: Get.width * 0.15,
        height: Get.height * 0.15,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: darkGray,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Text(
          substitle.toUpperCase(),
          style: const TextStyle(
            color: lightGray,
            fontSize: 14,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      title: Text(
        title,
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: black,
        ),
      ),
      subtitle: Text(
        paragraph,
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w400,
          color: textHint,
        ),
      ),
    );
/* 
Container(
      padding: const EdgeInsets.all(10),
      width: Get.width,
      decoration: BoxDecoration(
        color: gray.withOpacity(0.2),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          Container(
            width: 70,
            height: 70,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: darkGray,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Text(
              substitle.toUpperCase(),
              style: const TextStyle(
                color: lightGray,
                fontSize: 14,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),

          const SizedBox(width: 10),
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: black,
                ),
              ),
              Text(
                paragraph,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: textHint,
                ),
              ),
            ],
          ),
          //const Spacer(),
          Text(
            date,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: textHint,
            ),
          ),
        ],
      ),
    )
*/