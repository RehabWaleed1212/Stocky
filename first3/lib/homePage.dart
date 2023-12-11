import 'package:first/favorites_page.dart';
import 'package:flutter/material.dart';
import 'package:first/details.dart';
import 'package:flutter/cupertino.dart';
import 'package:first/help_center_page.dart';
import 'package:first/auth/login_page.dart';
import 'package:first/logout_page.dart';
import 'package:first/user_page.dart';
import 'payment_page.dart';
import 'shopping_bag_outlined_page.dart';
import 'shopping_bag_page.dart';
import 'package:first/auth/sign%20up_page.dart';
//mport 'package:navigation_drawer/main.dart';
class homePage extends StatefulWidget {
  const homePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        title: const Text('Stocky'),
        backgroundColor: Colors.brown.shade700,
      ),
      drawer: const NavigationDrawer()
  );

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
          Text("welcome"),
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
/*class homePage extends StatelessWidget {
  const homePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        title: const Text('Stocky'),
        backgroundColor: Colors.brown.shade700,
      ),
      drawer: const NavigationDrawer()
  );
}*/
class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) => Drawer(
    child: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          buildHeader(context),
          buildMenuItems(context),
        ],
      ),
    ),
  );
  Widget  buildHeader(BuildContext context)=>Container(
      color: Colors.white,
      child: InkWell(
          onTap: () {
            Navigator.pop(context);
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const UserPage(),
            ));
          },
          child: Container(
            padding: EdgeInsets.only(
              top: 24+ MediaQuery.of(context).padding.top,
              bottom: 24,
            ),
            child: Column(
              children: const [
                CircleAvatar(
                  radius: 52,
                  child: Icon(CupertinoIcons.person,
                    color: Color.fromARGB(255,163,143,71),
                  ),
                ),
                SizedBox(height: 12),
                Text(
                  'Welcome',
                  style: TextStyle(fontSize: 28, color: Colors.black45),
                ),
                Text(
                  'In Stocky',
                  style: TextStyle(fontSize: 18, color: Colors.black45),
                ),
              ],
            ),
          )));

  Widget  buildMenuItems(BuildContext context)=> Container(
    padding: const EdgeInsets.all(15),
    child: Wrap(
        runSpacing: 10, // vertical Spacing
        children: [
          ListTile(
            leading: const Icon(Icons.home_outlined),
            title: const Text('Home'),
            onTap: () =>
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => const homePage(),
                )),
          ),
          ListTile(
            leading:const Icon(Icons.favorite_border),
            title: const Text('Favorites'),
            onTap: () {
              //close navigation drawer before
              Navigator.pop(context);

              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const FavoritesPage(),
              ));
            },
          ),
          ListTile(
            leading: const Icon(Icons.shopping_bag),
            title: const Text('Orders'),
            onTap: () {
              Navigator.pop(context);

              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const OrdersPage(),
              ));
            },
          ),
          ListTile(
            leading: const Icon(Icons.payment),
            title: const Text('Offers'),
            onTap: () {
              Navigator.pop(context);

              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const OffersPage(),
              ));
            },
          ),
          ListTile(
            leading: const Icon(Icons.shopping_bag_outlined),
            title: const Text('Cart'),
            onTap: () {
              Navigator.pop(context);

              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const CartPage(),
              ));
            },
          ),
          const Divider(color: Colors.black45),

          ListTile(
            leading: const Icon(Icons.help_center),
            title: const Text('Help'),
            onTap: () {
              Navigator.pop(context);

              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const HelpPage(),
              ));
            },
          ),
          ListTile(
            leading: const Icon(Icons.app_registration),
            title: const Text('Sign Up'),
            onTap: () {
              Navigator.pop(context);

              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const SignUpPage(),
              ));
            },
          ),
          ListTile(
            leading: const Icon(Icons.login),
            title: const Text('LogIn'),
            onTap: () {
              Navigator.pop(context);

              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const LogInPage(),
              ));
            },
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('LogOut'),
            onTap: () {
              Navigator.pop(context);

              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const LogOutPage(),
              ));
            },
          ),
        ]
    ), );

}