import 'package:get/get.dart';
import 'package:shop_app/logic/bindings/auth_binding.dart';
import 'package:shop_app/logic/bindings/main_binding.dart';
import 'package:shop_app/logic/bindings/product_binding.dart';
import 'package:shop_app/logic/controllers/product_controller.dart';
import 'package:shop_app/view/screens/auth/forgot_password_screen.dart';
import 'package:shop_app/view/screens/auth/login_screen.dart';
import 'package:shop_app/view/screens/auth/signup_screen.dart';
import 'package:shop_app/view/screens/cart_screen.dart';
import 'package:shop_app/view/screens/main_screen.dart';
import 'package:shop_app/view/screens/payment_screen.dart';
import 'package:shop_app/view/screens/welcome_screen.dart';

class AppRoutes{
 // initialRoute
  static const welcome = Routes.welcomeScreen;
  static const mainScreen = Routes.mainScreen;
  //getPages
  static final routes = [
  GetPage(
    name: Routes.welcomeScreen,
  page: ()=> const WelcomeScreen(),
  ),
    GetPage(
      name: Routes.loginScreen,
      page: ()=>  LogInScreen(),
      binding: AuthBinding(),

    ),
    GetPage(
      name: Routes.signUpScreen,
      page: ()=>  SignUpScreen(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.ForgetPasswordScreen,
      page: ()=>  ForgetPasswordScreen(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.mainScreen,
      page: ()=>   MainScreen(),
      bindings: [
        AuthBinding(),
        MainBinding(),
        ProductBinding(),
      ],
    ),
    GetPage(
      name: Routes.ForgetPasswordScreen,
      page: ()=>  ForgetPasswordScreen(),
      binding: AuthBinding(),
    ),GetPage(
      name: Routes.cartScreen,
      page: ()=>  CartScreen(),
      bindings: [
        AuthBinding(),
        ProductBinding(),
      ],
    ),
    GetPage(
      name: Routes.paymentScreen,
      page: ()=>  PaymentScreen(),
      bindings: [
        AuthBinding(),
        ProductBinding(),
        MainBinding(),
      ],
    ),


  ];
}
class Routes{
  static const welcomeScreen = '/welcomeScreen';
  static const loginScreen = '/loginScreen';
  static const signUpScreen = '/signUpScreen';
  static const ForgetPasswordScreen = '/forgetPasswordScreen';
  static const mainScreen = '/mainScreen';
  static const cartScreen ='/cartScreen';
  static const paymentScreen ='/paymentScreen';
}