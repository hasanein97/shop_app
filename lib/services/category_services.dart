import 'package:http/http.dart' as http;
import 'package:shop_app/model/category_model.dart';
import 'package:shop_app/model/product_%20models.dart';
import 'package:shop_app/utils/my_string.dart';
class CategorytServices{
  static Future <List <String>> getCategory()async{
    var response =   await  http.get(Uri.parse('$baseUrl/products/categories'));
    if  (response.statusCode== 200){
      var jsonData = response.body;
      return categoryModelFromJson(jsonData);
    }
    else{
      return throw Exception("Failed to load roduct");
    }
  }
}
class ALLCategoryServices{
  static Future <List <ProductModels>> getAllCategory(String categoryNames)async{
    var response =   await  http.get(Uri.parse('$baseUrl/products/category/$categoryNames'));
    if  (response.statusCode== 200){
      var jsonData = response.body;
      return productModelsFromJson(jsonData);
    }
    else{
      return throw Exception("Failed to load roduct");
    }
  }
}