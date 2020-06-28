import 'package:findrecycler/app_level/assets/assets.dart';
import 'package:findrecycler/rewards/widgets/coupon.dart';
import 'package:findrecycler/rewards/widgets/points.dart';
import 'package:findrecycler/rewards/widgets/pub_card.dart';
import 'package:flutter/material.dart';

class Rewards extends StatelessWidget {
  const Rewards({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //
    return Scaffold(
      appBar: AppBar(title: Text('Rewards')),
      backgroundColor: Colors.white.withOpacity(0.9),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Points(),
            CouponSwiper(),
            const SizedBox(height: 16.0),
            PUBCard(
              assetName: AppAssets.elex.assetName,
              billName: '5% off on Elex bill',
            ),
            PUBCard(
              assetName: AppAssets.water.assetName,
              billName: '15% off on Water bill',
            ),
            PUBCard(
              assetName: AppAssets.mobile.assetName,
              billName: '10% off on Phone bill',
            ),
          ],
        ),
      ),
    );
  }
}
