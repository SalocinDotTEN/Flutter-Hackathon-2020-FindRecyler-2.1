import 'package:findrecycler/app_level/assets/assets.dart';
import 'package:findrecycler/app_level/styles/colors.dart';
import 'package:findrecycler/app_level/utilities/screen_size.dart';
import 'package:findrecycler/rewards/widgets/rounded_shadow.dart';

import 'package:flutter/material.dart';

class PUBCard extends StatelessWidget {
  const PUBCard({
    Key key,
    this.billName = 'Bill Name',
  }) : super(key: key);

  final String billName;

  @override
  Widget build(BuildContext context) {
    //

    final _height = ScreenQueries.instance.height(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 8.0),
      child: RoundedShadow.fromRadius(
        12.0,
        child: Container(
          color: Colors.white.withOpacity(0.7),
          height: _height * 0.1,
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 24, vertical: 0),
            child: Row(
              children: <Widget>[
                Image.asset(
                  AppAssets.kfc.assetName,
                  fit: BoxFit.contain,
                  width: 50.0,
                ),
                const SizedBox(width: 16),
                //Label
                Expanded(
                  child: Text(
                    billName.toUpperCase(),
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                ),
                const Icon(
                  Icons.star,
                  size: 20,
                ),
                const SizedBox(width: 4),
                Text(
                  'sdsdsds',
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
