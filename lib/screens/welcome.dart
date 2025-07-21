import 'package:flutter/material.dart';
import 'package:ocr/screens/Login_signup.dart';
class Welcome extends StatefulWidget {
  const Welcome({Key? key}) : super(key: key);
  static const String id="Welcome";
  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child:Scaffold(
          body: Container(
            constraints: BoxConstraints.expand(),
            decoration: BoxDecoration(
              image: DecorationImage(
                  image:AssetImage("image/background.jpg"),
                  fit: BoxFit.fill
              ),
            ),
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 60),
                  child: Text("Welcome to",
                    style: TextStyle(fontSize: 40,color:Colors.white,fontFamily: 'Rene'),),
                ),
                SizedBox(
                  height:120 ,
                ),

                SizedBox(
                  height:120 ,
                ),
                TextButton(onPressed: (){
                  setState(() {
                    Navigator.pushNamed(context, Login_signup.id);
                  });

                },child:
                Text("HMA",
                  style: TextStyle(fontSize: 40,color:Colors.black,fontFamily: 'Rene' ),),
                ),
                TextButton(onPressed: (){
                  setState(() {
                    Navigator.pushNamed(context, Login_signup.id);
                  });

                }, child: Text("Application",
                  style: TextStyle(fontSize: 40,color:Colors.black,fontFamily:'Rene'),),),
              ],
            ),
          ),
        ),
      ),
    );
  }
}