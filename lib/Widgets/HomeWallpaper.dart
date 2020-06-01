import 'package:flutter/material.dart';
import 'package:pic_hub/Widgets/ImageView.dart';

class HomeWallpaper extends StatelessWidget {
  final List randomPic;
  final bool isLoading;

  HomeWallpaper(this.randomPic, this.isLoading);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
      child: GridView.builder(
        itemCount: randomPic == null ? 0 : randomPic.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 0.6),
        itemBuilder: (BuildContext context, int i) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ImageView(randomPic[i]['image'])));
            },
            child: Hero(
              tag: randomPic[i]['image'],
              child: ClipRRect(
                borderRadius: BorderRadius.circular(25),
                child: FadeInImage.assetNetwork(
                  placeholder: 'images/loader.gif',
                  image: randomPic[i]['image'],
                  fit: BoxFit.cover,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
