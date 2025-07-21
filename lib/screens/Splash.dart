import 'package:flutter/material.dart';
import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:ocr/screens/welcome.dart';
class Splash extends StatelessWidget {
  const Splash({Key? key}) : super(key: key);
static const id="splash_screen";
  @override
  Widget build(BuildContext context) {
    return  EasySplashScreen(
      logo: Image.asset("image/Screenshot 2023-03-17 193218.png",),
      logoWidth: 150,
      title: Text(
        "",
        style: TextStyle(
          fontSize: 35,
          fontWeight: FontWeight.bold,
          color: Colors.white
        ),
      ),
backgroundImage: AssetImage("image/background.jpg"),
      showLoader: true,
      loadingText: Text("Loading...",style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.white
      ),),
      navigator: Welcome(),
      durationInSeconds: 5,
      loaderColor: Colors.white,
    );
  }
}

