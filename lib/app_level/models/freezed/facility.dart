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
