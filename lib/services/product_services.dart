import 'package:http/http.dart' as http;
import 'package:shop_app/model/product_%20models.dart';
import 'package:shop_app/utils/my_string.dart';
class ProductServices{
static Future <List <ProductModels>> getProduct()async{
var response =   await  http.get(Uri.parse('$baseUrl/products'));
if  (response.statusCode== 200){
 var jsonData = response.body;
 return productModelsFromJson(jsonData);
}
else{
  return throw Exception("Failed to load roduct");
}
  }
}