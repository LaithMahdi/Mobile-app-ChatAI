import 'package:chat_ai/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    if (sharedPref!.getBool("login") != false) {
      return const RouteSettings(name: '/home');
    }
    return null;
  }
}
