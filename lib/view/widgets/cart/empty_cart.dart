import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app/routes/routes.dart';
import 'package:shop_app/utils/theme.dart';

class EmptyCart extends StatelessWidget {
  const EmptyCart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.shopping_cart,
            size: 150,
            color: Get.isDarkMode ? Colors.white : Colors.black,
          ),
          const SizedBox(
            height: 40,
          ),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: "Your Cart is ",
                  style: TextStyle(
                    color: Get.isDarkMode ? Colors.white : Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextSpan(
                  text: "Empty ",
                  style: TextStyle(
                    color: Get.isDarkMode ? pinkClr : mainColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            "Add items to get started",
            style: TextStyle(
              fontSize: 15,
              color: Get.isDarkMode ? Colors.white : Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          SizedBox(
            height: 50,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  elevation: 0,
                  primary:
                    Get.isDarkMode?pinkClr:mainColor
                ),
              onPressed: () {
                Get.toNamed(Routes.mainScreen);
              },
            child: const Text('Go to home',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
            ),
          ),
        ],
      ),
    );
  }
}
