import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pic_hub/Widgets/BrandName.dart';
import 'dart:async';
import 'dart:convert';

import 'package:pic_hub/Widgets/HomeWallpaper.dart';
import 'package:pic_hub/Widgets/ImageLoading.dart';

class CategoryImages extends StatefulWidget {
  final String type;
  CategoryImages(this.type);
  @override
  _CategoryImagesState createState() => _CategoryImagesState(this.type);
}

class _CategoryImagesState extends State<CategoryImages> {
  final String type;
  bool isLoading = true;
  List categoryImages = [];
  _CategoryImagesState(this.type);

  Future _getCategoryImage() async {
    var response =
        await http.get('http://moblookapi.herokuapp.com/api/wallpaper/$type');
    var data = jsonDecode(response.body);

    setState(() {
      categoryImages = data;
      isLoading = false;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getCategoryImage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            brandName(type[0].toUpperCase() + type.substring(1), 'Images', 20),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: isLoading
          ? imageLoader('images')
          : HomeWallpaper(categoryImages, isLoading),
      backgroundColor: Colors.white,
    );
  }
}
