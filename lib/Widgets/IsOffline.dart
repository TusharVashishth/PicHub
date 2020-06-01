import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'BrandName.dart';

class IsOffile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: brandName('Pic', 'Hub', 25),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
      ),
      body: Container(
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image(
              image: AssetImage('images/NoInternet.png'),
              width: 300,
              height: 300,
            ),
            SizedBox(
              child: ColorizeAnimatedTextKit(
                  onTap: () {
                    print("Tap Event");
                  },
                  text: [
                    "Please check your internet connection.",
                    "Please check your internet connection.",
                    "Please check your internet connection.",
                  ],
                  textStyle:
                      TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  colors: [
                    Colors.orange,
                    Colors.greenAccent,
                    Colors.deepPurple,
                    Colors.blue,
                  ],
                  textAlign: TextAlign.start,
                  alignment:
                      AlignmentDirectional.topStart // or Alignment.topLeft
                  ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Developed with',
                    style: TextStyle(fontSize: 16),
                  ),
                  Icon(
                    Icons.favorite,
                    color: Colors.red,
                  ),
                  Text(
                    'By Tushar Vashishth',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
          ],
        )),
      ),
      backgroundColor: Colors.white,
    );
  }
}
