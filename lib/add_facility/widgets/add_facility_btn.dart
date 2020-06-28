import 'package:findrecycler/app_level/models/freezed/facility.dart';
import 'package:findrecycler/app_level/services/firestore/db_service.dart';
import 'package:findrecycler/locator.dart';

import 'package:flutter/material.dart';

class AddFacilityButton extends StatelessWidget {
  const AddFacilityButton({Key key, this.model}) : super(key: key);

  final CenterFormData model;

  static final _dbService = locator<FirestoreService>();

  @override
  Widget build(BuildContext context) {
    //

    return Padding(
      padding: const EdgeInsets.fromLTRB(16.0, 0, 16, 20),
      child: RaisedButton.icon(
        color: Theme.of(context).accentColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        textTheme: ButtonTextTheme.primary,
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
        onPressed: () async {
          await _dbService.addFacility(FacilityModel(
            facilityImageUrl: model.imgUrl,
            facilityName: model.name,
            facilityAddress: model.address,
            facilityType: model.type,
          ));
        },
        icon: Icon(Icons.add_circle),
        label: Text(
          'Add This Facility'.toUpperCase(),
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
            letterSpacing: 0.2,
          ),
        ),
      ),
    );
  }
}
