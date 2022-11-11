import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app/logic/controllers/auth_controller.dart';
import 'package:shop_app/routes/routes.dart';
import 'package:shop_app/utils/my_string.dart';
import 'package:shop_app/utils/theme.dart';
import 'package:shop_app/view/widgets/auth/auth_button.dart';
import 'package:shop_app/view/widgets/auth/auth_text_from_field.dart';
import 'package:shop_app/view/widgets/auth/container_under.dart';
import 'package:shop_app/view/widgets/text_utils.dart';

class LogInScreen extends StatelessWidget {
  LogInScreen({Key? key}) : super(key: key);
  final fromKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final controller = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Get.isDarkMode ? Colors.white : darkGreyClr,
          elevation: 0,
        ),
        backgroundColor: context.theme.backgroundColor,
        body: Column(
          children: [
            SizedBox(
              width: double.infinity,
              height: MediaQuery.of(context).size.height / 1.3,
              child: Padding(
                padding: const EdgeInsets.only(left: 25, right: 25, top: 20),
                child: Form(
                  key: fromKey,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          TextUtils(
                              underLine: TextDecoration.none,
                              color: Get.isDarkMode ? mainColor : pinkClr,
                              text: 'LOG',
                              fontSize: 28,
                              fontWeight: FontWeight.w500),
                          const SizedBox(
                            width: 3,
                          ),
                          TextUtils(
                              underLine: TextDecoration.none,
                              color:
                                  Get.isDarkMode ? Colors.black : Colors.white,
                              text: 'IN',
                              fontSize: 28,
                              fontWeight: FontWeight.w500),
                        ],
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      AuthTextFromField(
                        controller: emailController,
                        obscureText: false,
                        validator: (value) {
                          if (!RegExp(validationEmail).hasMatch(value)) {
                            return 'Invalid email';
                          } else {
                            return null;
                          }
                        },
                        prefixIcon: Get.isDarkMode
                            ? Image.asset(
                                'assets/images/email.png',
                              )
                            : const Icon(
                                Icons.email,
                                color: pinkClr,
                                size: 30,
                              ),
                        suffixIcon: const Text(""),
                        hintText: 'Email',
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      GetBuilder<AuthController>(
                        builder: (_) {
                          return AuthTextFromField(
                            controller: passwordController,
                            obscureText: controller.isVisibility ? false : true,
                            validator: (value) {
                              if (value.toString().length < 6) {
                                return 'Password should be longer or equal to 6 character';
                              } else {
                                return null;
                              }
                            },
                            prefixIcon: Get.isDarkMode
                                ? Image.asset(
                                    'assets/images/lock.png',
                                  )
                                : const Icon(
                                    Icons.lock,
                                    color: pinkClr,
                                    size: 30,
                                  ),
                            suffixIcon: IconButton(
                              onPressed: () {
                                controller.isVisibility;
                              },
                              icon: controller.isVisibility
                                  ? const Icon(
                                      Icons.visibility_off,
                                      color: Colors.black,
                                    )
                                  : const Icon(
                                      Icons.visibility,
                                      color: Colors.black,
                                    ),
                            ),
                            hintText: 'Password',
                          );
                        },
                      ),
                      TextButton(
                        onPressed: () {
                          Get.toNamed(Routes.ForgetPasswordScreen);
                        },
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: TextUtils(
                              underLine: TextDecoration.none,
                              color:
                                  Get.isDarkMode ? Colors.black : Colors.white,
                              text: 'Forget Password?',
                              fontSize: 14,
                              fontWeight: FontWeight.normal),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      GetBuilder<AuthController>(builder: (_) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(
                            child: AuthButton(
                              onPressed: () {
                                if (fromKey.currentState!.validate()) {
                                  String email = emailController.text.trim();
                                  String password = passwordController.text;
                                  controller.logInUsingFireBase(
                                      email: email, password: password);
                                }
                              }, text: 'LOG IN',
                            ),
                          ),
                        );
                      }),
                      const SizedBox(
                        height: 20,
                      ),
                      TextUtils(
                          underLine: TextDecoration.none,
                          color: Get.isDarkMode ? Colors.black : Colors.white,
                          text: 'OR',
                          fontSize: 18,
                          fontWeight: FontWeight.w500),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: () {
                              controller.faceBookSignApp();
                            },
                            child: Image.asset(
                              "assets/images/facebook.png",
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          GetBuilder<AuthController>(builder: (_) {
                            return InkWell(
                              onTap: () {
                                controller.googleSignUpApp();
                              },
                              child: Image.asset(
                                "assets/images/google.png",
                              ),
                            );
                          })
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            ContainerUnder(
              text: "Don't have an Account?",
              textType: "Sign Up",
              onPressed: () {
                Get.offNamed(Routes.signUpScreen);
              },
            ),
          ],
        ),
      ),
    );
  }
}
