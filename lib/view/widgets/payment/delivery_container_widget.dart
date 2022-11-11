import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app/logic/controllers/auth_controller.dart';
import 'package:shop_app/logic/controllers/payment_controller.dart';
import 'package:shop_app/routes/routes.dart';
import 'package:shop_app/utils/theme.dart';
import 'package:shop_app/view/widgets/text_utils.dart';

class DeliveryContainerWidget extends StatefulWidget {
  const DeliveryContainerWidget({Key? key}) : super(key: key);

  @override
  _DeliveryContainerWidgetState createState() =>
      _DeliveryContainerWidgetState();
}

class _DeliveryContainerWidgetState extends State<DeliveryContainerWidget> {
  final TextEditingController phoneController = TextEditingController();
  final authController =Get.find<AuthController>();
  int radioContainerIndex = 1;
  bool changeColor = false;
  final controller = Get.find<PaymentController>();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildRadioContainer(
            address: "Iraq",
            name: authController.disPlayUserName.value,
            phone: "00964784642",
            title: "shop",
            value: 1,
            color: changeColor ? Colors.white : Colors.grey.shade300,
            icon: Container(),
            onChanged: (int? value) {
              setState(() {
                radioContainerIndex = value!;
                changeColor = !changeColor;
              });
            }),
        const SizedBox(
          height: 10,
        ),
        Obx(()=>buildRadioContainer(
            address: controller.address.value,
            name: authController.disPlayUserName.value,
            phone:controller.phoneNumber.value,
            title: "delivery",
            value: 2,
            color: changeColor ? Colors.grey.shade300 : Colors.white,
            icon: InkWell(
                onTap: () {
                  Get.defaultDialog(
                    title: "Enter your phone number",
                    titleStyle: const TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                    backgroundColor: Colors.white,
                    radius: 10,
                    textCancel: "Cancel",
                    confirmTextColor: Colors.black,
                    textConfirm: "Save",
                    cancelTextColor: Colors.black,
                    onCancel: () {
                      Get.toNamed(Routes.paymentScreen);
                    },
                    onConfirm: () {
                      Get.back();
                      controller.phoneNumber.value=phoneController.text;
                    },
                    buttonColor: Get.isDarkMode ? pinkClr : mainColor,
                    content: Padding(
                      padding: const EdgeInsets.all(15),
                      child: TextField(
                        controller: phoneController,
                        maxLength: 11,
                        cursorColor: Colors.black,
                        keyboardType: TextInputType.text,
                        onSubmitted: (value){
                          phoneController.text = value;
                        },
                        decoration: InputDecoration(
                          fillColor:Get.isDarkMode?pinkClr: mainColor.withOpacity(0.2),
                          focusColor: Colors.red,
                          prefixIcon:  Icon(
                            Icons.phone,
                            color:Get.isDarkMode?pinkClr: mainColor,
                          ),
                          suffixIcon: IconButton(
                            onPressed: (){
                              phoneController.clear();
                            },
                            icon: const Icon(Icons.close,
                              color: Colors.black,
                            ),
                          ),
                          hintText: "Enter Your Phone Number",
                          hintStyle: const TextStyle(
                            color: Colors.black45,
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                          filled: true,
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.white,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.white,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.white,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),
                  );
                },
                child: Icon(
                  Icons.contact_phone,
                  size: 20,
                  color: Get.isDarkMode ? pinkClr : mainColor,
                )),
            onChanged: (int? value) {
              setState(() {
                radioContainerIndex = value!;
                changeColor = !changeColor;
              });
              controller.updatePosition();
            }
        ),),
      ],
    );
  }

  Widget buildRadioContainer({
    required Color color,
    required int value,
    required Function onChanged,
    required String name,
    required String title,
    required String phone,
    required String address,
    required Widget icon,
  }) {
    return Container(
      height: 120,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: color,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 3,
            blurRadius: 5,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Radio(
            value: value,
            groupValue: radioContainerIndex,
            onChanged: (int? value) {
              onChanged(value);
            },
            fillColor: MaterialStateColor.resolveWith((states) => Colors.red),
          ),
          const SizedBox(
            width: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextUtils(
                    underLine: TextDecoration.none,
                    color: Colors.black,
                    text: title,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
                const SizedBox(
                  height: 5,
                ),
                TextUtils(
                    underLine: TextDecoration.none,
                    color: Colors.black,
                    text: name,
                    fontSize: 15,
                    fontWeight: FontWeight.normal),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    const Text("+964 "),
                    TextUtils(
                        underLine: TextDecoration.none,
                        color: Colors.black,
                        text: phone,
                        fontSize: 15,
                        fontWeight: FontWeight.normal),
                    const SizedBox(
                      width: 120,
                    ),
                    SizedBox(
                      child: icon,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                TextUtils(
                    underLine: TextDecoration.none,
                    color: Colors.black,
                    text: address,
                    fontSize: 15,
                    fontWeight: FontWeight.normal),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
