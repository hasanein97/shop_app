import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app/logic/controllers/auth_controller.dart';
import 'package:shop_app/utils/theme.dart';
import 'package:shop_app/view/widgets/text_utils.dart';

class CheckWidget extends StatelessWidget {
  CheckWidget({Key? key}) : super(key: key);
  final controller = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(
      builder: (_) {
        return Row(
          children: [
            InkWell(
              onTap: () {
                controller.CheckBox();
              },
              child: Container(
                height: 35,
                width: 35,
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(10),
                ),
                child:controller.isCheckBox
                    ?Get.isDarkMode?
                Image.asset('assets/images/check.png')
                :const Icon(Icons.done,
                color: pinkClr,
                )
                    :Container(),

              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Row(
              children: [
                TextUtils(
                    underLine: TextDecoration.none,
                    color: Get.isDarkMode ? Colors.black : Colors.white,
                    text: 'I accept',
                    fontSize: 16,
                    fontWeight: FontWeight.normal),
                TextUtils(
                    underLine: TextDecoration.underline,
                    color: Get.isDarkMode ? Colors.black : Colors.white,
                    text: 'terms & conditions',
                    fontSize: 16,
                    fontWeight: FontWeight.normal),
              ],
            ),
          ],
        );
      },
    );
  }
}
