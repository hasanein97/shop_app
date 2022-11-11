import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app/logic/controllers/cart_controller.dart';
import 'package:shop_app/model/product_%20models.dart';
import 'package:shop_app/utils/theme.dart';
import 'package:shop_app/view/widgets/text_utils.dart';

class AddCart extends StatelessWidget {
  final double price;
  final ProductModels productModels;
   AddCart({required this.productModels, required this.price, Key? key})
      : super(key: key);
final controller = Get.find <CartController>();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(25),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextUtils(
                  underLine: TextDecoration.none,
                  color: Colors.grey,
                  text: "Price",
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
              Text(
                "\$$price",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  height: 1.5,
                  color: Get.isDarkMode ? Colors.white : Colors.black,
                ),
              ),
            ],
          ),
          const SizedBox(
            width: 20,
          ),
          Expanded(
            child: SizedBox(
              height: 60,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  elevation: 0,
                  primary:Get.isDarkMode? pinkClr: mainColor,
                ),
                onPressed: () {
                  controller.addProductToCart(productModels);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      "Add to cart",
                      style: TextStyle(
                        fontSize: 20,
                        color:Colors.white,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Icon(Icons.shopping_cart_outlined),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
