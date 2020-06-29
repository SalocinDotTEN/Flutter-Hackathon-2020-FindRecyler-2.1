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

  static final CameraPosition _kIndia = CameraPosition(
    target: LatLng(19.0760, 72.8777),
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

    _init();
  }

  void _init() async {
    final _icon = await _mapsService.customMarker(AppAssets.place.assetName);
    _placeIcon = _icon;

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
              initialCameraPosition: _kIndia,
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

    var _specialMarkers = <Marker>[
      Marker(
        markerId: MarkerId('1'),
        position: LatLng(19.0760, 72.8777),
        icon: _placeIcon,
        onTap: () => _showPinWindow(
          FacilityModel(
              facilityName: 'GREEN IT RECYCLING CENTER PVT. LTD.',
              facilityAddress: '5 Ganeshprasad IInd Floor, 890 Mumbai',
              facilityImageUrl:
                  'https://www.thebetterindia.com/wp-content/uploads/2016/09/waste_f-1.jpg',
              facilityType: 'Paper'),
        ),
      ),
      Marker(
        markerId: MarkerId('2'),
        position: LatLng(18.5204, 73.8567),
        icon: _placeIcon,
        onTap: () => _showPinWindow(
          FacilityModel(
              facilityName: 'Hitech Recycling (INDIA) Pvt. Ltd',
              facilityAddress: 'Hitech Recycling (INDIA) Pvt. Ltd Pune 441209',
              facilityImageUrl:
                  'https://images.theconversation.com/files/231151/original/file-20180808-191038-zep5v5.jpg?ixlib=rb-1.1.0&q=45&auto=format&w=1200&h=1200.0&fit=crop',
              facilityType: null),
        ),
      ),
      Marker(
        markerId: MarkerId('3'),
        position: LatLng(24.5460727, 74.3037526),
        icon: _placeIcon,
        onTap: () => _showPinWindow(
          FacilityModel(
              facilityName: 'JAAGRUTI™ Waste Paper Recycling Services',
              facilityAddress:
                  'F-3, Shopping Centre, Mayapuri Chowk Flyover, Mansarover Garden, New Delhi, Delhi 110015',
              facilityImageUrl:
                  'https://images.theconversation.com/files/231151/original/file-20180808-191038-zep5v5.jpg?ixlib=rb-1.1.0&q=45&auto=format&w=1200&h=1200.0&fit=crop',
              facilityType: null),
        ),
      ),
      Marker(
        markerId: MarkerId('4'),
        position: LatLng(24.555097, 74.8361574),
        icon: _placeIcon,
        onTap: () => _showPinWindow(
          FacilityModel(
              facilityName: 'J3R Recycler Pvt. Ltd.',
              facilityAddress:
                  '502, 5th Floor, DDA Complex, Distt. Center, Laxmi Nagar, New Delhi, 110092',
              facilityImageUrl:
                  'https://images.theconversation.com/files/231151/original/file-20180808-191038-zep5v5.jpg?ixlib=rb-1.1.0&q=45&auto=format&w=1200&h=1200.0&fit=crop',
              facilityType: null),
        ),
      ),
      Marker(
        markerId: MarkerId('5'),
        position: LatLng(16.754792, 74.463443),
        icon: _placeIcon,
        onTap: () => _showPinWindow(
          FacilityModel(
              facilityName: 'E-Waste Collection Centre in Bangalore',
              facilityAddress:
                  '23, 23 rd A, Marenahalli Main Rd, R.K Colony, Marenahalli, 2nd Phase, J. P. Nagar, Bengaluru, Karnataka 540040',
              facilityImageUrl:
                  'https://i2.wp.com/www.ecoideaz.com/wp-content/uploads/2015/12/Attero-Recycling-e-waste.jpg?resize=505%2C264',
              facilityType: null),
        ),
      ),
    ];

    setState(() {
      _markers.addAll(_placeMarkers);
      _markers.addAll(_specialMarkers);
    });
  }

  void _showPinWindow(FacilityModel data) {
    setState(() {
      _isPinWindowInfoVisible = true;
      _currentPinWindow = data;
    });
  }
}
