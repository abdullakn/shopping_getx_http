import 'package:flutter/material.dart';
import 'package:getx_shopping_app/models/products.dart';
import 'package:getx_shopping_app/views/details_page.dart';

class ProductCard extends StatelessWidget {
  final Products product;
  const ProductCard({required this.product});

  @override
  Widget build(BuildContext context) {
    print(product.imageLink);
    return GestureDetector(
      onTap: (){
        Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>DetailsPage(products: product)));
      },
      child: Card(
        elevation: 2,
        child: Padding(
          padding: EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                    // height: 150,
                    width: double.infinity,
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          
                        )
                      ],
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(4)
                    ),
                    child: Image.network(product.imageLink,fit: BoxFit.cover,width: 20,),
                  )
                ],
              ),
              SizedBox(height: 8,),
              Text(product.name,maxLines: 2,style: TextStyle(fontFamily: 'awenir',fontWeight: FontWeight.bold,overflow: TextOverflow.ellipsis),),
              SizedBox(height: 8,),
              Container(
                width: 50,
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(8)
                  
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(product.rating.toString(),style: TextStyle(color: Colors.white),),
                    Icon(Icons.star,color: Colors.white,size: 18,)
                  ],
                ),
              ),
              Text(product.price,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),)
             
        
            ],
          ),
          ),
        
      ),
    );
  }
}