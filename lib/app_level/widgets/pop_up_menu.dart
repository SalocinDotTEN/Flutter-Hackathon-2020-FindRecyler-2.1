import 'package:flutter/material.dart';

class PopUpMenu extends StatelessWidget {
  const PopUpMenu({Key key}) : super(key: key);

  static final List<String> options = ['Rewards'];

  @override
  Widget build(BuildContext context) {
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

  void _select(String option) {
    print('Option $option');
  }
}
