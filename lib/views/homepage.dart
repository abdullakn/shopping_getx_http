import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:getx_shopping_app/controllers/productcontroller.dart';
import 'package:getx_shopping_app/views/product_card.dart';

class HomePage extends StatelessWidget {
  final ProductController _productController = Get.put(ProductController());
  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.withOpacity(0.2),
        elevation: 0,
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(25),
            child: Row(
              children: [
                Expanded(
                    child: Text(
                  'ShopX',
                  style: TextStyle(
                      fontFamily: 'avenir',
                      fontSize: 32,
                      fontWeight: FontWeight.bold),
                )),
                IconButton(
                    onPressed: () {}, icon: Icon(Icons.view_list_rounded)),
                IconButton(onPressed: () {}, icon: Icon(Icons.grid_view))
              ],
            ),
          ),
          Expanded(child: Obx(() {
            if(_productController.isLoading.value)
            // ignore: curly_braces_in_flow_control_structures
              return Center(child: CircularProgressIndicator());
            else 
              return StaggeredGridView.countBuilder(
                
                  itemCount: _productController.productList.length,
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  itemBuilder: (context, index) {
                    return ProductCard(
                        product: _productController.productList[index]);
                  },
                  staggeredTileBuilder: (index) => StaggeredTile.fit(1));
          }))
        ],
      ),
    );
  }
}
