import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:first/components/custombuttonauth.dart';
import 'package:first/components/customlogoauth.dart';
import 'package:first/components/textformfield.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:google_sign_in/google_sign_in.dart';
class Login_page extends StatefulWidget {
  const Login_page({super.key});
  @override
  State<Login_page> createState() => _LoginState();
}
class _LoginState extends State<Login_page> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  Future signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    if(googleUser == null){
      return;
    }

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    await FirebaseAuth.instance.signInWithCredential(credential);
    Navigator.of(context).pushNamedAndRemoveUntil("homePage", (route) => false);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('login'),
        backgroundColor: Colors.brown,
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: ListView(
            children: [
          Form(
            key: formState,
            child:Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: 50),
                const CustomLogoAuth(),
                SizedBox(height: 20),
                const Text("Login",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)
                ),

                SizedBox(height: 10),
                const Text("Login To Continue Using The App",
                    style: TextStyle(color: Colors.grey)),

                SizedBox(height: 20),
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
                    // return null;   //////
                }),

                SizedBox(height: 10),
                const Text(
                  "Password",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),

                SizedBox(height: 10),

                CustomTextForm(
                    hinttext: "ُEnter Your Password", mycontroller: password , validator: (val) {
                  if (val == "") {
                    return "Can't To be Empty";
                  }
                  // return null;      //////
                }),
                InkWell(
                  onTap: () async{
                    // await FirebaseAuth.instance.sendPasswordResetEmail(email: email.text);
                    ////
                    if(email.text==""){
                      AwesomeDialog(
                        context: context,
                        dialogType: DialogType.error,
                        animType: AnimType.rightSlide,
                        title: 'Error',
                        desc: 'please write your email and then click Forget Password',
                      ).show();
                      return;
                    }
                    try {
                      await FirebaseAuth.instance.sendPasswordResetEmail(
                          email: email.text);
                      AwesomeDialog(
                        context: context,
                        dialogType: DialogType.success,
                        animType: AnimType.rightSlide,
                        title: 'Error',
                        desc: 'A link to reset your password has been sent to your email. please go to your email and click on the link',
                      ).show();

                    } catch (e){
                      AwesomeDialog(
                        context: context,
                        dialogType: DialogType.error,
                        animType: AnimType.rightSlide,
                        title: 'Error',
                        desc: 'Please make sure that the email you entered is correct and try again',
                      ).show();

                      print(e);
                    }
                    AwesomeDialog(
                      context: context,
                      dialogType: DialogType.error,
                      animType: AnimType.rightSlide,
                      title: 'Error',
                      desc: 'A link to reset your password has been sent to your email. please go to your email and click on the link',
                    ).show();

                  },
                  child: Text("fdxk"),
                ),
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
          CustomButtonAuth(title: "login", onPressed: () async {
            if(formState.currentState!.validate()){
              try {
                final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
                    email: email.text,
                    password: password.text
                );
                FirebaseAuth.instance.currentUser!.sendEmailVerification();
                if(credential.user! .emailVerified){
                  Navigator.of(context).pushReplacementNamed("homepage");

                }else{
                  AwesomeDialog(
                    context: context,
                    dialogType: DialogType.error,
                    animType: AnimType.rightSlide,
                    title: 'Error',
                    desc: 'please go to your email and click  on the verified link to activate your account ',
                  ).show();
                }

              } on FirebaseAuthException catch (e) {
                if (e.code == 'user-not-found') {
                  print('No user found for that email.');
                  AwesomeDialog(
                    context: context,
                    dialogType: DialogType.error,
                    animType: AnimType.rightSlide,
                    title: 'Error',
                    desc: 'No user found for that email.',
                  ).show();
                } else if (e.code == 'wrong-password') {
                  print('Wrong password provided for that user.');
                  AwesomeDialog(
                    context: context,
                    dialogType: DialogType.error,
                    animType: AnimType.rightSlide,
                    title: 'Error',
                    desc: 'Wrong password provided for that user.',
                  ).show();
                }
              }
            }else {
              print("Not Valid");
            }
          }),
         Container(height: 20),

          MaterialButton(
              height: 40,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              color: Colors.red[700],
              textColor: Colors.white,
              onPressed: () {
                signInWithGoogle
                  (
                );
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Login With Google  "),
                  Image.asset(
                    "image/logo1.jpg",
                    width: 20,
                  )
                ],
              )),
          Container(height: 20),
          // Text("Don't Have An Account ? Resister" , textAlign: TextAlign.center,)
          InkWell(
            onTap: () {
              Navigator.of(context).pushReplacementNamed("signup") ;
            },
            child: const Center(
              child: Text.rich(TextSpan(children: [
                TextSpan(
                  text: "Don't Have An Account ? ",
                ),
                TextSpan(
                    text: "Register",
                    style: TextStyle(
                        color: Colors.orange, fontWeight: FontWeight.bold)),
              ])),
            ),
          )
        ]
        ),
      ),
    );
  }
}