import 'package:flutter/material.dart';

Widget imageDownload(String title) {
  return (Container(
    color: Colors.white,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Image(
          image: AssetImage('images/download.png'),
          height: 400,
          width: 400,
        ),
        SizedBox(
          height: 50,
        ),
        Text(
          title,
          style: TextStyle(
              color: Colors.black,
              fontSize: 14,
              decoration: TextDecoration.none),
        ),
        SizedBox(
          height: 20,
        ),
        SizedBox(
          height: 50,
          width: 50,
          child: CircularProgressIndicator(
            backgroundColor: Colors.deepPurple,
            strokeWidth: 5,
            valueColor: AlwaysStoppedAnimation<Color>(Colors.greenAccent),
          ),
        ),
      ],
    ),
  ));
}
