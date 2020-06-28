import 'package:findrecycler/app_level/assets/assets.dart';
import 'package:findrecycler/rewards/widgets/rounded_shadow.dart';

import 'package:flutter/material.dart';

class PUBCard extends StatelessWidget {
  const PUBCard({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 8.0),
      child: RoundedShadow.fromRadius(
        12.0,
        child: Container(
          color: Colors.green.withOpacity(0.4),
          height: 100.0,
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 24, vertical: 0),
            child: Row(
              children: <Widget>[
                Image.asset(
                  AppAssets.kfc.assetName,
                  fit: BoxFit.fitWidth,
                  width: 50.0,
                ),
                SizedBox(width: 24),
                //Label
                Expanded(
                  child: Text(
                    'widget',
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
