import 'package:cached_network_image/cached_network_image.dart';
import 'package:findrecycler/app_level/constants/constants.dart';
import 'package:findrecycler/app_level/models/freezed/facility.dart';
import 'package:findrecycler/app_level/styles/colors.dart';
import 'package:findrecycler/app_level/utilities/screen_size.dart';
import 'package:flutter/material.dart';

class MapPinWindow extends StatelessWidget {
  final FacilityModel facilityModel;

  const MapPinWindow({Key key, this.facilityModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: GestureDetector(
        onTap: () => Navigator.pushNamed(
            context, ApplevelRoutes.facilityInformationScreen,
            arguments: facilityModel),
        child: Material(
          borderRadius: BorderRadius.circular(8),
          elevation: 2,
          child: Container(
            alignment: Alignment.center,
            height: ScreenQueries.instance.customHeightPercent(context, 0.13),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
            child: ListTile(
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(4),
                child: Container(
                  color: AppColors.backgroundGrey,
                  height: 60,
                  width: 60,
                  child: CachedNetworkImage(
                    imageUrl: facilityModel.facilityImageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              title: Text(facilityModel.facilityName),
              subtitle: Text(
                facilityModel.facilityAddress,
                overflow: TextOverflow.fade,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
