import 'package:flutter/material.dart';

Widget brandName(String firstStr, String secondStr, double font) {
  return RichText(
    text: TextSpan(
      style: TextStyle(fontSize: font, fontWeight: FontWeight.bold),
      children: <TextSpan>[
        TextSpan(text: firstStr, style: TextStyle(color: Colors.black)),
        TextSpan(text: secondStr, style: TextStyle(color: Color(0xFF8D39FA))),
      ],
    ),
  );
}
