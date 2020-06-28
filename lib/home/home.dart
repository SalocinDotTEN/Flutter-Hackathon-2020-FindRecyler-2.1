import 'dart:async';

import 'package:findrecycler/app_level/assets/assets.dart';
import 'package:findrecycler/app_level/constants/constants.dart';
import 'package:findrecycler/app_level/data/facility_centres.dart';
import 'package:findrecycler/app_level/models/map_model.dart';
import 'package:findrecycler/app_level/services/google_maps.dart';
import 'package:findrecycler/home/widgets/bottom_sheet.dart';

import 'package:flutter/material.dart';

import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:pedantic/pedantic.dart' show unawaited;

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  GoogleMapController mapController;
  TextEditingController searchController = TextEditingController();

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
  void dispose() {
    searchController?.dispose();
    super.dispose();
  }

  Future<void> onSuggestionSelect(MapModelData suggestion) async {
    searchController.text = suggestion.placeTitle;

    final selectedMarker = CameraPosition(
      target:
          LatLng(suggestion.position.latitude, suggestion.position.longitude),
      zoom: 15,
    );

    final controller = await _controller.future;
    unawaited(
      controller.animateCamera(CameraUpdate.newCameraPosition(selectedMarker)),
    );
  }

  @override
  Widget build(BuildContext context) {
    //

    return Scaffold(
      appBar: AppBar(title: Text(AppLevelConstants.appName)),
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
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 18),
              child: TypeAheadField(
                textFieldConfiguration: TextFieldConfiguration(
                  controller: searchController,
                  decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                    suffixIcon: Icon(Icons.search),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(width: 0.0, color: Colors.white),
                    ),
                    hintText: AppLevelConstants.placeHint,
                  ),
                ),
                suggestionsCallback: (pattern) async {
                  return await FacilityCentresData.filterData(pattern);
                },
                itemBuilder: (context, MapModelData suggestion) {
                  return ListTile(
                      title: Text(suggestion.placeTitle),
                      subtitle: Text(suggestion.placeSnippet));
                },
                onSuggestionSelected: (MapModelData suggestion) {
                  onSuggestionSelect(suggestion);
                },
              ),
            ),
          ],
        ),
      ),
      bottomSheet: FacilityBottomSheet(),
    );
  }

  void _createData() {
    var _placeMarkers = FacilityMarkers.placeMarkers(_placeIcon);

    setState(() {
      _markers.addAll(_placeMarkers);
    });
  }
}
