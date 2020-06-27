import 'package:google_maps_flutter/google_maps_flutter.dart';

class FacilityCentresData {
  FacilityCentresData._();

  static final List<LatLng> centers = [
    LatLng(1.3084597, 103.861667),
    LatLng(1.308894, 103.862154),
  ];
}

class FacilityMarkers {
  FacilityMarkers._();

  static List<Marker> placeMarkers(BitmapDescriptor placeIcon) {
    var _markers = <Marker>[];
    var _centresPlaces = FacilityCentresData.centers.length;

    for (var i = 0; i < _centresPlaces; i++) {
      _markers.add(
        Marker(
          icon: placeIcon,
          infoWindow: InfoWindow(
            title: 'Description ${i + 1}',
            snippet: 'This place',
          ),
          markerId: MarkerId(i.toString()),
          position: FacilityCentresData.centers[i],
        ),
      );
    }

    return _markers;
  }
}
