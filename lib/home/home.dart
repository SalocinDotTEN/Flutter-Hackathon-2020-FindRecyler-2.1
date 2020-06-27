import 'dart:async';

import 'package:findrecycler/app_level/constants/constants.dart';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  GoogleMapController mapController;

  static final CameraPosition _kSingapore = CameraPosition(
    target: LatLng(1.3521, 103.8198),
    zoom: 11.0,
  );

  final Set<Marker> _markers = {};

  final Completer<GoogleMapController> _controller = Completer();

  @override
  Widget build(BuildContext context) {
    //

    return Scaffold(
      appBar: AppBar(
        title: Text(AppLevelConstants.appName),
      ),
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            GoogleMap(
              initialCameraPosition: _kSingapore,
              zoomControlsEnabled: false,
              onMapCreated: (controller) {
                _controller.complete(controller);
              },
              markers: _markers,
            ),
            Positioned(
              bottom: 5,
              left: 5,
              right: 5,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  FlatButton(
                    padding: EdgeInsets.symmetric(vertical: 15),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    color: Colors.green,
                    onPressed: () {},
                    child: Text(
                      "Add a Facility!",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  FlatButton(
                    padding: EdgeInsets.symmetric(vertical: 15),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    color: Colors.green,
                    onPressed: () {},
                    child: Text(
                      "Discard Item",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
