import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app/utils/theme.dart';
import 'package:shop_app/view/widgets/settings/dark_mode_widget.dart';
import 'package:shop_app/view/widgets/settings/language_widget.dart';
import 'package:shop_app/view/widgets/settings/log_out_widget.dart';
import 'package:shop_app/view/widgets/settings/profile_widget.dart';
import 'package:shop_app/view/widgets/text_utils.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      body: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          ProfileWidget(),
          const SizedBox(
            height: 10,
          ),
          Divider(
            color: Get.isDarkMode ? Colors.white : Colors.grey,
          ),
          const SizedBox(
            height: 20,
          ),
          TextUtils(
              underLine: TextDecoration.none,
              color:Get.isDarkMode? pinkClr:mainColor,
              text: "GENERAL".tr,
              fontSize: 18,
              fontWeight: FontWeight.bold),
          const SizedBox(
            height: 20,
          ),
          DarkModeWidget(),
          const SizedBox(
            height: 20,
          ),
         LanguageWidget(),
          const SizedBox(
            height: 20,
          ),
          LogOutWidget(),
        ],
      ),

    );
  }
}
