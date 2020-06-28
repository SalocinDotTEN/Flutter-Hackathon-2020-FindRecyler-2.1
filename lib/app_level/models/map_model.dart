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
      ),
      MapModelData(
        position: LatLng(-7.322120, 112.714500),
        placeTitle: 'Jambangan Recycle',
        placeSnippet: 'Plastic Recycle',
      ),
      MapModelData(
        position: LatLng(-7.276360, 112.743080),
        placeTitle: 'Keputran Compost Home',
        placeSnippet: 'Convert Waste to Compost',
      ),
      MapModelData(
        position: LatLng(-7.289490, 112.751610),
        placeTitle: 'Waste Bank Surabaya',
        placeSnippet: 'Convert Waste to Cash',
      ),
      MapModelData(
        position: LatLng(-7.289490, 112.751610),
        placeTitle: 'UNESA Recycle',
        placeSnippet: 'Convert Waste to Compost',
      ),
      MapModelData(
        position: LatLng(-7.289490, 112.751610),
        placeTitle: 'UNESA Recycle',
        placeSnippet: 'Convert Waste to Compost',
      ),
    ];

    return _data;
  }
}
