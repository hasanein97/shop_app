import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app/routes/routes.dart';
import 'package:shop_app/utils/theme.dart';
import 'package:shop_app/view/screens/auth/login_screen.dart';
import 'package:shop_app/view/widgets/text_utils.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: Image.asset(
                'assets/images/background.png',
                fit: BoxFit.cover,
              ),
            ),
            Container(
              color: Colors.black.withOpacity(0.2),
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 100,
                  ),
                  Container(
                    height: 60,
                    width: 190,
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Center(
                      child: TextUtils(
                        text: 'Welcome',
                        fontWeight: FontWeight.bold,
                        fontSize: 35,
                        color: Colors.white,
                        underLine: TextDecoration.none,

                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 60,
                    width: 230,
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextUtils(
                          text: 'Asrro',
                          color: mainColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 35,
                          underLine: TextDecoration.none,

                        ),
                        const SizedBox(
                          width: 7,
                        ),
                        TextUtils(
                          text: 'Shop',
                          fontWeight: FontWeight.bold,
                          fontSize: 35,
                          color: Colors.white,
                          underLine: TextDecoration.none,

                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 200,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: mainColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 40, vertical: 12),
                    ),
                    onPressed: () {
                      Get.offNamed(Routes.loginScreen);
                    },
                    child: TextUtils(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      text: "Get Start",
                      underLine: TextDecoration.none,

                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextUtils(
                          color: Colors.white,
                          text: "Don't have an Account?",
                          fontSize: 18,
                          fontWeight: FontWeight.normal,
                        underLine: TextDecoration.none,
                      ),
                      TextButton(onPressed: (){
                        Get.offNamed(Routes.signUpScreen);
                      },
                        child: TextUtils(
                          text: 'Signup',
                          fontWeight: FontWeight.normal,
                          color: Colors.white,
                          fontSize: 18,
                          underLine: TextDecoration.underline,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
