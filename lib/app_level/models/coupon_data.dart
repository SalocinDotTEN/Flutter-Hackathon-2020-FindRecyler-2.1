import 'package:findrecycler/app_level/assets/assets.dart';

class CouponData {
  final String assetName;
  final String couponName;
  final String couponDesc;

  CouponData({
    this.assetName,
    this.couponName,
    this.couponDesc,
  });
}

class CouponsData {
  CouponsData._();

  static List<CouponData> initialData() {
    final _data = [
      CouponData(
        assetName: AppAssets.starbucks3.assetName,
        couponDesc: 'Valid till end July 2020',
        couponName: '1 on 1',
      ),
      CouponData(
        assetName: AppAssets.mcd.assetName,
        couponDesc: 'Valid till end Sep 2020',
        couponName: '\$5 Off',
      ),
      CouponData(
        assetName: AppAssets.kfc2.assetName,
        couponDesc: 'Valid till end October 2020',
        couponName: '22% Off',
      ),
      CouponData(
        assetName: AppAssets.kfc.assetName,
        couponDesc: 'Valid till end Nov 2020',
        couponName: 'Buy 2 Get 1',
      ),
    ];

    return _data;
  }
}
