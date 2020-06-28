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
        position: LatLng(-7.280321, 112.713757),
        placeTitle: 'Dukuh Plastic Recycle',
        placeSnippet: 'Plastic Botol Recycle',
      ),
      MapModelData(
        position: LatLng(-7.287303, 112.789974),
        placeTitle: 'ITS Compost Recycle',
        placeSnippet: 'Convert Waste to Compost',
      ),
      MapModelData(
        position: LatLng(-7.236338, 112.746228),
        placeTitle: 'UD Logam Indah',
        placeSnippet: 'Alumunium And Paper',
      ),
      MapModelData(
        position: LatLng(-7.252165, 112.648465),
        placeTitle: 'El Juan Creative',
        placeSnippet: 'Kitchen Waste Recycle',
      ),
      MapModelData(
        position: LatLng(-7.315115, 112.708980),
        placeTitle: 'Etik Istianah Recycle',
        placeSnippet: 'Kitchen Waste Recycle',
      ),
      MapModelData(
        position: LatLng(-7.362289, 112.771876),
        placeTitle: 'Bhakti Pertiwi Recycle',
        placeSnippet: 'Plastic Waste Recycle',
      ),
      MapModelData(
        position: LatLng(-7.297183, 112.780109),
        placeTitle: 'Raja Koran Recycle',
        placeSnippet: 'Paper Recycle',
      ),
      MapModelData(
        position: LatLng(-7.311483, 112.790581),
        placeTitle: 'Wonorejo Compost Center',
        placeSnippet: 'Convert Waste to Compost',
      ),
    ];

    return _data;
  }
}
