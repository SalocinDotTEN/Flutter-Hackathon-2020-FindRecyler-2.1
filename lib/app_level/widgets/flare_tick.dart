import 'package:findrecycler/app_level/utilities/screen_size.dart';
import 'package:flare_flutter/flare_actor.dart';

import 'package:flutter/material.dart';

class FlareTick extends StatelessWidget {
  const FlareTick({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //
    final _height = ScreenQueries.instance.height(context);

    return SizedBox(
      height: _height * 0.3,
      child: FlareActor(
        'assets/animations/success.flr',
        animation: 'Untitled',
      ),
    );
  }
}
