import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app/logic/controllers/auth_controller.dart';
import 'package:shop_app/logic/controllers/settings_controller.dart';
import 'package:shop_app/view/widgets/text_utils.dart';

class ProfileWidget extends StatelessWidget {
   ProfileWidget({Key? key}) : super(key: key);
final controller = Get.find<SettingsController>();
final authController = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Obx(()=> Row(
          children: [
            Container(
              height: 100,
              width: 100,
              decoration:  BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: NetworkImage(
                 authController.displayUserPhoto.value,
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(
              width: 15,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextUtils(
                    underLine: TextDecoration.none,
                    color:Get.isDarkMode ? Colors.white: Colors.black,
                    text: controller.capitalize(authController.disPlayUserName.value),
                    fontSize: 22,
                    fontWeight: FontWeight.bold
                ),
                TextUtils(
                    underLine: TextDecoration.none,
                    color:Get.isDarkMode ? Colors.white: Colors.black,
                    text:authController.displayUserEmail.value,
                    fontSize:14,
                    fontWeight: FontWeight.bold
                ),
              ],
            ),
          ],
        ), ),
      ],
    );
  }
}
