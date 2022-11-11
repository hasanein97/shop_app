import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app/utils/theme.dart';
import 'package:shop_app/view/widgets/text_utils.dart';

class AuthButton extends StatelessWidget {
  final String text;
  final Function()onPressed;
  const AuthButton({required this.text,required this.onPressed,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        primary:Get.isDarkMode? mainColor:pinkClr,
        minimumSize: const Size(360, 50),
      ),
      child: TextUtils(
          underLine: TextDecoration.none,
          color: Colors.white,
          text: text,
          fontSize: 18,
          fontWeight: FontWeight.bold),
    );
  }
}
