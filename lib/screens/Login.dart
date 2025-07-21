import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ocr/screens/ForgotPassword.dart';
import 'package:ocr/screens/Navigator_bar.dart';
import 'package:ocr/screens/Signup.dart';


class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  static const String id='Login';
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final passwordcontroller=TextEditingController();
  final _auth=FirebaseAuth.instance;
  String email="";
  String pass="";

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
                  margin: EdgeInsets.only(top: 60),
                  child: Text("HELLO LOGIN",
                    style: TextStyle(fontSize: 40,color:Colors.white,fontFamily: 'Rene'),),
                ),
                SizedBox(
                  height:280 ,
                ),
                TextField(
                  onChanged: (value){
                    email=value;
                  },
                  textAlign: TextAlign.left,
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.person_outline
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
                SizedBox(
                  height: 20,
                ),
                TextField(
                  controller:passwordcontroller,
                  obscureText: true,
                  onChanged: (value){
                    pass=value;
                  },
                  textAlign: TextAlign.left,
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.lock_outline
                    ),

                    hintText: "Enter Password",
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
                SizedBox(
                  height: 12,
                ),
                Container(
                  padding: EdgeInsets.only(left: 200),
                  child: TextButton(onPressed: ()

                  {
                    setState(() {
Navigator.pushNamed(context, ForgotPassword.id);
                    });
                  },child:
                  Text("Forget password?",
                    style: TextStyle(fontSize: 20,color:Colors.white,fontFamily: 'Rene' ),),
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
                      child: Text("Login", style: TextStyle(fontSize: 22),),
                    onPressed: () async{
                        try{
                          final newUser= await _auth.signInWithEmailAndPassword(email: email, password: pass);

                            Navigator.pushNamed(context,Navigator_bar.id);

                          setState(() {

                          });
                        }catch(e){
                          print(e);
                        }
                    },
                    ),
                  ),
                ),
                ),
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.only(left: 80),
                      child: Text("Don't have account?",
                        style: TextStyle(fontSize: 20,color:Colors.black,),),
                    ),
                    Container(
                      child: TextButton(onPressed: ()
                      {
                        setState(() {
                          Navigator.pushNamed(context, Signup.id);
                        });
                      },child:
                      Text("Sign up",
                        style: TextStyle(fontSize: 20,color:Colors.white),),
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
