import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

import 'Login.dart';
class Homepage extends StatefulWidget {
   Homepage({Key? key}) : super(key: key);
  static const String id='Homepage';
  final user= FirebaseAuth.instance.currentUser;
  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final user=FirebaseAuth.instance.currentUser!;
  void signUserOut(){
    FirebaseAuth.instance.signOut();
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          appBar:AppBar(
            backgroundColor: Colors.white,
            title:Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [

                IconButton(icon: Icon(Icons.logout,color: Colors.black,size: 35,),onPressed:(){
                  setState(() {
                    signUserOut();
                    
                  });
                },),
              ],
            ),
          ),
          body: Container(
            constraints: BoxConstraints.expand(),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("image/background.jpg"),
                fit: BoxFit.fill,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Welcome ",
                    style: TextStyle(fontSize: 50,color: Colors.black),
                    textAlign: TextAlign.center),
                Text("back",
                    style: TextStyle(fontSize: 50,color: Colors.black),
                    textAlign: TextAlign.center),
Text(''+user.email!,style: TextStyle(fontSize: 20),),

              ],
            ),
          ),

        ),
      ),
    );
  }
}
