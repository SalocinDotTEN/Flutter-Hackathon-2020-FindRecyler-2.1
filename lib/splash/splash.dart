import 'package:findrecycler/home/home.dart';

import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<void>(
      future: Future.delayed(const Duration(milliseconds: 800)),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const _SplashScreen();
        }

        return const HomeScreen();
      },
    );
  }
}

class _SplashScreen extends StatelessWidget {
  const _SplashScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        DecoratedBox(
          decoration: BoxDecoration(color: Colors.green),
        ),
        // Image.asset(BraiytAssets.companyLogo.assetName),
      ],
    );
  }
}

// https://github.com/KarimMohamed2005/SplashScreenFlutterPackage/blob/master/lib/splashscreen.dart
