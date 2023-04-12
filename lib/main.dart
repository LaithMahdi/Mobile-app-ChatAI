import 'package:chat_ai/screens/Auth/sigIn.dart';
import 'package:chat_ai/screens/Auth/signUp.dart';
import 'package:chat_ai/screens/homeScreen.dart';
import 'package:chat_ai/screens/onboradingScreen.dart';
import 'package:chat_ai/screens/settingsScreen.dart';
import 'package:chat_ai/screens/splashScreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'middleware/authMiddleware.dart';

SharedPreferences? sharedPref;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  sharedPref = await SharedPreferences.getInstance();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Chat AI',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: "Manrope",
      ),
      initialRoute: "/",
      getPages: [
        GetPage(name: "/", page: () => const SplashScreen()),
        GetPage(name: "/onborad", page: () => const OnboradingScreen()),
        GetPage(
          name: "/login",
          page: () => const SignIn(),
          middlewares: [AuthMiddleware()],
        ),
        GetPage(name: "/signUp", page: () => const SignUp()),
        GetPage(
          name: "/home",
          page: () => const HomeScreen(),
          transition: Transition.fade,
          transitionDuration: const Duration(milliseconds: 500),
        ),
        GetPage(
          name: "/settings",
          page: () => const SettingsScreen(),
          transition: Transition.cupertino,
          transitionDuration: const Duration(milliseconds: 500),
        ),
      ],
    );
  }
}
