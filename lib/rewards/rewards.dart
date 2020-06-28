import 'package:findrecycler/rewards/widgets/coupon.dart';
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
            ListView.builder(
              shrinkWrap: true,
              padding: EdgeInsets.only(bottom: 40, top: 10),
              itemCount: 1,
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) => _buildListItem(index),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildListItem(int index) {
    return CouponSwiper();
  }
}
