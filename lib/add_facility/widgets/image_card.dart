import 'dart:io';

import 'package:findrecycler/app_level/models/freezed/facility.dart';
import 'package:findrecycler/app_level/services/image_picker.dart';
import 'package:findrecycler/app_level/services/storage_service.dart';
import 'package:findrecycler/app_level/styles/colors.dart';
import 'package:findrecycler/app_level/utilities/screen_size.dart';
import 'package:findrecycler/locator.dart';

import 'package:flutter/material.dart';

class ImageCard extends StatefulWidget {
  const ImageCard({Key key, this.model}) : super(key: key);

  final CenterFormData model;

  @override
  _ImageCardState createState() => _ImageCardState();
}

class _ImageCardState extends State<ImageCard> {
  File _imgFile;

  final _cloudService = locator<CloudStorageService>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        _imgFile = await ImagePickerService.getImage();
        setState(() {});

        final _resp = await _cloudService.uploadImage(fileToUpload: _imgFile);
        widget.model.imgUrl = _resp.imageUrl;
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Container(
          color: AppColors.backgroundGrey,
          // alignment: Alignment.center,
          height: ScreenQueries.instance.customHeightPercent(context, 0.35),
          child: _imgFile == null
              ? Column(
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
                )
              : SizedBox(
                  child: Image.file(_imgFile, fit: BoxFit.fill),
                  width: double.maxFinite,
                  height: double.maxFinite,
                ),
        ),
      ),
    );
  }
}
