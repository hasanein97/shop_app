import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app/utils/theme.dart';
import 'package:shop_app/view/widgets/payment/delivery_container_widget.dart';
import 'package:shop_app/view/widgets/payment/payment_method_widget.dart';
import 'package:shop_app/view/widgets/text_utils.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("PayMent"),
        elevation: 0,
        backgroundColor: Get.isDarkMode ? darkGreyClr : mainColor,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextUtils(
                  underLine: TextDecoration.none,
                  color: Get.isDarkMode ? Colors.white : Colors.black,
                  text: "Shipping to",
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
              const SizedBox(
                height: 20,
              ),
              DeliveryContainerWidget(),
              const SizedBox(
                height: 20,
              ),
              TextUtils(
                  underLine: TextDecoration.none,
                  color: Get.isDarkMode ? Colors.white : Colors.black,
                  text: "Payment method",
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
              const SizedBox(
                height: 20,
              ),
              PaymentMethodWidget(),
              const SizedBox(
                height: 20,
              ),
              Center(
                child: TextUtils(
                    underLine: TextDecoration.none,
                    color: Get.isDarkMode?Colors.white:Colors.black,
                    text: "Total: 200\$",
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 50,
                width: 150,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                 shape: RoundedRectangleBorder(
                   borderRadius: BorderRadius.circular(10),
                 ),
                    elevation: 0,
                    primary: Get.isDarkMode?pinkClr:mainColor,
                  ),
                  onPressed: (){},
                  child: const Text("Pay Now",
                  style: TextStyle(
                    fontSize: 22,
                    color:Colors.white,

                  ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
