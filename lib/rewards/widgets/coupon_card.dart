import 'package:findrecycler/app_level/extensions/textstyle_extension.dart';
import 'package:flutter/material.dart';

class CouponCard extends StatelessWidget {
  const CouponCard({
    Key key,
    @required this.assetName,
    this.couponName = 'CouponName',
    this.couponDesc = 'CouponDesc',
  }) : super(key: key);

  final String assetName;
  final String couponName;
  final String couponDesc;

  @override
  Widget build(BuildContext context) {
    //

    return Container(
      child: Material(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: () {},
          child: Stack(
            fit: StackFit.expand,
            children: [
              Ink.image(
                image: AssetImage(assetName),
                fit: BoxFit.cover,
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 16),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      couponName,
                      style: Theme.of(context).textTheme.headline5.bold,
                    ),
                    Text(
                      couponDesc,
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
