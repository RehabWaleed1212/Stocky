
import 'package:flutter/material.dart';
import 'package:first/details.dart';
class homePage extends StatefulWidget {
  const homePage({super.key});
  @override
  State<StatefulWidget> createState() => _homePageState();
}
class _homePageState extends State<homePage> {
  List categories = [
    {
      "iconname": Icons.woman,
      "title": "Weman"
    },
    {
      "iconname": Icons.man,
      "title": "Men"
    },
    {
      "iconname": Icons.card_giftcard,
      "title": "Gifts"
    },
    {
      "iconname": Icons.shop,
      "title": "Shop"
    },
    {
      "iconname": Icons.sell,
      "title": "Sell"
    },
  ];

  List items = [
    {"image": "image/image1.jpg",
      "title": "Hoodies",
      "subtitle": "Description 1",
      "price": " 250\$"},

    {"image": "image/image2.jpg",
      "title": "Jacket",
      "subtitle": "Description 2",
      "price": " 350\$"},

    {"image": "image/pants.jpg",
      "title": "Pants",
      "subtitle": "Description 3",
      "price": " 200\$"},

    {"image": "image/shosw.jpg",
      "title": "Shoes",
      "subtitle": "Description 4",
      "price": " 150\$"},
  ];


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          iconSize: 40,
          selectedItemColor: Colors.orange,
          items: [ BottomNavigationBarItem(icon: Icon(Icons.home_outlined) , label: "*"),
            BottomNavigationBarItem(icon: Icon(Icons.shopping_bag_outlined) , label: "*"),
            BottomNavigationBarItem(icon: Icon(Icons.person_2_outlined) , label: "*"),
          ]),
      body: Container(
        padding: EdgeInsets.all(20),
        child: ListView(children: [
          Row(
              children: [
                Expanded(child: TextFormField(
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search),
                      hintText: "Search",
                      border: InputBorder.none,
                      fillColor: Colors.grey[150],
                      filled: true
                  ),
                )),
                Padding(padding:
                EdgeInsets.only(left: 10),
                  child: Icon(Icons.menu, size: 40,),
                )
              ],

              
          ),
          Container(height: 30),
          Text("Categories",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)
          ),
          Container(height: 20),
          Container(
            height: 100,
            child: ListView.builder(
                itemCount: categories.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, i) {
                  return Container(
                    margin: EdgeInsets.only(right: 10),
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(color: Colors.grey[150],
                              borderRadius: BorderRadius.circular(130)),
                          child: Icon(categories[i]['iconname'], size: 40),
                          color: Colors.grey[150],
                          padding: EdgeInsets.all(10),
                        ),
                        Text(categories[i]['title'],
                          style: TextStyle(
                                      fontWeight: FontWeight.bold, color: Colors
                                      .black87),)
                              ],
                            ),
                          );
                        }
                    ),
                  ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            child: Text(
              "best Selling",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ),
          GridView.builder(
              itemCount: items.length,
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, mainAxisExtent: 230),
              itemBuilder: (context, i) {
                return InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => ItemsDetails(
                            dataitems: items[i])));
                  },

                  child: Card(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(padding: EdgeInsets.all(20),
                            width: 300
                            , color: Colors.grey[200],
                            child: Image.asset(items[i]['image'],height: 100,
                                fit: BoxFit.fill),),
                          Text(items[i]['title'], style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold)),
                          Container(height: 2,),
                          Text(items[i]['subtitle'],
                              style: TextStyle(fontSize: 14, color: Colors.grey)),
                          Container(height: 6,),
                          Text(items[i]['price'],
                              style: TextStyle(fontSize: 14,
                                  color: Colors.orange,
                                  fontWeight: FontWeight.bold)
                          )
                        ]
                    ),
                  ),);
              }),
        ]),
      ),


    );
  }
}
