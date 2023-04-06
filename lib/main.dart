import 'package:chat_ai/screens/Auth/sigIn.dart';
import 'package:chat_ai/screens/Auth/signUp.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Chat AI',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: "Manrope",
      ),
      initialRoute: "/login",
      getPages: [
        GetPage(name: "/login", page: () => const SignIn()),
        GetPage(name: "/signUp", page: () => const SignUp()),
      ],
    );
  }
}
