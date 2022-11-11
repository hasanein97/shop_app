import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app/utils/theme.dart';
import 'package:shop_app/view/widgets/home/card_items.dart';
import 'package:shop_app/view/widgets/home/search_text_form.dart';
import 'package:shop_app/view/widgets/text_utils.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: context.theme.backgroundColor,
        body: Column(
          children: [
            Container(
              width: double.infinity,
              height: 180,
              decoration: BoxDecoration(
                color: Get.isDarkMode ? darkGreyClr : mainColor,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextUtils(
                        underLine: TextDecoration.none,
                        color: Colors.white,
                        text: "Find Your",
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                    const SizedBox(
                      height: 5,
                    ),
                    TextUtils(
                        underLine: TextDecoration.none,
                        color: Colors.white,
                        text: "INSPIRATION",
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                    const SizedBox(
                      height: 20,
                    ),
                    SearchFormText(),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Align(
                alignment: Alignment.topLeft,
                child: TextUtils(
                    underLine: TextDecoration.none,
                    color:Get.isDarkMode? Colors.white:Colors.black,
                    text: "Categories",
                    fontSize: 20,
                    fontWeight: FontWeight.w500),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            CardItems(),
          ],
        ),
      ),
    );
  }
}
