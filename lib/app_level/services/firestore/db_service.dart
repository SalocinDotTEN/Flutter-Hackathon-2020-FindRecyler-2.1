import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:findrecycler/app_level/models/freezed/facility.dart';

import 'package:flutter/rendering.dart' show debugPrint;

class FirestoreService {
  FirestoreService() : _instance = Firestore.instance;

  void addFacility(FacilityModel facilityData) async {
    try {
      //
      await _facilitiesColRef.add(facilityData.toJson());
    } catch (exc) {
      debugPrint(' ERROR in addFacility ${exc.toString()}');
    }
  }

  // ------------------------------ INTERNALS ---------------------------------------------

  final Firestore _instance;
  CollectionReference get _facilitiesColRef =>
      _instance.collection('facilities');
}
