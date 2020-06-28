import 'package:findrecycler/app_level/constants/constants.dart';
import 'package:findrecycler/app_level/models/map_model.dart';
import 'package:findrecycler/app_level/services/image_picker.dart';
import 'package:flutter/material.dart';

import '../app_level/styles/colors.dart';
import '../app_level/utilities/screen_size.dart';

class DiscardItemScreen extends StatefulWidget {
  final MapModelData data;
  const DiscardItemScreen({Key key, this.data}) : super(key: key);

  @override
  _DiscardItemScreen createState() => _DiscardItemScreen(data);
}

class _DiscardItemScreen extends State<DiscardItemScreen> {
  final MapModelData mapData;

  _DiscardItemScreen(this.mapData);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Discard Facility'),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.fromLTRB(16.0, 0, 16, 20),
        child: RaisedButton.icon(
          color: Theme.of(context).accentColor,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          textTheme: ButtonTextTheme.primary,
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
          onPressed: () => _showMyDialog(),
          icon: Icon(Icons.delete_forever),
          label: Text(
            'Discard Facility'.toUpperCase(),
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              letterSpacing: 0.2,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                'Facility Name',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
              ),
            ),

            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              decoration: BoxDecoration(
                color: AppColors.backgroundGrey,
                borderRadius: BorderRadius.circular(5),
              ),
              child: TextFormField(
                initialValue: mapData.placeTitle,
                readOnly: true,
                decoration: InputDecoration(
                  border: InputBorder.none,
                ),
              ),
            ),

            SizedBox(height: 5),

            //PHOTO TITLE
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                'Facility Photo',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
              ),
            ),

            //IMAGE CARD
            GestureDetector(
              onTap: () => ImagePickerService.picker,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Container(
                  color: AppColors.backgroundGrey,
                  alignment: Alignment.center,
                  height:
                      ScreenQueries.instance.customHeightPercent(context, 0.25),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        Icons.add_photo_alternate,
                        size: ScreenQueries.instance
                            .customHeightPercent(context, 0.15),
                        color: Colors.grey,
                      ),
                      Text(
                        'Tap to select or take a picture',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Thanks for confirming'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('100 points awarded!'),
                Text(
                    'Thank you for confirming discard of the item here. Tap OK to go back to the home screen.'),
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('OK'),
              onPressed: () => Navigator.pushNamedAndRemoveUntil(context,
                  ApplevelRoutes.homeScreen, (Route<dynamic> route) => false),
            ),
          ],
        );
      },
    );
  }
}
