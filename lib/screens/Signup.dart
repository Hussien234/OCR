import 'package:flutter/material.dart';
import 'package:ocr/screens/Homepage.dart';
import 'package:ocr/screens/Login.dart';
import 'package:ocr/screens/welcome.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);
  static const String id = 'Signup';
  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final _auth=FirebaseAuth.instance;
  String email="";
  String pass="";
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          body: Container(
            constraints: BoxConstraints.expand(),
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('image/background.jpg'),
                  fit: BoxFit.fill),
            ),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 100),
                  child: Text(
                    'CREATE YOUR ',
                    style: TextStyle(
                        fontSize: 40, color: Colors.white, fontFamily: 'Rene'),
                  ),
                ),
                Text(
                  'ACCOUNT ',
                  style: TextStyle(
                      fontSize: 40, color: Colors.white, fontFamily: 'Rene'),
                ),
                SizedBox(
                  height: 100,
                ),
                TextField(
                  textAlign: TextAlign.left,
                  decoration: InputDecoration(
                      prefixIcon: Icon(
                          Icons.person_outline
                      ),
                      hintText: 'Enter Username',
                      hintStyle: TextStyle(
                          fontFamily: 'Rene', fontSize: 22, color: Colors.white),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(32))),
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.blue, width: 3.0),
                          borderRadius: BorderRadius.all(Radius.circular(32)))),
                ),
                SizedBox(
                  height: 30,
                ),
                TextField(
                  onChanged: (value){
                    email=value;
                  },
                  textAlign: TextAlign.left,
                  decoration: InputDecoration(
                      prefixIcon: Icon(
                          Icons.email_outlined
                      ),
                      hintText: 'Enter Email',
                      hintStyle: TextStyle(
                          fontFamily: 'Rene', fontSize: 22, color: Colors.white),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(32))),
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.blue, width: 3.0),
                          borderRadius: BorderRadius.all(Radius.circular(32)))),
                ),
                SizedBox(
                  height: 30,
                ),
                TextField(
                  onChanged: (value){
                    pass=value;
                  },
                  textAlign: TextAlign.left,
                  decoration: InputDecoration(
                      prefixIcon: Icon(
                          Icons.lock_outline
                      ),
                      hintText: 'Enter Password',
                      hintStyle: TextStyle(
                          fontFamily: 'Rene', fontSize: 22, color: Colors.white),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(32))),
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.blue, width: 3.0),
                          borderRadius: BorderRadius.all(Radius.circular(32)))),
                ),
                SizedBox(
                  height: 30,
                ),
                TextField(
                  textAlign: TextAlign.left,
                  decoration: InputDecoration(
                      prefixIcon: Icon(
                          Icons.lock_outline
                      ),
                      hintText: 'Confirm Password',
                      hintStyle: TextStyle(
                          fontFamily: 'Rene', fontSize: 22, color: Colors.white),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(32))),
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.blue, width: 3.0),
                          borderRadius: BorderRadius.all(Radius.circular(32)))),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20, right: 20, top: 20),
                  child: SizedBox(
                    width: 400,
                    height: 50,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(borderRadius: BorderRadius.circular(32.0)),),
                      ),
                      child: Text(
                        "Sign up",
                        style: TextStyle(fontSize: 22),
                      ),
                      onPressed: () async{
    try{
    final newUser= await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: pass);


                        setState(() {
                          if(newUser!=null){
                            Navigator.pushNamed(context,Homepage.id);
                          }
                        });}catch(e){
      print(e);
    }

                      },
                    ),
                  ),
                ),
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 100),
                      child: Text(
                        "have account?",
                        style: TextStyle(fontSize: 20, color: Colors.black),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        setState(() {
                          Navigator.pushNamed(context, Login.id);
                        });

                      },
                      child: Text(
                        "Login",
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );

  }
}
