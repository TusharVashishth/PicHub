import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
import './Widgets/CheckOnline.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(
        title: Text(
          'Developed By Tushar Vashishth',
          style: new TextStyle(
              fontWeight: FontWeight.bold, fontSize: 20, color: Colors.black),
        ),
        seconds: 3,
        navigateAfterSeconds: MyPicHub(),
        image: Image.asset('images/logo.png'),
        backgroundColor: Colors.white,
        styleTextUnderTheLoader: new TextStyle(),
        photoSize: 200.0,
        loaderColor: Color(0xFF8D39FA),
      ),
    );
  }
}

class MyPicHub extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'picHub',
      debugShowCheckedModeBanner: false,
      home: CheckOnline(),
    );
  }
}
