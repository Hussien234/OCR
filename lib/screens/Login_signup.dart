import 'package:flutter/material.dart';
import 'package:ocr/screens/Homepage.dart';
import 'package:ocr/screens/Login.dart';
import 'package:ocr/screens/Navigator_bar.dart';
import 'package:ocr/screens/Signup.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
class Login_signup extends StatefulWidget {
  const Login_signup({Key? key}) : super(key: key);
  static const String id='login_signup';
  @override
  State<Login_signup> createState() => _Login_signupState();
}
class _Login_signupState extends State<Login_signup> {
  final GoogleSignIn _googleSignIn =GoogleSignIn();
  signInWithGoogle()async {
    GoogleSignInAccount ?googleuser = await GoogleSignIn().signIn();
    GoogleSignInAuthentication? googleAuth = await googleuser?.authentication;
    AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken
    );


    UserCredential userCredential = await FirebaseAuth.instance.signInWithCredential(credential);
    print(userCredential.user?.displayName);
    if (userCredential.user != null) {
      Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => Navigator_bar()));
    }
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: SafeArea(
          child: Scaffold(
            body : Container(
              constraints: BoxConstraints.expand(
              ),
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("image/background.jpg"),
                    fit: BoxFit.fill
                ),
              ),
              child: Column(
                children: [
                  Padding(padding: EdgeInsets.only(top:120),
                    child: Text(

                      "HELLO ",style: TextStyle(fontSize: 60 , color: Colors.black
                        , fontFamily:"Rene"),
                    ),
                  ),
                  SizedBox(
                    height: 200,
                  ),
                  Center(child :Padding(padding: EdgeInsets.all(20),
                    child: SizedBox(
                      width: 400,
                      height: 50,
                      child:ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(Colors.white),
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(borderRadius: BorderRadius.circular(32.0)),),
                        ),
                        child: Text("LOGIN " , style: TextStyle(fontSize: 22,color: Colors.blue),),
                        onPressed:(){
                          setState(() {
                            Navigator.pushNamed(context, Login.id);
                          });

                        },
                      ),
                    ),
                  ),
                  ),
                  Center(child :Padding(padding: EdgeInsets.all(20),
                    child: SizedBox(
                      width: 400,
                      height: 50,
                      child:ElevatedButton(
                        style: ButtonStyle(
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(borderRadius: BorderRadius.circular(32.0)),),
                        ),
                        child: Text("SIGN UP", style: TextStyle(fontSize: 22),),
                        onPressed:(){
                          setState(() {
                            Navigator.pushNamed(context,Signup.id);
                          });

                        },
                      ),
                    ),
                  ),
                  ),
                  Padding(padding: EdgeInsets.only(top:60,bottom: 20),
                    child: Text(
                      "Login with google",style: TextStyle(fontSize: 28 , color: Colors.black,
                        fontFamily: "Rene"),
                    ),
                  ),
                  Row(
mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                      TextButton(
                        onPressed: (){
                          setState(() {
                            signInWithGoogle();
                          });
          },
                        child: CircleAvatar(
                          radius: 25,
                          backgroundColor: Colors.white,
                          backgroundImage: AssetImage('image/logo.google.jpg'),
                        ),
                      ),


                    ],
                  ) ],
              ),
            ),
          ),
        )

    );

  }
}


