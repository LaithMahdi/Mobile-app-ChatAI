import 'package:chat_ai/helper/color.dart';
import 'package:chat_ai/widgets/logo.dart';
import 'package:chat_ai/widgets/textFormCustomer.dart';
import 'package:flutter/material.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    return Scaffold(
      backgroundColor: black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
          child: Column(
            children: [
              logo(),
              const SizedBox(height: 25),
              const Text(
                "Welcome back,",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 0.5,
                ),
              ),
              const SizedBox(height: 5),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.8,
                child: const Text(
                  "We happy to see your here again.Enter your email address  and password",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              textFormCustomer(
                controller: emailController,
                hintText: "Email",
              ),
              textFormCustomer(
                controller: passwordController,
                hintText: "password",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
