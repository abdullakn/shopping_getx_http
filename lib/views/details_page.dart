import 'package:flutter/material.dart';
import 'package:getx_shopping_app/models/products.dart';
import 'package:getx_shopping_app/views/buy_button.dart';
import 'package:readmore/readmore.dart';

class DetailsPage extends StatelessWidget {
  final Products products;
  const DetailsPage({required this.products});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton:BuyButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniCenterFloat,
      body: SafeArea(
          child: SingleChildScrollView(
            child: Container(
                  child: Column(
            children: [
              Stack(
                children: [
                
                  Container(
                   
                    height: 400,
                    width: double.maxFinite,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.network(
                        products.imageLink,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 25,
                    left: 25,
                    child: Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.grey
                      ),
                      child: GestureDetector(
                        onTap: (){
                          Navigator.of(context).pop();
                        },
                        child: Hero(tag: products.imageLink, child:Icon(Icons.arrow_back_ios_new_outlined)),
                      ),
                      // child: IconButton(onPressed: (){
                      //   Navigator.of(context).pop();
                      // }, icon: Icon(Icons.arrow_back_ios_new,color: Colors.white,)),
                    ),
                  ),
                  Positioned(
                    bottom: 25,
                    right: 25,
                    
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white
                      ),
                      child: IconButton(onPressed: (){}, icon: Icon(Icons.favorite,color: Colors.pink,)),
                      
                    ),
                  )
                ],
              ),
              SizedBox(height: 10,),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 25),
                width: double.maxFinite,
                
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(products.name,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                    SizedBox(height: 10,),
                    products.category!=""?Text("- ${products.category} -",style: TextStyle(fontWeight: FontWeight.bold),):Text("")
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey
                      ),
                      child: Row(
                        children: [
                          Text(products.rating.toString(),style: TextStyle(fontSize: 20),),
                          SizedBox(width: 10,),
                          Icon(Icons.star,color: Colors.green,size: 20,)
          
                        ],
                      ),
                     
                    ),
                           Container(
                      padding: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey
                      ),
                      child: Row(
                        children: [
                          Text("\$",style: TextStyle(fontWeight: FontWeight.bold),),
                          SizedBox(width: 5,),
                          Text(products.price,style: TextStyle(fontSize: 20),)
          
                        ],
                      ),
                     
                    )
                  ],
                ),
                
              ),
              Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(horizontal: 25),
                child: ReadMoreText(
                 products.description,
                  trimLines: 2,
                  colorClickableText: Colors.grey,
                  trimMode: TrimMode.Line,
                  trimCollapsedText: 'Show more',
                  trimExpandedText: 'Show less',
                  style: TextStyle(color: Colors.grey.withOpacity(0.8),height: 1.5),
                  // moreStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold,color: Colors.grey.withOpacity(0.5)),
                ),
              )
            ],
                  ),
                ),
          )),
    );
  }
}
