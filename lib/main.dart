import 'package:findrecycler/app_level/routes/routes.dart';
import 'package:findrecycler/home/home.dart';
import 'package:findrecycler/locator.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // INIT DEP INJECTION..
  setupLocator();

  // SETUP ORIENTATION
  if (!kIsWeb) {
    await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  }

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  //

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomeScreen(),
      onGenerateRoute: Router.generateRoute,
    );
  }
}
