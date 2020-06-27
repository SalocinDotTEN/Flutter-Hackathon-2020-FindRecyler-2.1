import 'dart:async';

import 'package:findrecycler/app_level/assets/assets.dart';
import 'package:findrecycler/app_level/constants/constants.dart';
import 'package:findrecycler/app_level/data/facility_centres.dart';
import 'package:findrecycler/app_level/services/google_maps.dart';

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
  final GoogleMapsServices _mapsService = GoogleMapsServices.instance;

  final Set<Marker> _markers = {};

  final Completer<GoogleMapController> _controller = Completer();
  BitmapDescriptor _placeIcon;

  @override
  void initState() {
    super.initState();
    _mapsService
        .customMarker(AppAssets.place.assetName)
        .then((icon) => _placeIcon = icon);

    _createData();
  }

  @override
  Widget build(BuildContext context) {
    //

    return Scaffold(
      appBar: AppBar(
        title: Text(AppLevelConstants.appName),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => Navigator.pushNamed(
          context,
          ApplevelRoutes.addFacilityScreen,
        ),
        label: Row(
          children: <Widget>[
            Icon(Icons.add),
            Text('Add Facility'),
          ],
        ),
      ),
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            GoogleMap(
              initialCameraPosition: _kSingapore,
              onMapCreated: (controller) {
                _controller.complete(controller);
              },
              markers: _markers,
            ),
          ],
        ),
      ),
    );
  }

  void _createData() {
    var _placeMarkers = FacilityMarkers.placeMarkers(_placeIcon);

    setState(() {
      _markers.addAll(_placeMarkers);
    });
  }
}
