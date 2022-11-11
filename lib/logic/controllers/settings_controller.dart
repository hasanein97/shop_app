import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shop_app/utils/my_string.dart';
class SettingsController extends GetxController{
var switchValue = false.obs;
var storage = GetStorage();
var langLocal = ene;
String capitalize(String profileName){
  return profileName.split(" ").map((name) => name.capitalize).join(" ");
}
//Language
  @override
  void onInit() async{
    super.onInit();
    langLocal = await getLanguage;
  }
void saveLanguage(String lang)async{
  await storage.write("lang", lang);
}
Future <String>get getLanguage async{
  return await storage.read("lang");
}
void changeLanguage(String typeLang){
if(langLocal == typeLang){
   return;

}
if (typeLang==fr){
  langLocal =fr;
  saveLanguage(fr);
}else if (typeLang ==ara){
  langLocal =ara;
  saveLanguage(ara);
}else{
  langLocal =ene;
  saveLanguage(ene);
}update();
}
}