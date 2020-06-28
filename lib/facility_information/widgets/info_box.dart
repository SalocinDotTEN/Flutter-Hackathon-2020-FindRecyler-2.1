import 'package:findrecycler/app_level/styles/colors.dart';
import 'package:flutter/material.dart';

import '../../app_level/utilities/screen_size.dart';

class InfoBox extends StatelessWidget {
  final String title;
  final String value;
  final bool multipleLine;

  const InfoBox(
      {Key key,
      @required this.title,
      @required this.value,
      this.multipleLine = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 8),
          Container(
            width: double.maxFinite,
            height: multipleLine
                ? ScreenQueries.instance.customHeightPercent(context, 0.13)
                : null,
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
            decoration: BoxDecoration(
              color: AppColors.backgroundGrey,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Text(
              value,
              overflow: TextOverflow.fade,
            ),
          ),
        ],
      ),
    );
  }
}
