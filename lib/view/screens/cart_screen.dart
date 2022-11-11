import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app/logic/controllers/cart_controller.dart';
import 'package:shop_app/utils/theme.dart';
import 'package:shop_app/view/widgets/cart/cart_product_card.dart';
import 'package:shop_app/view/widgets/cart/cart_total.dart';
import 'package:shop_app/view/widgets/cart/empty_cart.dart';

class CartScreen extends StatelessWidget {
  CartScreen({Key? key}) : super(key: key);
  final controller = Get.find<CartController>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: context.theme.backgroundColor,
        appBar: AppBar(
          title: const Text("Cart Items"),
          elevation: 0,
          backgroundColor: Get.isDarkMode ? darkGreyClr : mainColor,
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {
                controller.clearAllProduct();
              },
              icon: const Icon(Icons.backspace),
            )
          ],
        ),
        body: Obx(
          () {
            if (controller.productMap.isEmpty) {
              return const EmptyCart();
            } else {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: 500,
                      child: ListView.separated(
                          itemBuilder: (context, index) {
                            return CartProductCard(
                              quantity:
                                  controller.productMap.values.toList()[index],
                              index: index,
                              productModels:
                                  controller.productMap.keys.toList()[index],
                            );
                          },
                          separatorBuilder: (context, index) => const SizedBox(
                                height: 20,
                              ),
                          itemCount: controller.productMap.length),
                    ),
                     Padding(
                      padding: EdgeInsets.only(
                        bottom: 20,
                      ),
                      child: CartTotal(),
                    ),
                  ],
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
