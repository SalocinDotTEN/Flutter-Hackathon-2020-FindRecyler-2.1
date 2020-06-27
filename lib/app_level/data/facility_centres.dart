import 'package:findrecycler/app_level/models/map_model.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class FacilityCentresData {
  FacilityCentresData._();

  static List<MapModelData> get centerData => FacilityCentersData.initialData();
}

class FacilityMarkers {
  FacilityMarkers._();

  static List<Marker> placeMarkers(BitmapDescriptor placeIcon) {
    var _markers = <Marker>[];
    var _centresPlaces = FacilityCentresData.centerData.length;

    for (var i = 0; i < _centresPlaces; i++) {
      _markers.add(
        Marker(
          icon: placeIcon,
          infoWindow: InfoWindow(
            title: FacilityCentresData.centerData[i].placeTitle,
            snippet: FacilityCentresData.centerData[i].placeSnippet,
          ),
          markerId: MarkerId(i.toString()),
          position: FacilityCentresData.centerData[i].position,
        ),
      );
    }

    return _markers;
  }
}
