import 'package:flutter/material.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'IsOffline.dart';
import 'TabBarView.dart';
// import 'package:pic_hub/Widgets/ProgressIndigator.dart';

class CheckOnline extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: OfflineBuilder(
        connectivityBuilder: (
          BuildContext context,
          ConnectivityResult connectivity,
          Widget child,
        ) {
          final bool connected = connectivity != ConnectivityResult.none;
          return connected ? tabBarView() : IsOffile();
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text(
              'There are no bottons to push :)',
            ),
            new Text(
              'Just turn off your internet.',
            ),
          ],
        ),
      ),
    );
  }
}
