import 'package:flutter/material.dart';

class ItemsDetails extends StatefulWidget{
  final dataitems ;
  const ItemsDetails ({super.key,this.dataitems});
  @override
  State<ItemsDetails> createState() => _ItemsDetailsState();

}
class _ItemsDetailsState extends State<ItemsDetails>{
  @override
  Widget build(BuildContext){
    return Scaffold( bottomNavigationBar: BottomNavigationBar(
        iconSize: 40,
        selectedItemColor: Colors.orange,
        items: [ BottomNavigationBarItem(icon: Icon(Icons.home_outlined) , label: "*"),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_bag_outlined) , label: "*"),
          BottomNavigationBarItem(icon: Icon(Icons.person_2_outlined) , label: "*"),
        ]),
      endDrawer: Drawer(),
      appBar: AppBar(
        centerTitle: true,
        title:
        /*Icon(Icons.shop_outlined),*/
        Text("Stocky" , style: TextStyle(color: Colors.black)),
        iconTheme: IconThemeData(
            color: Colors.grey
        ),
        backgroundColor: Colors.grey[200],
        elevation: 0.0,
      ),
      body: ListView(children: [
        Image.asset(widget.dataitems['image']),
        Container(child:
        Text(widget.dataitems['title'] , textAlign :TextAlign.center,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20 ),)),
        Container(
          margin: EdgeInsets.only(top: 10),
        child:
        Text(widget.dataitems['subtitle'] , textAlign :TextAlign.center,
          style: TextStyle(color: Colors.grey[500]),)),
        Container(
            margin: EdgeInsets.only(top: 10),
            child:
            Text(widget.dataitems['price'] , textAlign :TextAlign.center,
              style: TextStyle(color: Colors.orange, fontWeight :FontWeight.bold ),)),
        Container(
            margin: EdgeInsets.only(top: 20),
            child:
            Text("Size :   38 40 42 44 " , textAlign :TextAlign.center,
              style: TextStyle(color: Colors.grey ),)),
        Container(
            margin: EdgeInsets.symmetric(horizontal: 60, vertical: 20),
            child: MaterialButton(
              padding: EdgeInsets.symmetric(vertical: 15),
              color: Colors.black,
              textColor: Colors.white,
              onPressed: () {},
              child: Text("Add To Cart"),
            )


    ) ]
      )
    );
  }
}