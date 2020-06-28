import 'package:flutter/material.dart';

class AppDropDown extends StatelessWidget {
  const AppDropDown({
    Key key,
    @required this.items,
    @required this.onChange,
    this.hintText = 'Hint comes here',
    this.value,
  })  : assert(items != null),
        super(key: key);

  final List<String> items;

  final Function(String) onChange;

  final String hintText;

  final String value;

  @override
  Widget build(BuildContext context) {
    //

    return DropdownButton<String>(
      hint: Text(
        hintText,
        style: Theme.of(context).textTheme.headline6,
      ),
      iconSize: 25.0,
      isExpanded: true,
      items: items
          .map<DropdownMenuItem<String>>(
            (value) => DropdownMenuItem<String>(
              value: value,
              child: Text(
                value,
                style: TextStyle(fontSize: 17.0),
              ),
            ),
          )
          .toList(),
      onChanged: onChange,
      underline: Container(color: Colors.transparent),
      value: value,
    );
  }
}
