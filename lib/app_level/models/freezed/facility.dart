import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'facility.freezed.dart';
part 'facility.g.dart';

@freezed
abstract class FacilityModel with _$FacilityModel {
  const factory FacilityModel({
    @JsonKey(name: 'facility_image') String facilityImageUrl,
    @JsonKey(name: 'facility_name') String facilityName,
    @JsonKey(name: 'facility_address') String facilityAddress,
    @JsonKey(name: 'facility_type') String facilityType,
  }) = _FacilityModel;

  factory FacilityModel.fromJson(Map<String, dynamic> json) =>
      _$FacilityModelFromJson(json);
}

class CenterFormData with ChangeNotifier {
  String _address;

  String get address => _address;

  set address(String address) {
    _address = address;
    notifyListeners();
  }

  String _imgUrl;

  String get imgUrl => _imgUrl;

  set imgUrl(String imgUrl) {
    _imgUrl = imgUrl;
    notifyListeners();
  }

  String _name;

  String get name => _name;

  set name(String name) {
    _name = name;
    notifyListeners();
  }

  String _type;

  String get type => _type;

  set type(String type) {
    _type = type;
    notifyListeners();
  }

  @override
  String toString() {
    final _str = '${name} ${imgUrl} ${type} ${address}';
    return _str;
  }
}
