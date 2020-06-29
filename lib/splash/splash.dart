import 'package:findrecycler/app_level/constants/constants.dart';
import 'package:findrecycler/app_level/utilities/screen_size.dart';
import 'package:findrecycler/home/home.dart';

import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<void>(
      future: Future.delayed(const Duration(milliseconds: 900)),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const _SplashScreen();
        }

        return HomeScreen();
      },
    );
  }
}

class _SplashScreen extends StatelessWidget {
  const _SplashScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //
    final _height = ScreenQueries.instance.height(context);

    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        DecoratedBox(
          decoration: BoxDecoration(color: Colors.green),
        ),
        Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Icon(
                Icons.loop,
                color: Colors.white,
                size: _height * 0.1,
              ),
              Material(
                color: Colors.transparent,
                child: Text(
                  AppLevelConstants.appName,
                  style: Theme.of(context)
                      .textTheme
                      .headline5
                      .copyWith(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

// https://github.com/KarimMohamed2005/SplashScreenFlutterPackage/blob/master/lib/splashscreen.dart
