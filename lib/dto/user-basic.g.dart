// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user-basic.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserBasic _$UserBasicFromJson(Map<String, dynamic> json) {
  return UserBasic()
    ..gmail = json['gmail'] as String?
    ..password = json['password'] as String?
    ..userType = _$enumDecodeNullable(_$UserTypeEnumMap, json['userType']);
}

Map<String, dynamic> _$UserBasicToJson(UserBasic instance) => <String, dynamic>{
      'gmail': instance.gmail,
      'password': instance.password,
      'userType': _$UserTypeEnumMap[instance.userType],
    };

K _$enumDecode<K, V>(
  Map<K, V> enumValues,
  Object? source, {
  K? unknownValue,
}) {
  if (source == null) {
    throw ArgumentError(
      'A value must be provided. Supported values: '
      '${enumValues.values.join(', ')}',
    );
  }

  return enumValues.entries.singleWhere(
    (e) => e.value == source,
    orElse: () {
      if (unknownValue == null) {
        throw ArgumentError(
          '`$source` is not one of the supported values: '
          '${enumValues.values.join(', ')}',
        );
      }
      return MapEntry(unknownValue, enumValues.values.first);
    },
  ).key;
}

K? _$enumDecodeNullable<K, V>(
  Map<K, V> enumValues,
  dynamic source, {
  K? unknownValue,
}) {
  if (source == null) {
    return null;
  }
  return _$enumDecode<K, V>(enumValues, source, unknownValue: unknownValue);
}

const _$UserTypeEnumMap = {
  UserType.TEACHER: 'TEACHER',
  UserType.STUDENTPARENT: 'STUDENTPARENT',
};
