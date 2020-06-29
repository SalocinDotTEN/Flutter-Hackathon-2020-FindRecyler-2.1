import 'package:findrecycler/app_level/constants/constants.dart';
import 'package:findrecycler/app_level/models/freezed/facility.dart';
import 'package:findrecycler/app_level/services/firestore/db_service.dart';
import 'package:findrecycler/app_level/utilities/screen_size.dart';
import 'package:findrecycler/app_level/widgets/custom_btn.dart';
import 'package:findrecycler/app_level/widgets/dialog.dart';
import 'package:findrecycler/app_level/widgets/flare_tick.dart';
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

          _showDetails(context);
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

  void _showDetails(BuildContext c) async {
    final _width = ScreenQueries.instance.width(c);

    await showDialog<bool>(
      context: c,
      builder: (_) => CustomDialog(
        width: _width,
        children: <Widget>[
          const FlareTick(),
          CustomizedButton(
            action: () async {
              await Navigator.of(c).popUntil(
                ModalRoute.withName(ApplevelRoutes.homeScreen),
              );
            },
            text: AppLevelConstants.goToHome,
          ),
        ],
      ),
    );
  }
}
