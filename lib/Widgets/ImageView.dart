import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker_saver/image_picker_saver.dart';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'package:pic_hub/Widgets/ImageDownload.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:flutter/services.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:wallpaper_manager/wallpaper_manager.dart';

class ImageView extends StatefulWidget {
  final String image;
  ImageView(this.image);

  @override
  _ImageViewState createState() => _ImageViewState(this.image);
}

class _ImageViewState extends State<ImageView> {
  final String imageUrl;
  bool isLoading = false;
  String imageProgress = '';
  _ImageViewState(this.imageUrl);

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? imageDownload(imageProgress)
        : Scaffold(
            body: Stack(
              children: <Widget>[
                Hero(
                  tag: widget.image,
                  child: Container(
                    height: MediaQuery.of(context).size.height,
                    child: FadeInImage.assetNetwork(
                      placeholder: 'images/loader.gif',
                      image: widget.image,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
            floatingActionButton: SpeedDial(
              animatedIcon: AnimatedIcons.menu_close,
              animatedIconTheme: IconThemeData(size: 22.0),
              closeManually: false,
              curve: Curves.bounceIn,
              overlayColor: Colors.black,
              overlayOpacity: 0.5,
              backgroundColor: Colors.white,
              foregroundColor: Colors.black,
              elevation: 8.0,
              shape: CircleBorder(),
              children: [
                SpeedDialChild(
                    backgroundColor: Colors.deepPurple,
                    child: Icon(Icons.arrow_back_ios),
                    onTap: () {
                      Navigator.pop(context, true);
                    },
                    label: 'back'),
                SpeedDialChild(
                    backgroundColor: Colors.deepPurple,
                    child: Icon(Icons.file_download),
                    onTap: () {
                      _save();
                    },
                    label: 'Download'),
                SpeedDialChild(
                    backgroundColor: Colors.deepPurple,
                    child: Icon(Icons.add_to_home_screen),
                    onTap: () {
                      setWallpaperFromFile();
                    },
                    label: 'Set Wallpaper'),
              ],
            ));
  }

  Future _save() async {
    setState(() {
      imageProgress = 'Your image downloading.';
      isLoading = true;
    });
    var response = await http.get(imageUrl);
    var filePath =
        await ImagePickerSaver.saveFile(fileData: response.bodyBytes);
    File.fromUri(Uri.file(filePath));
    setState(() {
      isLoading = false;
    });

    _displayAlert('Image Downloaded Successfully');
  }

  void _displayAlert(String title) {
    showDialog(
        context: context,
        builder: (BuildContext context) => CupertinoAlertDialog(
              title: Text("Wallpaper"),
              content: Text(title),
              actions: <Widget>[
                CupertinoDialogAction(
                  child: Text('Ok'),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                )
              ],
            ));
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> setWallpaperFromFile() async {
    setState(() {
      imageProgress = 'Wallpaper set in progress.';
      isLoading = true;
    });
    String result;
    var file = await DefaultCacheManager().getSingleFile(imageUrl);
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      result = await WallpaperManager.setWallpaperFromFile(
          file.path, WallpaperManager.HOME_SCREEN);
    } on PlatformException {
      result = 'Failed to get wallpaper.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      isLoading = false;
    });
    _displayAlert("Wallpaper Set Successfully.");
  }
}
