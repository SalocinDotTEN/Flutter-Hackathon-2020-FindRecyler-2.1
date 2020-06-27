import 'package:findrecycler/app_level/constants/constants.dart';

import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //

    return Scaffold(
      appBar: AppBar(
        title: Text(AppLevelConstants.appName),
      ),
      body: Center(
        child: Text('Hello World'),
      ),
    );
  }
}
