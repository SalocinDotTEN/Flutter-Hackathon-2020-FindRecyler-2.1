// ignore_for_file: avoid_init_to_null
import 'dart:async';

import 'package:findrecycler/app_level/assets/assets.dart';
import 'package:findrecycler/app_level/constants/constants.dart';
import 'package:findrecycler/app_level/data/facility_centres.dart';
import 'package:findrecycler/app_level/models/freezed/facility.dart';
import 'package:findrecycler/app_level/models/map_model.dart';
import 'package:findrecycler/app_level/services/google_maps.dart';
import 'package:findrecycler/app_level/widgets/pop_up_menu.dart';
import 'package:findrecycler/app_level/styles/colors.dart';
import 'package:findrecycler/home/widgets/fab_button.dart';
import 'package:findrecycler/home/widgets/map_pin_window.dart';

import 'package:flutter/material.dart';

import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:pedantic/pedantic.dart' show unawaited;
import 'package:flutter/services.dart' show rootBundle;

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
  String _mapStyle;
  bool _isPinWindowInfoVisible = false;
  FacilityModel _currentPinWindow;

  MapModelData selectedMarker = null;

  @override
  void initState() {
    super.initState();

    rootBundle.loadString('assets/map_style.txt').then((string) {
      _mapStyle = string;
    });

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

  void onTapMarker(MapModelData select) {
    setState(() {
      selectedMarker = select;
    });
  }

  @override
  Widget build(BuildContext context) {
    //

    return Scaffold(
      appBar: AppBar(
        title: Text(AppLevelConstants.appName),
        actions: <Widget>[
          PopUpMenu(),
        ],
      ),

      body: SafeArea(
        child: Stack(
          children: <Widget>[
            GoogleMap(
              initialCameraPosition: _kSingapore,
              zoomControlsEnabled: false,
              buildingsEnabled: false,
              onTap: (v) {
                setState(() {
                  _isPinWindowInfoVisible = false;
                });
              },
              onMapCreated: (controller) {
                _controller.complete(controller);
                mapController = controller;
                mapController.setMapStyle(_mapStyle);

                setState(() {
                  _markers.add(
                    Marker(
                      markerId: MarkerId('1'),
                      position: LatLng(1.3521, 103.4598),
                      icon: _placeIcon,
                      onTap: () => _showPinWindow(
                        FacilityModel(
                            facilityName: 'GREEN IT RECYCLING CENTER PVT. LTD.',
                            facilityAddress: '5 Ganeshprasad IInd Floor, 890',
                            facilityImageUrl:
                                'https://www.thebetterindia.com/wp-content/uploads/2016/09/waste_f-1.jpg',
                            facilityType: 'Paper'),
                      ),
                    ),
                  );
                  _markers.add(
                    Marker(
                      markerId: MarkerId('2'),
                      position: LatLng(2.3611, 103.8193),
                      icon: _placeIcon,
                      onTap: () => _showPinWindow(
                        FacilityModel(
                            facilityName: 'Hitech Recycling (INDIA) Pvt. Ltd',
                            facilityAddress:
                                'Hitech Recycling (INDIA) Pvt. Ltd Pune 441209',
                            facilityImageUrl:
                                'https://lh3.googleusercontent.com/proxy/ntw6Fcwm6kShPY1w1r3CBO6uUUizUKaPXVf55fcZvvwGWHvxcqUPNCuZvB50GP3snuCPFThQ1wTh5582Tyif_Q69oFUff61up9SNBh7rVg9hWKLuGI-e1ipTBkIathRWpxVX1I0WBhh5wk8EQJoWi3HL9hKNtUf8CrR2',
                            facilityType: null),
                      ),
                    ),
                  );
                });
              },
              // onTap: (LatLng data) {
              //   onTapMarker(null);
              // },
              markers: _markers,
            ),

            //Fab Button
            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: fab(context, this),
              ),
            ),

            //Pin Window
            _isPinWindowInfoVisible
                ? Align(
                    alignment: Alignment.bottomCenter,
                    child: MapPinWindow(facilityModel: _currentPinWindow),
                  )
                : Container(),

            //Search
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
                    fillColor: AppColors.backgroundGrey,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
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
      // bottomSheet: FacilityBottomSheet(
      //   parent: this,
      // ),
      // bottomSheet: FacilityBottomSheet(),
    );
  }

  void _createData() {
    var _placeMarkers = FacilityMarkers.placeMarkers(_placeIcon, this);

    setState(() {
      _markers.addAll(_placeMarkers);
    });
  }

  void _showPinWindow(FacilityModel data) {
    setState(() {
      _isPinWindowInfoVisible = true;
      _currentPinWindow = data;
    });
  }
}
