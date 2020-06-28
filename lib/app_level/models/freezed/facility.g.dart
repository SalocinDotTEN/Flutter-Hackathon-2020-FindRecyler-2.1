// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'facility.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_FacilityModel _$_$_FacilityModelFromJson(Map<String, dynamic> json) {
  return _$_FacilityModel(
    facilityImageUrl: json['facility_image'] as String,
    facilityName: json['facility_name'] as String,
    facilityAddress: json['facility_address'] as String,
    facilityType: json['facility_type'] as String,
  );
}

Map<String, dynamic> _$_$_FacilityModelToJson(_$_FacilityModel instance) =>
    <String, dynamic>{
      'facility_image': instance.facilityImageUrl,
      'facility_name': instance.facilityName,
      'facility_address': instance.facilityAddress,
      'facility_type': instance.facilityType,
    };
