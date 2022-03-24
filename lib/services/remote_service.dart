import 'package:getx_shopping_app/models/products.dart';
import 'package:http/http.dart' as http;


class RemoteService{
  static var client=http.Client();
  static Future<List<Products>> fetchProducts() async{
    var url='http://makeup-api.herokuapp.com/api/v1/products.json?brand=maybelline';
    // client.get('http://makeup-api.herokuapp.com/api/v1/products.json?brand=maybelline');
     var response = await http.get(Uri.parse(url));
     if(response.statusCode==200){
       print("success");
       var jsonString=response.body;
       print(jsonString);
       print("-------------------------------------");
       var productList=ProductsFromJson(jsonString);
       print(productList);
       return productList;

     }else{
       print("error");
       return [];
     }

  }
}