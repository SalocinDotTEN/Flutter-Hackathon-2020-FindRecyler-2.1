import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapModelData {
  final LatLng position;
  final String placeTitle;
  final String placeSnippet;

  MapModelData({
    this.position,
    this.placeTitle,
    this.placeSnippet,
  });
}

class FacilityCentersData {
  FacilityCentersData._();

  static List<MapModelData> initialData() {
    final _data = [
      MapModelData(
        position: LatLng(1.3084597, 103.861667),
        placeTitle: '808 French Rd',
        placeSnippet: 'Paper Center',
      )
    ];

    return _data;
  }
}
