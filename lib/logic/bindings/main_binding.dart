import 'package:get/get.dart';
import 'package:shop_app/logic/controllers/main_controller.dart';
import 'package:shop_app/logic/controllers/payment_controller.dart';
import 'package:shop_app/logic/controllers/settings_controller.dart';

class MainBinding extends Bindings{
  @override
  void dependencies() {
Get.put(MainController());
Get.put(SettingsController());
Get.put(PaymentController(),permanent: true);
  }
}