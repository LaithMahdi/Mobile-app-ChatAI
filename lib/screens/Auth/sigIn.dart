import 'package:chat_ai/helper/color.dart';
import 'package:chat_ai/helper/snackBar.dart';
import 'package:chat_ai/widgets/textFormCustom.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import '../../widgets/customButton.dart';
import '../../widgets/customLine.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    return Scaffold(
      backgroundColor: black,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
            child: Column(
              children: [
                Hero(
                  tag: "image",
                  child: Image.asset(
                    "assets/images/logoE.png",
                    width: Get.width * 0.2,
                  ),
                ),
                const SizedBox(height: 25),
                const Text(
                  "Welcome back,",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 0.5,
                    color: lightGray,
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
                      color: lightGray,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                textFormCustom(
                  controller: emailController,
                  hintText: "Email",
                  keyboradType: TextInputType.emailAddress,
                ),
                const SizedBox(height: 10),
                textFormCustom(
                  controller: passwordController,
                  hintText: "password",
                  keyboradType: TextInputType.visiblePassword,
                ),
                const SizedBox(height: 20),
                customButton(
                  title: "Log In",
                  isIcon: false,
                  onPressed: () {
                    if (emailController.text.isEmpty) {
                      snackbar(title: "Alert", message: "Mail required");
                    } else if (passwordController.text.isEmpty) {
                      snackbar(title: "Alert", message: "Password required");
                    }
                  },
                ),
                const SizedBox(height: 20),
                customLine(),
                const SizedBox(height: 20),
                customButton(
                  title: "Continue with Apple",
                  isIcon: true,
                  icon: FontAwesomeIcons.apple,
                  onPressed: () {},
                ),
                const SizedBox(height: 10),
                customButton(
                  title: "Continue with Google",
                  isIcon: true,
                  icon: FontAwesomeIcons.google,
                  onPressed: () {},
                ),
                const SizedBox(height: 10),
                customButton(
                  title: "Continue with Facebook",
                  isIcon: true,
                  icon: FontAwesomeIcons.facebook,
                  onPressed: () {},
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Already have an account?",
                      style: TextStyle(
                        fontSize: 16,
                        color: gray,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    TextButton(
                      onPressed: () => Get.toNamed("/signUp"),
                      child: const Text(
                        "Sign Up",
                        style: TextStyle(
                          fontSize: 16,
                          color: lightBlue,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}