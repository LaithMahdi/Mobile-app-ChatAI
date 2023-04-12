import 'package:chat_ai/controller/signUpController.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import '../../helper/color.dart';
import '../../widgets/customButton.dart';
import '../../widgets/textFormCustom.dart';
import '../../widgets/textFormPasswordCustom.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignUpController());
    return Scaffold(
      backgroundColor: black,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                child: const Icon(
                  FontAwesomeIcons.arrowLeft,
                  size: 25,
                  color: lightGray,
                ),
                onTap: () => Get.back(),
              ),
              //const Spacer(),
              SizedBox(height: Get.height * 0.05),
              Center(
                child: Image.asset(
                  "assets/images/logoE.png",
                  width: Get.width * 0.2,
                ),
              ),
              const SizedBox(height: 25),
              const Center(
                child: Text(
                  "Welcome back,",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 0.5,
                    color: lightGray,
                  ),
                ),
              ),
              const SizedBox(height: 5),
              Center(
                child: SizedBox(
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
              ),
              const SizedBox(height: 20),
              textFormCustom(
                controller: controller.nameController,
                hintText: "Name",
                keyboradType: TextInputType.text,
              ),
              const SizedBox(height: 10),
              textFormCustom(
                controller: controller.emailController,
                hintText: "Email",
                keyboradType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 10),
              textFormPasswordCustom(
                controller: controller.passwordController,
                hintText: "password",
                keyboradType: TextInputType.visiblePassword,
              ),
              const SizedBox(height: 20),
              GetBuilder<SignUpController>(
                init: SignUpController(),
                builder: (c) => c.isload
                    ? const Center(
                        child: CircularProgressIndicator(
                          backgroundColor: lightBlue,
                          color: gray,
                        ),
                      )
                    : customButton(
                        title: "Sign Up",
                        isIcon: false,
                        onPressed: () => controller.createAccount(),
                      ),
              ),
              SizedBox(height: Get.height * 0.15),
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
                      "Sign In",
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
