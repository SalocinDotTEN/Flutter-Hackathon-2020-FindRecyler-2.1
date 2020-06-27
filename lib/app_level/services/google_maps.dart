import 'package:flutter/rendering.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapsServices {
  GoogleMapsServices._();

  static final instance = GoogleMapsServices._();

  Future<BitmapDescriptor> customMarker(String assetName) =>
      _customMarker(assetName);
}

Future<BitmapDescriptor> _customMarker(String assetName) async =>
    await BitmapDescriptor.fromAssetImage(
      ImageConfiguration(devicePixelRatio: 3.0),
      assetName,
    );
