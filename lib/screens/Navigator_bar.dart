import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:ocr/screens/Homepage.dart';
import 'package:ocr/screens/image_picker.dart';
class Navigator_bar extends StatefulWidget {
  const Navigator_bar({Key? key}) : super(key: key);
static const String id='Navigator_bar';
  @override
  State<Navigator_bar> createState() => _Navigator_barState();
}

class _Navigator_barState extends State<Navigator_bar> {
  int _page = 0;
  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
  final screens=[
    Homepage(),
    image_picker(),

  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home:Scaffold(
        bottomNavigationBar: CurvedNavigationBar(
          key: _bottomNavigationKey,
          index: 0,
          height: 60.0,
          items: <Widget>[
            Icon(Icons.home, size: 30),
            Icon(Icons.camera_alt_outlined, size: 30),
          ],
          color: Colors.white,
          buttonBackgroundColor: Colors.white,
          backgroundColor: Colors.blueAccent,
          animationCurve: Curves.easeInOut,
          animationDuration: Duration(milliseconds: 600),
          onTap: (index) {
            setState(() {
              _page = index;
            });
          },
          letIndexChange: (index) => true,
        ),
        body:screens[_page],

    ),
    );
  }
}


