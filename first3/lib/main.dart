import 'package:first/homePage.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:first/auth/sign up_page.dart';
import 'package:first/favorites_page.dart';
import 'package:first/help_center_page.dart';
import 'package:first/auth/login_page.dart';
import 'package:first/logout_page.dart';
import 'package:first/payment_page.dart';
import 'package:first/shopping_bag_outlined_page.dart';
import 'package:first/shopping_bag_page.dart';
import 'package:first/user_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:firebase_auth/firebase_auth.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();/*(options: const FirebaseOptions(
      apiKey: 'AIzaSyDpYvzpBf9s9GQ3uW0E0-iEBqqxclzJPSc',
      appId: '341410426105:android:911632736cbc3090ef0628pId',
      messagingSenderId: '341410426105',
      projectId:'first-bde1f' ));*/
  runApp(const MyApp());
}
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State <MyApp> createState() => _MyAppState();


}

class _MyAppState extends State<MyApp>{
  @override
  void initState() {
    FirebaseAuth.instance
        .authStateChanges()
        .listen((User? user) {
      if (user == null) {
        print('User is currently signed out!');
      } else {
        print('User is signed in!');
      }
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return const MaterialApp( debugShowCheckedModeBanner: false,home: homePage(),
    );
  }
}
class homePage extends StatefulWidget {
  const homePage({Key? key}) : super(key: key);

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
 @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        title: const Text('Stocky'),
        backgroundColor: Colors.brown.shade700,
      ),

      drawer: const NavigationDrawer()

  );
}
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
            child: const Column(
              children: [
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