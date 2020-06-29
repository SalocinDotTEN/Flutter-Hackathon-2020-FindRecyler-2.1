import 'package:cached_network_image/cached_network_image.dart';
import 'package:findrecycler/app_level/models/freezed/facility.dart';
import 'package:findrecycler/app_level/styles/colors.dart';
import 'package:findrecycler/facility_information/widgets/info_box.dart';
import 'package:flutter/material.dart';

import '../app_level/utilities/screen_size.dart';

class FacilityInformationScreen extends StatelessWidget {
  final FacilityModel facilityModel;

  const FacilityInformationScreen({Key key, @required this.facilityModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Facility Information'),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.fromLTRB(16.0, 0, 16, 20),
        child: RaisedButton.icon(
          color: Theme.of(context).accentColor,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          textTheme: ButtonTextTheme.primary,
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
          onPressed: () {},
          icon: Icon(Icons.delete),
          label: Text(
            'Confirm discard item'.toUpperCase(),
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              letterSpacing: 0.2,
            ),
          ),
        ),
      ),
      body: ListView(
        children: <Widget>[
          //ImageCard

          Container(
            color: AppColors.backgroundGrey,
            height: ScreenQueries.instance.customHeightPercent(context, 0.35),
            child: CachedNetworkImage(
              imageUrl: facilityModel.facilityImageUrl,
              fit: BoxFit.cover,
              placeholder: (context, url) =>
                  Center(child: const CircularProgressIndicator()),
              errorWidget: (context, url, error) => const Icon(
                Icons.error,
                color: Colors.grey,
                size: 50,
              ),
            ),
          ),

          //
          SizedBox(
            height: 8,
          ),
          InfoBox(
            title: 'Facility Name',
            value: facilityModel.facilityName ?? '',
          ),
          InfoBox(
            title: 'Facility Address',
            value: facilityModel.facilityAddress ?? '',
            multipleLine: true,
          ),
          InfoBox(
            title: 'Facility Type',
            value: facilityModel.facilityType ?? '',
            isDropDown: true,
          ),
        ],
      ),
    );
  }
}
