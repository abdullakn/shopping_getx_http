import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       
        backgroundColor: Colors.grey.withOpacity(0.2),
        elevation: 0,
      ),
      body: Column(
        children: [
          Padding(padding: EdgeInsets.all(25),
          child: Row(
            children: [
              Expanded(child: Text('ShopX',style: TextStyle(fontFamily: 'avenir',fontSize: 32,fontWeight: FontWeight.bold),)),
              IconButton(onPressed: (){}, icon:Icon(Icons.view_list_rounded)),
              IconButton(onPressed: (){}, icon:Icon(Icons.grid_view))
            ],
          ),
          ),
          Expanded(
            child: StaggeredGridView.countBuilder(
              itemCount: 100,
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
             itemBuilder:(context,index){
              return Container(
                height: 100,
                width: 100,
                color: Colors.red,
              );
             }, 
             staggeredTileBuilder:(index)=> StaggeredTile.count(1, 1)),
          )
          

        ],
      ),
    );
  }
}