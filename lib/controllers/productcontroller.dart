import 'package:get/state_manager.dart';
import 'package:getx_shopping_app/models/products.dart';
import 'package:getx_shopping_app/services/remote_service.dart';


class ProductController extends GetxController{
  var isLoading=true.obs;

  var productList=<Products>[].obs;


  @override
  void onInit() {
    print("oninit");
   fectchProducts();
    super.onInit();
  }

  void fectchProducts() async{
   
    try {
       isLoading(true);
      var products=await RemoteService.fetchProducts();
      print(products);
      print("---------------------------------");
      if(products!=null){
        productList.value=products;
      }
    } finally {
      isLoading(false);
    }
    
  }

}