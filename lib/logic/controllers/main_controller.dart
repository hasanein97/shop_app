import 'package:get/get.dart';
import 'package:shop_app/view/screens/category_screen.dart';
import 'package:shop_app/view/screens/favourites_screen.dart';
import 'package:shop_app/view/screens/home_screen.dart';
import 'package:shop_app/view/screens/settings_screen.dart';

class MainController extends GetxController{
  RxInt  currentIndex = 0.obs;
  final tabs = [
    HomeScreen(),
    CategoryScreen(),
    FavouriteScreen(),
    SettingsScreen(),
  ].obs;
  final title = [
    " My Shop",
    "Ctegories",
    "Favourites",
    "Settings",
  ].obs;
}