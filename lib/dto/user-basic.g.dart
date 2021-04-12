// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user-basic.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserBasic _$UserBasicFromJson(Map<String, dynamic> json) {
  return UserBasic()
    ..gmail = json['gmail'] as String
    ..password = json['password'] as String
    ..userType = _$enumDecodeNullable(_$UserTypeEnumMap, json['userType']);
}

Map<String, dynamic> _$UserBasicToJson(UserBasic instance) => <String, dynamic>{
      'gmail': instance.gmail,
      'password': instance.password,
      'userType': _$UserTypeEnumMap[instance.userType],
    };

T _$enumDecode<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    throw ArgumentError('A value must be provided. Supported values: '
        '${enumValues.values.join(', ')}');
  }

  final value = enumValues.entries
      .singleWhere((e) => e.value == source, orElse: () => null)
      ?.key;

  if (value == null && unknownValue == null) {
    throw ArgumentError('`$source` is not one of the supported values: '
        '${enumValues.values.join(', ')}');
  }
  return value ?? unknownValue;
}

T _$enumDecodeNullable<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    return null;
  }
  return _$enumDecode<T>(enumValues, source, unknownValue: unknownValue);
}

const _$UserTypeEnumMap = {
  UserType.TEACHER: 'TEACHER',
  UserType.STUDENTPARRENT: 'STUDENTPARRENT',
};
