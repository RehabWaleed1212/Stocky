import 'package:firebase_auth/firebase_auth.dart';
import 'package:first/homePage.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();/*(options: const FirebaseOptions(
      apiKey: 'AIzaSyDpYvzpBf9s9GQ3uW0E0-iEBqqxclzJPSc',
      appId: '341410426105:android:911632736cbc3090ef0628pId',
      messagingSenderId: '341410426105',
      projectId:'first-bde1f' ));*/
  runApp(MyApp());
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
    return MaterialApp( debugShowCheckedModeBanner: false,home: homePage(),
    );
  }
  }


