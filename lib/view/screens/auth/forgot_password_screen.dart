import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app/logic/controllers/auth_controller.dart';
import 'package:shop_app/utils/my_string.dart';
import 'package:shop_app/utils/theme.dart';
import 'package:shop_app/view/widgets/auth/auth_button.dart';
import 'package:shop_app/view/widgets/auth/auth_text_from_field.dart';
class ForgetPasswordScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();

  ForgetPasswordScreen({Key? key}) : super(key: key);
final formKey = GlobalKey<FormState>();
final controller = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          backgroundColor:context.theme.backgroundColor,
          title: Text("Forget Password",style: TextStyle(
            color: Get.isDarkMode?mainColor:pinkClr,
          ),
          ),
          leading: IconButton(
            onPressed: (){Get.back();},
            icon: Icon(Icons.arrow_back,color: Get.isDarkMode?Colors.black:Colors.white,),

          ),
        ),
        backgroundColor: Get.isDarkMode?Colors.white:darkGreyClr,
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerRight,
                  child: IconButton(
                    onPressed: (){
                      Get.back();
                    },
                    icon: const Icon(Icons.close_rounded,color: Colors.white,),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text("If you want to recover your account,then please provide your email ID below..",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                  color:Get.isDarkMode? Colors.black:Colors.white,
                ),
                ),
                const SizedBox(
                  height: 50,
                ),
                Image.asset("assets/images/forgetpass copy.png",
                width: 250,
                ),
                const SizedBox(
                  height:50,
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
                  height: 50,
                ),
                GetBuilder<AuthController>(builder:(_) {
                  return AuthButton(
                      onPressed: (){
                        if (formKey.currentState!.validate()){
                          String email =emailController.text.trim();
                          controller.resetPasword(email);
                        }
                      },
                    text: "SEND",
                  );
                }
                ),
              ],
            ),
          ),
        ),
      ),
        ),
    );
  }
}

