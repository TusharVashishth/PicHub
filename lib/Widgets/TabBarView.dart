import 'package:flutter/material.dart';
import 'BrandName.dart';
import 'Category.dart';
import 'Home.dart';

Widget tabBarView() {
  return MaterialApp(
    debugShowCheckedModeBanner: false,
    home: DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
            centerTitle: true,
            backgroundColor: Colors.white,
            elevation: 0,
            bottom: TabBar(
              indicatorColor: Color(0xff8D39FA),
              tabs: [
                Tab(
                    icon: Icon(
                  Icons.explore,
                  color: Colors.black,
                )),
                Tab(
                    icon: Icon(
                  Icons.wallpaper,
                  color: Colors.black,
                )),
              ],
            ),
            title: brandName('Pic', 'Hub', 25)),
        body: TabBarView(
          children: [Home(), Category()],
        ),
      ),
    ),
  );
}
