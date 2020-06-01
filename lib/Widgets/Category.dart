import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

import 'package:pic_hub/Widgets/CategoryImages.dart';
import 'package:pic_hub/Widgets/ImageLoading.dart';

class Category extends StatefulWidget {
  @override
  _CategoryState createState() => _CategoryState();
}

class _CategoryState extends State<Category>
    with AutomaticKeepAliveClientMixin<Category> {
  @override
  bool get wantKeepAlive => true;
  List categories = [];
  bool isLoading = true;

  Future getCategories() async {
    var response =
        await http.get('http://moblookapi.herokuapp.com/api/category');
    var data = jsonDecode(response.body);

    setState(() {
      categories = data;
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    getCategories();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return isLoading
        ? imageLoader('categories')
        : Container(
            margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: ListView.builder(
                itemCount: categories == null ? 0 : categories.length,
                itemBuilder: (BuildContext context, int i) {
                  return Stack(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(top: 10),
                        width: MediaQuery.of(context).size.width,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.network(
                            categories[i]["image"],
                            fit: BoxFit.cover,
                            height: MediaQuery.of(context).size.height / 3,
                            width: MediaQuery.of(context).size.width,
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      CategoryImages(categories[i]["name"])));
                        },
                        child: Container(
                          margin: EdgeInsets.only(top: 10),
                          height: MediaQuery.of(context).size.height / 3,
                          width: MediaQuery.of(context).size.width,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.black26),
                          child: Text(
                            categories[i]["name"][0].toUpperCase() +
                                categories[i]["name"].substring(1),
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      )
                    ],
                  );
                }));
  }
}
