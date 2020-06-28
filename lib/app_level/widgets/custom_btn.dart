import 'package:flutter/material.dart';

class CustomizedButton extends StatelessWidget {
  const CustomizedButton({
    Key key,
    @required this.action,
    this.height = 50.0,
    this.text = 'Hello',
    this.width = double.infinity,
  })  : assert(action != null),
        assert(height != null),
        super(key: key);

  final String text;
  final double height;
  final Function() action;
  final double width;

  @override
  Widget build(BuildContext context) {
    //

    return SizedBox(
      height: height,
      width: width,
      child: FlatButton(
        color: Theme.of(context).accentColor,
        splashColor: Colors.transparent,
        onPressed: action,
        shape: const StadiumBorder(),
        textTheme: ButtonTextTheme.primary,
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
        child: Center(
          child: Text(
            text.toUpperCase(),
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              letterSpacing: 0.2,
            ),
          ),
        ),
      ),
    );
  }
}
