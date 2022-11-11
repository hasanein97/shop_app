import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app/utils/theme.dart';
import 'package:shop_app/view/widgets/text_utils.dart';

class ContainerUnder extends StatelessWidget {
  final String text;
  final Function() onPressed;
  final String textType;
  const ContainerUnder({required this.textType,required this.onPressed,required this.text,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 77,
      decoration:  BoxDecoration(
        color:Get.isDarkMode? mainColor:pinkClr,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextUtils(
              underLine: TextDecoration.none,
              color: Colors.white,
              text: text,
              fontSize: 20,
              fontWeight: FontWeight.bold),
          TextButton(
            onPressed:onPressed,
              child: TextUtils(
                  underLine: TextDecoration.none,
                  color: Colors.white,
                  text: textType,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),)
        ],
      ),
    );
  }
}
