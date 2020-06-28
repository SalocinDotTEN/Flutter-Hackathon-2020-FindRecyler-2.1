import 'package:flutter/material.dart';

class Points extends StatelessWidget {
  const Points({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 18.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            'Your Points',
            style: Theme.of(context).textTheme.headline5,
          ),
          Text(
            '200',
            style: Theme.of(context).textTheme.headline4.copyWith(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
          )
        ],
      ),
    );
  }
}
