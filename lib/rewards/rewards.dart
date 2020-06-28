import 'package:findrecycler/rewards/widgets/coupon.dart';
import 'package:findrecycler/rewards/widgets/points.dart';
import 'package:flutter/material.dart';

class Rewards extends StatelessWidget {
  const Rewards({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //
    return Scaffold(
      appBar: AppBar(title: Text('Rewards')),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            ListView(
              shrinkWrap: true,
              padding: EdgeInsets.only(bottom: 40),
              scrollDirection: Axis.vertical,
              children: <Widget>[
                Points(),
                CouponSwiper(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
