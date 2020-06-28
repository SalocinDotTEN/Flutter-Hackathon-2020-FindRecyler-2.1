import 'package:findrecycler/app_level/constants/constants.dart';
import 'package:flutter/material.dart';

class FacilityBottomSheet extends StatelessWidget {
  final parent;
  const FacilityBottomSheet({Key key, this.parent}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 18.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          FlatButton(
            padding: EdgeInsets.symmetric(vertical: 15),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            color: Colors.green,
            onPressed: () => Navigator.pushNamed(
              context,
              ApplevelRoutes.addFacilityScreen,
            ),
            child: Text(
              'Add a Facility!',
              style: TextStyle(color: Colors.white),
            ),
          ),
          SizedBox(height: 10),
          FlatButton(
            padding: EdgeInsets.symmetric(vertical: 15),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            color: Colors.green,
            disabledColor: Colors.grey,
            onPressed: parent.selectedMarker != null
                ? () {
                    Navigator.pushNamed(
                      context,
                      ApplevelRoutes.discardItemScreen,
                      arguments: parent.selectedMarker
                    );
                  }
                : null,
            child: Text(
              'Discard Item',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
