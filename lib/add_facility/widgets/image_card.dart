import 'package:findrecycler/app_level/services/image_picker.dart';
import 'package:findrecycler/app_level/styles/colors.dart';
import 'package:findrecycler/app_level/utilities/screen_size.dart';

import 'package:flutter/material.dart';

class ImageCard extends StatelessWidget {
  const ImageCard({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        final _img = await ImagePickerService.getImage();
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Container(
          color: AppColors.backgroundGrey,
          alignment: Alignment.center,
          height: ScreenQueries.instance.customHeightPercent(context, 0.25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.add_photo_alternate,
                size: ScreenQueries.instance.customHeightPercent(context, 0.15),
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
    );
  }
}
