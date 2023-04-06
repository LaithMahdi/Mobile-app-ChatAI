import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import '../../helper/color.dart';
import '../../helper/snackBar.dart';
import '../../widgets/customButton.dart';
import '../../widgets/textFormCustom.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    TextEditingController nameController = TextEditingController();
    return Scaffold(
      backgroundColor: black,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: GestureDetector(
                  child: const Icon(
                    FontAwesomeIcons.arrowLeft,
                    size: 25,
                    color: lightGray,
                  ),
                  onTap: () => Get.back(),
                ),
              ),
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
                  "We happy to see your here .Enter your name, email address and password",
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
                controller: nameController,
                hintText: "Name",
                keyboradType: TextInputType.text,
              ),
              const SizedBox(height: 10),
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
                  if (nameController.text.isEmpty) {
                    snackbar(title: "Alert", message: "Name required");
                  } else if (emailController.text.isEmpty) {
                    snackbar(title: "Alert", message: "Mail required");
                  } else if (passwordController.text.isEmpty) {
                    snackbar(title: "Alert", message: "Password required");
                  }
                },
              ),
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
    );
  }
}
