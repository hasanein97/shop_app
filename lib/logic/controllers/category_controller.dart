import 'package:get/get.dart';
import 'package:shop_app/model/product_%20models.dart';
import 'package:shop_app/services/category_services.dart';

class CategoryController extends GetxController{
  var categoryNameList = <String>[].obs;
  var categoryList =<ProductModels>[].obs;
  var isCategoryLoading = false.obs;
  var isAllcategory= false.obs;
  List <String> imageCategory = [

    "https://fakestoreapi.com/img/71pWzhdJNwL._AC_UL640_QL65_ML3_.jpg",
    "https://fakestoreapi.com/img/61IBBVJvSDL._AC_SY879_.jpg",
    "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg",
    "https://fakestoreapi.com/img/51Y5NI-I5jL._AC_UX679_.jpg",
  ];
  @override
  void onInit() {
    super.onInit();
    getCategorys();
  }
   getCategorys() async {
    await CategorytServices.getCategory();
    try {

    }finally{
      isCategoryLoading(false);
    }
  }
   getAllCategorys(String nameCategory) async {
    isAllcategory(true);
    categoryList.value =
    await ALLCategoryServices.getAllCategory(nameCategory);
      isAllcategory(false);

  }
  getCategoryIndex(int index) async {
    var categoryAllName =  await getAllCategorys(categoryNameList[index]);
if (categoryAllName!= null){
  categoryList.value = categoryAllName;
}
  }
}