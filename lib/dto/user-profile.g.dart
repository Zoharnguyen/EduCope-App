// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user-profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserProfile _$UserProfileFromJson(Map<String, dynamic> json) {
  return UserProfile()
    ..adjustUserProfileList = (json['adjustUserProfileList'] as List<dynamic>?)
            ?.map((e) => AdjustUserProfile.fromJson(e as Map<String, dynamic>))
            .toList() ??
        []
    ..adjustStatus = json['adjustStatus'] as String
    ..userType = _$enumDecode(_$UserTypeEnumMap, json['userType'])
    ..id = json['id'] as String
    ..fullName = json['fullName'] as String
    ..phoneNumber = json['phoneNumber'] as String
    ..urlImageProfile = json['urlImageProfile'] as String
    ..introduction = json['introduction'] as String
    ..rate = json['rate'] as String;
}

Map<String, dynamic> _$UserProfileToJson(UserProfile instance) =>
    <String, dynamic>{
      'adjustUserProfileList': instance.adjustUserProfileList,
      'adjustStatus': instance.adjustStatus,
      'userType': _$UserTypeEnumMap[instance.userType],
      'id': instance.id,
      'fullName': instance.fullName,
      'phoneNumber': instance.phoneNumber,
      'urlImageProfile': instance.urlImageProfile,
      'introduction': instance.introduction,
      'rate': instance.rate,
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

const _$UserTypeEnumMap = {
  UserType.TEACHER: 'TEACHER',
  UserType.STUDENTPARENT: 'STUDENTPARENT',
};
