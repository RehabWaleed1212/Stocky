import 'package:first/favorites_page.dart';
import 'package:first/help_center_page.dart';
import 'package:first/homePage.dart';
import 'package:first/auth/login_page.dart';
import 'package:first/logout_page.dart';
import 'package:first/user_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../payment_page.dart';
import '../shopping_bag_outlined_page.dart';
import '../shopping_bag_page.dart';
//import 'package:navigation_drawer/main.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:first/components/custombuttonauth.dart';
import 'package:first/components/customlogoauth.dart';
import 'package:first/components/textformfield.dart';


class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
    drawer:   NavigationDrawer(),
    appBar: AppBar(
      title: const Text('Sign Up'),
      backgroundColor: Colors.brown,
    ),
  );
}
class homePage extends StatelessWidget {
  const homePage({Key? key}) : super(key: key);


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
  Widget build(BuildContext context) =>
      Drawer(
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

  Widget buildHeader(BuildContext context) =>
      Container(
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
                  top: 24 + MediaQuery
                      .of(context)
                      .padding
                      .top,
                  bottom: 24,
                ),
                child: Column(
                  children: const [
                    CircleAvatar(
                      radius: 52,
                      child: Icon(CupertinoIcons.person,
                        color: Color.fromARGB(255, 163, 143, 71),
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

  Widget buildMenuItems(BuildContext context) =>
      Container(
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
                leading: const Icon(Icons.favorite_border),
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
        ),);

}

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController username = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  GlobalKey<FormState> formState = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(20),
        child: ListView(children: [
          Form(
            key: formState,
            child:Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(height: 50),
                const CustomLogoAuth(),
                Container(height: 20),
                const Text("SignUp",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
                Container(height: 10),
                const Text("SignUp To Continue Using The App",
                    style: TextStyle(color: Colors.grey)),
                Container(height: 20),
                const Text(
                  "username",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                Container(height: 10),
                CustomTextForm(
                    hinttext: "ُEnter Your username", mycontroller: username , validator: (val) {
                  if (val == "") {
                    return "Can't To be Empty";
                  }
                  return null;
                }),
                Container(height: 20),
                const Text(
                  "Email",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                Container(height: 10),
                CustomTextForm(
                    hinttext: "ُEnter Your Email", mycontroller: email , validator: (val) {
                  if (val == "") {
                    return "Can't To be Empty";
                  }
                  return null;
                }),
                Container(height: 10),
                const Text(
                  "Password",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                Container(height: 10),
                CustomTextForm(
                    hinttext: "ُEnter Your Password", mycontroller: email , validator: (val) {
                  if (val == "") {
                    return "Can't To be Empty";
                  }
                  return null;
                }),
                Container(
                  margin: const EdgeInsets.only(top: 10, bottom: 20),
                  alignment: Alignment.topRight,
                  child: const Text(
                    "Forgot Password ?",
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
            ),
          ),
          CustomButtonAuth(title: "SignUp", onPressed: () async {
            if(formState.currentState!.validate()){
              try {
                final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
                  email: email.text,
                  password: password.text,
                );
                Navigator.of(context).pushReplacementNamed("login");
              } on FirebaseAuthException catch (e) {
                if (e.code == 'weak-password') {
                  print('The password provided is too weak.');
                  AwesomeDialog(
                    context: context,
                    dialogType: DialogType.error,
                    animType: AnimType.rightSlide,
                    title: 'Error',
                    desc: 'The password provided is too weak.',
                  ).show();
                } else if (e.code == 'email-already-in-use') {
                  print('The account already exists for that email.');
                  AwesomeDialog(
                    context: context,
                    dialogType: DialogType.error,
                    animType: AnimType.rightSlide,
                    title: 'Error',
                    desc: 'The account already exists for that email.',
                  ).show();
                }
              } catch (e) {
                print(e);
              }
            }
          }
          ),
          Container(height: 20),

          Container(height: 20),
          // Text("Don't Have An Account ? Resister" , textAlign: TextAlign.center,)
          InkWell(
            onTap: () {
              Navigator.of(context).pushNamed("login") ;
            },
            child: const Center(
              child: Text.rich(TextSpan(children: [
                TextSpan(
                  text: "Have An Account ? ",
                ),
                TextSpan(
                    text: "Login",
                    style: TextStyle(
                        color: Colors.orange, fontWeight: FontWeight.bold)),
              ])),
            ),
          )
        ]),
      ),
    );
  }
}