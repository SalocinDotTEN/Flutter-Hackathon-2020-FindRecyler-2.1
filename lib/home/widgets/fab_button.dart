import 'package:findrecycler/app_level/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

Widget fab(BuildContext context) {
  return SpeedDial(
    // both default to 16
    marginRight: 18,
    marginBottom: 20,
    animatedIcon: AnimatedIcons.menu_close,
    animatedIconTheme: IconThemeData(size: 22.0),
    visible: true,
    closeManually: false,
    curve: Curves.bounceIn,
    overlayOpacity: 0.0,
    tooltip: 'Speed Dial',
    heroTag: 'speed-dial-hero-tag',
    backgroundColor: Colors.white,
    foregroundColor: Colors.black,
    elevation: 8.0,
    shape: CircleBorder(),
    children: [
      SpeedDialChild(
        child: Icon(Icons.add),
        backgroundColor: Colors.blueAccent,
        label: 'Add Facility',
        labelStyle: TextStyle(fontSize: 18.0),
        onTap: () => Navigator.pushNamed(
          context,
          ApplevelRoutes.addFacilityScreen,
        ),
      ),
      SpeedDialChild(
        child: Icon(Icons.delete),
        backgroundColor: Colors.redAccent,
        label: 'Discard Item',
        labelStyle: TextStyle(fontSize: 18.0),
        onTap: () {},
      ),
    ],
  );
}
