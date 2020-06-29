import 'package:findrecycler/app_level/constants/constants.dart';
import 'package:findrecycler/app_level/models/dropdown_data.dart';
import 'package:findrecycler/app_level/styles/colors.dart';
import 'package:findrecycler/app_level/widgets/dropdown.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../app_level/utilities/screen_size.dart';

class InfoBox extends StatelessWidget {
  final String title;
  final String value;
  final bool multipleLine;

  final bool isDropDown;

  const InfoBox({
    Key key,
    @required this.title,
    @required this.value,
    this.multipleLine = false,
    this.isDropDown = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //

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
          if (isDropDown)
            _DropDown()
          else
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

class _DropDown extends StatelessWidget {
  const _DropDown({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //

    return ChangeNotifierProvider<DropdownValue>(
      create: (_) => DropdownValue(),
      child: Consumer<DropdownValue>(
        builder: (_, value, child) {
          final _model = value;

          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            decoration: BoxDecoration(
              color: AppColors.backgroundGrey,
              borderRadius: BorderRadius.circular(5),
            ),
            child: AppDropDown(
              hintText: AppLevelConstants.dpDwnDefault,
              items: AppLevelConstants.dpDwnOptions,
              onChange: (val) {
                _model.changeDropDownValue(val);
              },
              value: _model.currentValue,
            ),
          );
        },
      ),
    );
  }
}
