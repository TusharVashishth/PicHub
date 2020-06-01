import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:pic_hub/Widgets/HomeWallpaper.dart';
import 'ImageLoading.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with AutomaticKeepAliveClientMixin<Home> {
  @override
  bool get wantKeepAlive => true;
  bool isLoading = true;
  List randomPic = [];

  Future getRandomImages() async {
    var response =
        await http.get('http://moblookapi.herokuapp.com/api/wallpaper/random');
    var data = jsonDecode(response.body);
    setState(() {
      randomPic = data;
      isLoading = false;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getRandomImages();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return isLoading
        ? imageLoader('images')
        : Container(child: HomeWallpaper(randomPic, isLoading));
    ;
  }
}
