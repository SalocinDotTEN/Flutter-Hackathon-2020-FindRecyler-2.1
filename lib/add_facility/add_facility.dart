import 'package:flutter/material.dart';

import '../app_level/styles/colors.dart';
import '../app_level/utilities/screen_size.dart';

class AddFacilityScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text('Add a Facility'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Container(
                color: AppColors.backgroundGrey,
                alignment: Alignment.center,
                height: ScreenQueries.instance.customHeightPercent(context, 20),
                child: Icon(
                  Icons.add_photo_alternate,
                  size: 50,
                  color: Colors.blueGrey,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
