import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app/model/product_%20models.dart';
import 'package:shop_app/routes/routes.dart';
import 'package:shop_app/utils/theme.dart';

class CartController extends GetxController {
  var productMap = {}.obs;

  void addProductToCart(ProductModels productModels) {
    if (productMap.containsKey(productModels) &&
        productMap[productModels] == 1) {
      productMap[productModels] += 1;
      productMap.removeWhere((key, value) => key == productModels);
    } else {
      productMap[productModels] = 1;
    }
  }

  void removeProductsFromCart(ProductModels productModels) {
    if (productMap.containsKey(productModels)) {
    } else {
      productMap[productModels] -= 1;

  }
  Get.snackbar(
  "Error!",
  "$productMap[p]",
  snackPosition: SnackPosition.BOTTOM,
  backgroundColor: Colors.green,
  colorText: Colors.white,
  );
  }
  void removeOneProduct(ProductModels productModels) {
    productMap.removeWhere((key, value) => key == productModels);
  }

  void clearAllProduct() {
    Get.defaultDialog(
      title: "Clean Products",
      titleStyle: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 18,
        color: Colors.black,
      ),
      middleText: 'Are you sure you need clear products',
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
        Get.toNamed(Routes.cartScreen);
      },
      onConfirm: () {
        productMap.clear();
        Get.back();
      },
      buttonColor: Get.isDarkMode ? pinkClr : mainColor,
    );
  }

  get productSubTotal =>
      productMap.entries.map((e) => e.key.price * e.value).toList();
  get total => productMap.entries
      .map((e) => e.key.price * e.value)
      .toList()
      .reduce((value, element) => value + element)
      .toStringAsFixed(2);

  int quantity() {
    if(productMap.isEmpty){
      return 0;
    }else { return productMap.entries
        .map((e) => e.value)
        .toList()
        .reduce((value, element) => value + element);
    }
  }
}
