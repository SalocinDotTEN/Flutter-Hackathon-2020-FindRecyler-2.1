class AppLevelConstants {
  AppLevelConstants._();

  static const String fontMuli = 'Muli';
  static const String appName = 'Find Recycler';

  static const String placeHint = 'e.g 808 French Rd';

  static const String dpDwnDefault = 'Please select';
  static const String dpDwnOptOne = 'Recycling Bin';
  static const String dpDwnOptTwo = 'Collection Centre';
  static const String dpDwnOptThree = 'Charity Bin';

  static const String goToHome = 'Go to home';

  static const List<String> dpDwnOptions = [
    dpDwnOptOne,
    dpDwnOptTwo,
    dpDwnOptThree,
  ];
}

class ApplevelRoutes {
  ApplevelRoutes._();

  static const String homeScreen = '/';
  static const String addFacilityScreen = '/addFacilityScreen';
  static const String facilityInformationScreen = '/facilityInformationScreen';
}
