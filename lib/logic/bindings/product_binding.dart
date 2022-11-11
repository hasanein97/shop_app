import 'package:get/get.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:shop_app/logic/controllers/cart_controller.dart';
import 'package:shop_app/logic/controllers/category_controller.dart';
import 'package:shop_app/logic/controllers/product_controller.dart';

class ProductBinding extends Bindings{
  @override
  void dependencies() {
  Get.put(ProductController());
  Get.lazyPut(() => CartController());
  Get.put(CategoryController());
  }

}