import 'package:get/route_manager.dart';
import 'package:shop_app/language/ar.dart';
import 'package:shop_app/language/en.dart';
import 'package:shop_app/language/fre.dart';
import 'package:shop_app/utils/my_string.dart';
class LocaliztionApp extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        ene: en,
        ara: ar,
        fr: fre,


  };
}
