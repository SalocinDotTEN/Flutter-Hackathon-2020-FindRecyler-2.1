import 'package:flutter/foundation.dart' show ChangeNotifier;

class DropdownValue with ChangeNotifier {
  String _currentValue;

  /// What is the value to be displayed...
  String get currentValue => _currentValue;

  /// Changes the dropdown value to `value`
  void changeDropDownValue(String value) {
    _currentValue = value;
    notifyListeners();
  }
}
