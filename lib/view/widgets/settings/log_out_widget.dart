import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app/logic/controllers/auth_controller.dart';
import 'package:shop_app/utils/theme.dart';
import 'package:shop_app/view/widgets/text_utils.dart';
class LogOutWidget extends StatelessWidget {
   LogOutWidget({Key? key}) : super(key: key);
final controller = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(
        builder: (_) =>
            Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () {
                  Get.defaultDialog(
                    title: "Logout From App",
                    titleStyle: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.black,
                    ),
                    middleText: 'Are you sure you need to logout',
                    middleTextStyle: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.black,
                    ),
                    backgroundColor: Colors.grey,
                    radius: 10,
                    textCancel: "No",
                    cancelTextColor: Colors.white,
                    textConfirm: "Yes",
                    confirmTextColor: Colors.white,
                    onCancel: () {
                      Get.back();
                    },
                    onConfirm: () {
                      controller.signOutFromApp();
                    },
                    buttonColor: Get.isDarkMode ? pinkClr : mainColor,
                  );
                  controller.signOutFromApp();
                },
                splashColor: Get.isDarkMode ? mainColor : Colors.pink,
                borderRadius: BorderRadius.circular(12),
                customBorder: const StadiumBorder(),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(6),
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: logOutSettings,
                      ),
                      child: const Icon(
                        Icons.logout,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    TextUtils(
                        underLine: TextDecoration.none,
                        color: Get.isDarkMode ? Colors.white : Colors.black,
                        text: "Logout".tr,
                        fontSize: 22,
                        fontWeight: FontWeight.bold)
                  ],
                ),
              ),
            )
    );
  }
}
