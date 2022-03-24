import 'package:flutter/material.dart';

class BuyButton extends StatelessWidget {
  const BuyButton({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      
      height: 56,
      width: double.maxFinite,
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15)
          )
        ),
        onPressed: (){}, 
        child:Text('Buy Now',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
         ),
    
      )

    );
  }
}