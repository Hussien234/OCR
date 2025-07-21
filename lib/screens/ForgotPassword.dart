import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ocr/screens/Login.dart';
import 'dart:io';
class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);
  static const String id='forgotpassword';
  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  TextEditingController forgetPasswordController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
          child:Scaffold(
          body:
          Container(
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
      margin: EdgeInsets.only(top: 250),
      child: Center(child: Text("Receive an email to reset your password",
        style: TextStyle(fontSize: 35,color:Colors.white,fontFamily: 'Rene'),textAlign: TextAlign.center,),)
    ),
            SizedBox(height: 40,),
            TextField(
              controller: forgetPasswordController,
              onChanged: (value){

              },
              textAlign: TextAlign.left,
              decoration: InputDecoration(
                prefixIcon: Icon(
                    Icons.email_outlined
                ),
                hintText: "Enter Email",
                hintStyle: TextStyle(fontFamily:'Rene',fontSize:22,color: Colors.white),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(32.0)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue,width: 2.0),
                  borderRadius: BorderRadius.all(Radius.circular(32.0)),
                ),
              ),
            ),

            SizedBox(height: 40,),
            SizedBox(
              width: 400,
              height: 50,
              child:ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.blue),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(borderRadius: BorderRadius.circular(32.0)),),
                ),
                child: Text("Reset password" , style: TextStyle(fontSize: 22,color: Colors.white),),
                onPressed:()async{
                  setState(() {
var forgetEmail=forgetPasswordController.text.trim();
try{
  FirebaseAuth.instance.sendPasswordResetEmail(email: forgetEmail).then((value) =>
  {
print("Email sent"),
   Navigator.pushNamed(context, Login.id)
  });
}on FirebaseAuthException catch(e){
  print("Error$e");
}
ScaffoldMessenger.of(context).showSnackBar(
  SnackBar(
    content: Text('password has been reseted '),
  ),
);
                  });

                },
              ),
            ),

          ]
      ),
          ),
          ),
      )
    );
  }
  }

