 //@dart= 2.9
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shop_app/language/localiztion.dart';
import 'package:shop_app/logic/controllers/theme_controller.dart';
import 'package:shop_app/routes/routes.dart';
import 'package:shop_app/utils/my_string.dart';
import 'package:shop_app/utils/theme.dart';
import 'package:shop_app/view/screens/welcome_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  await Firebase.initializeApp();
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Asroo shop',
      debugShowCheckedModeBanner: false,
      locale:  Locale(GetStorage().read<String>('lang').toString()),
      fallbackLocale: Locale(ene),
      translations: LocaliztionApp(),
      theme: ThemesApp.light,
      darkTheme: ThemesApp.dark,
      themeMode: ThemeController().themeDataGet,
      initialRoute: FirebaseAuth.instance.currentUser != null ||
              GetStorage().read<bool>('auth') == true
          ? AppRoutes.mainScreen
          : AppRoutes.welcome,
      getPages: AppRoutes.routes,
    );
  }
}
