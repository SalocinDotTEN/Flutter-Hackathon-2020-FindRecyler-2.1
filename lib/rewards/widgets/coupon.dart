import 'package:findrecycler/app_level/models/coupon_data.dart';
import 'package:findrecycler/app_level/utilities/screen_size.dart';
import 'package:findrecycler/rewards/widgets/coupon_card.dart';
import 'package:flutter/material.dart';

class CouponSwiper extends StatefulWidget {
  const CouponSwiper({Key key}) : super(key: key);

  @override
  _CouponSwiperState createState() => _CouponSwiperState();
}

class _CouponSwiperState extends State<CouponSwiper> {
  PageController controller;
  int currentpage = 0;

  double get _height => ScreenQueries.instance.height(context);

  @override
  void initState() {
    super.initState();
    controller = PageController(
      initialPage: currentpage,
      keepPage: false,
      viewportFraction: 0.9,
    );
  }

  @override
  Widget build(BuildContext context) {
    //

    final _data = CouponsData.initialData();

    return SizedBox(
      height: _height * 0.3,
      child: PageView.builder(
        pageSnapping: true,
        onPageChanged: (value) {
          setState(() => currentpage = value);
        },
        controller: controller,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: AnimatedBuilder(
              animation: controller,
              builder: (context, child) {
                return child;
              },
              child: CouponCard(
                assetName: _data[index].assetName,
                couponName: _data[index].couponName,
                couponDesc: _data[index].couponDesc,
              ),
            ),
          );
        },
        itemCount: _data.length,
      ),
    );
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
