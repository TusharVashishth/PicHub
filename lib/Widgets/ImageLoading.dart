import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

Widget imageLoader(String title) {
  return SingleChildScrollView(
    child: Center(
      child: Column(
        children: <Widget>[
          Image(
            image: AssetImage('images/imgLoading.png'),
            height: 400,
            width: 400,
          ),
          SizedBox(
            child: ColorizeAnimatedTextKit(
                onTap: () {
                  print("Tap Event");
                },
                text: [
                  "Loading $title for you..",
                  "Loading $title for you..",
                  "Loading $title for you..",
                ],
                textStyle: TextStyle(fontSize: 25),
                colors: [
                  Colors.deepPurple,
                  Colors.greenAccent,
                  Colors.orange,
                  Colors.blue,
                ],
                textAlign: TextAlign.start,
                alignment: AlignmentDirectional.topStart // or Alignment.topLeft
                ),
          )
        ],
      ),
    ),
  );
}
