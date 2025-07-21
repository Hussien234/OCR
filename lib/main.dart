import 'package:flutter/material.dart';
import 'package:ocr/screens/ForgotPassword.dart';
import 'package:ocr/screens/Homepage.dart';
import 'package:ocr/screens/Login.dart';
import 'package:ocr/screens/Login_signup.dart';
import 'package:ocr/screens/Navigator_bar.dart';
import 'package:ocr/screens/Signup.dart';
import 'package:ocr/screens/Splash.dart';
import 'package:ocr/screens/welcome.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
Future<void>main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(HMA());
}

class HMA extends StatelessWidget {
  const HMA({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(


      initialRoute: Splash.id,
      routes: {
        Splash.id:(context)=>Splash(),
        Welcome.id:(context)=>Welcome(),
        Login_signup.id:(context)=>Login_signup(),
        Login.id:(context)=>Login(),
        Signup.id:(context)=>Signup(),
        Navigator_bar.id:(context)=>Navigator_bar(),
        Homepage.id:(context)=>Homepage(),
        ForgotPassword.id:(context)=>ForgotPassword()
      },
    );
  }
}
