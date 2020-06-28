import 'package:findrecycler/app_level/constants/constants.dart';
import 'package:flutter/material.dart';

class PopUpMenu extends StatelessWidget {
  const PopUpMenu({Key key}) : super(key: key);

  static final List<String> options = ['Rewards'];

  @override
  Widget build(BuildContext context) {
    void _select(String option) {
      Navigator.of(context).pushNamed(ApplevelRoutes.rewards);
    }

    return PopupMenuButton<String>(
      elevation: 3.2,
      initialValue: options.first,
      onCanceled: () {
        print('You have not chossed anything');
      },
      onSelected: _select,
      itemBuilder: (BuildContext context) {
        return options.map((choice) {
          return PopupMenuItem(
            value: choice,
            child: Text(choice),
          );
        }).toList();
      },
    );
  }
}
