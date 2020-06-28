import 'dart:async';

import 'package:findrecycler/app_level/assets/assets.dart';
import 'package:findrecycler/app_level/constants/constants.dart';
import 'package:findrecycler/app_level/data/facility_centres.dart';
import 'package:findrecycler/app_level/models/map_model.dart';
import 'package:findrecycler/app_level/services/google_maps.dart';

import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  GoogleMapController mapController;
  TextEditingController searchController = new TextEditingController();

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
    // TODO: implement dispose
    super.dispose();
    searchController.dispose();
  }

  Future<void> onSuggestionSelect(MapModelData suggestion) async {
    searchController.text = suggestion.placeTitle;
    
    final CameraPosition selectedMarker = CameraPosition(
      target: LatLng(suggestion.position.latitude, suggestion.position.longitude),
      zoom: 15,
    );

    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(selectedMarker));
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
              zoomControlsEnabled: false,
              onMapCreated: (controller) {
                _controller.complete(controller);
              },
              markers: _markers,
            ),
            Padding(
              padding: EdgeInsets.all(5),
              child: TypeAheadField(
              textFieldConfiguration: TextFieldConfiguration(
                controller: searchController,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                  suffixIcon: Icon(Icons.search),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide:BorderSide(width: 0.0, color: Colors.white),
                  ),
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
                  SizedBox(height: 10),
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

  void _createData() {
    var _placeMarkers = FacilityMarkers.placeMarkers(_placeIcon);

    setState(() {
      _markers.addAll(_placeMarkers);
    });
  }
}
