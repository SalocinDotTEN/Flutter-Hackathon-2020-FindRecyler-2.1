// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'facility.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
FacilityModel _$FacilityModelFromJson(Map<String, dynamic> json) {
  return _FacilityModel.fromJson(json);
}

class _$FacilityModelTearOff {
  const _$FacilityModelTearOff();

  _FacilityModel call(
      {@JsonKey(name: 'facility_image') String facilityImageUrl,
      @JsonKey(name: 'facility_name') String facilityName,
      @JsonKey(name: 'facility_address') String facilityAddress,
      @JsonKey(name: 'facility_type') String facilityType}) {
    return _FacilityModel(
      facilityImageUrl: facilityImageUrl,
      facilityName: facilityName,
      facilityAddress: facilityAddress,
      facilityType: facilityType,
    );
  }
}

// ignore: unused_element
const $FacilityModel = _$FacilityModelTearOff();

mixin _$FacilityModel {
  @JsonKey(name: 'facility_image')
  String get facilityImageUrl;
  @JsonKey(name: 'facility_name')
  String get facilityName;
  @JsonKey(name: 'facility_address')
  String get facilityAddress;
  @JsonKey(name: 'facility_type')
  String get facilityType;

  Map<String, dynamic> toJson();
  $FacilityModelCopyWith<FacilityModel> get copyWith;
}

abstract class $FacilityModelCopyWith<$Res> {
  factory $FacilityModelCopyWith(
          FacilityModel value, $Res Function(FacilityModel) then) =
      _$FacilityModelCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'facility_image') String facilityImageUrl,
      @JsonKey(name: 'facility_name') String facilityName,
      @JsonKey(name: 'facility_address') String facilityAddress,
      @JsonKey(name: 'facility_type') String facilityType});
}

class _$FacilityModelCopyWithImpl<$Res>
    implements $FacilityModelCopyWith<$Res> {
  _$FacilityModelCopyWithImpl(this._value, this._then);

  final FacilityModel _value;
  // ignore: unused_field
  final $Res Function(FacilityModel) _then;

  @override
  $Res call({
    Object facilityImageUrl = freezed,
    Object facilityName = freezed,
    Object facilityAddress = freezed,
    Object facilityType = freezed,
  }) {
    return _then(_value.copyWith(
      facilityImageUrl: facilityImageUrl == freezed
          ? _value.facilityImageUrl
          : facilityImageUrl as String,
      facilityName: facilityName == freezed
          ? _value.facilityName
          : facilityName as String,
      facilityAddress: facilityAddress == freezed
          ? _value.facilityAddress
          : facilityAddress as String,
      facilityType: facilityType == freezed
          ? _value.facilityType
          : facilityType as String,
    ));
  }
}

abstract class _$FacilityModelCopyWith<$Res>
    implements $FacilityModelCopyWith<$Res> {
  factory _$FacilityModelCopyWith(
          _FacilityModel value, $Res Function(_FacilityModel) then) =
      __$FacilityModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'facility_image') String facilityImageUrl,
      @JsonKey(name: 'facility_name') String facilityName,
      @JsonKey(name: 'facility_address') String facilityAddress,
      @JsonKey(name: 'facility_type') String facilityType});
}

class __$FacilityModelCopyWithImpl<$Res>
    extends _$FacilityModelCopyWithImpl<$Res>
    implements _$FacilityModelCopyWith<$Res> {
  __$FacilityModelCopyWithImpl(
      _FacilityModel _value, $Res Function(_FacilityModel) _then)
      : super(_value, (v) => _then(v as _FacilityModel));

  @override
  _FacilityModel get _value => super._value as _FacilityModel;

  @override
  $Res call({
    Object facilityImageUrl = freezed,
    Object facilityName = freezed,
    Object facilityAddress = freezed,
    Object facilityType = freezed,
  }) {
    return _then(_FacilityModel(
      facilityImageUrl: facilityImageUrl == freezed
          ? _value.facilityImageUrl
          : facilityImageUrl as String,
      facilityName: facilityName == freezed
          ? _value.facilityName
          : facilityName as String,
      facilityAddress: facilityAddress == freezed
          ? _value.facilityAddress
          : facilityAddress as String,
      facilityType: facilityType == freezed
          ? _value.facilityType
          : facilityType as String,
    ));
  }
}

@JsonSerializable()
class _$_FacilityModel with DiagnosticableTreeMixin implements _FacilityModel {
  const _$_FacilityModel(
      {@JsonKey(name: 'facility_image') this.facilityImageUrl,
      @JsonKey(name: 'facility_name') this.facilityName,
      @JsonKey(name: 'facility_address') this.facilityAddress,
      @JsonKey(name: 'facility_type') this.facilityType});

  factory _$_FacilityModel.fromJson(Map<String, dynamic> json) =>
      _$_$_FacilityModelFromJson(json);

  @override
  @JsonKey(name: 'facility_image')
  final String facilityImageUrl;
  @override
  @JsonKey(name: 'facility_name')
  final String facilityName;
  @override
  @JsonKey(name: 'facility_address')
  final String facilityAddress;
  @override
  @JsonKey(name: 'facility_type')
  final String facilityType;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'FacilityModel(facilityImageUrl: $facilityImageUrl, facilityName: $facilityName, facilityAddress: $facilityAddress, facilityType: $facilityType)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'FacilityModel'))
      ..add(DiagnosticsProperty('facilityImageUrl', facilityImageUrl))
      ..add(DiagnosticsProperty('facilityName', facilityName))
      ..add(DiagnosticsProperty('facilityAddress', facilityAddress))
      ..add(DiagnosticsProperty('facilityType', facilityType));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _FacilityModel &&
            (identical(other.facilityImageUrl, facilityImageUrl) ||
                const DeepCollectionEquality()
                    .equals(other.facilityImageUrl, facilityImageUrl)) &&
            (identical(other.facilityName, facilityName) ||
                const DeepCollectionEquality()
                    .equals(other.facilityName, facilityName)) &&
            (identical(other.facilityAddress, facilityAddress) ||
                const DeepCollectionEquality()
                    .equals(other.facilityAddress, facilityAddress)) &&
            (identical(other.facilityType, facilityType) ||
                const DeepCollectionEquality()
                    .equals(other.facilityType, facilityType)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(facilityImageUrl) ^
      const DeepCollectionEquality().hash(facilityName) ^
      const DeepCollectionEquality().hash(facilityAddress) ^
      const DeepCollectionEquality().hash(facilityType);

  @override
  _$FacilityModelCopyWith<_FacilityModel> get copyWith =>
      __$FacilityModelCopyWithImpl<_FacilityModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_FacilityModelToJson(this);
  }
}

abstract class _FacilityModel implements FacilityModel {
  const factory _FacilityModel(
      {@JsonKey(name: 'facility_image') String facilityImageUrl,
      @JsonKey(name: 'facility_name') String facilityName,
      @JsonKey(name: 'facility_address') String facilityAddress,
      @JsonKey(name: 'facility_type') String facilityType}) = _$_FacilityModel;

  factory _FacilityModel.fromJson(Map<String, dynamic> json) =
      _$_FacilityModel.fromJson;

  @override
  @JsonKey(name: 'facility_image')
  String get facilityImageUrl;
  @override
  @JsonKey(name: 'facility_name')
  String get facilityName;
  @override
  @JsonKey(name: 'facility_address')
  String get facilityAddress;
  @override
  @JsonKey(name: 'facility_type')
  String get facilityType;
  @override
  _$FacilityModelCopyWith<_FacilityModel> get copyWith;
}
