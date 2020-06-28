import 'package:flutter/material.dart';

class CustomDialog extends StatelessWidget {
  const CustomDialog({
    @required this.width,
    @required this.children,
  })  : assert(width != null),
        assert(children != null);

  ///Width of the dialog.
  final double width;

  ///Widgets to show...
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return _constructDialog(context, width);
  }

  //Constructs the dialog...
  Widget _constructDialog(BuildContext context, double _width) {
    //begin...

    return Dialog(
      elevation: 8.0,
      insetAnimationCurve: Curves.easeInOut,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 22.0, horizontal: 16.0),
        child: SizedBox(
          width: _width,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [...children],
          ),
        ),
      ),
    );
  }
}
