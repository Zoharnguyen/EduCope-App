// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user-profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserProfile _$UserProfileFromJson(Map<String, dynamic> json) {
  UserProfile userProfile = new UserProfile();
  (json['id'] != null) ? userProfile.id = json['id'] as String : null;
  (json['fullName'] != null)
      ? userProfile.fullName = json['fullName'] as String
      : null;
  (json['phoneNumber'] != null)
      ? userProfile.phoneNumber = json['phoneNumber'] as String
      : null;
  (json['urlImageProfile'] != null)
      ? userProfile.urlImageProfile = json['urlImageProfile'] as String
      : null;
  (json['introduction'] != null)
      ? userProfile.introduction = json['introduction'] as String
      : null;
  (json['rate'] != null) ? userProfile.rate = json['rate'] as String : null;
  (json['userType'] != null)
      ? userProfile.userType = _$enumDecode(_$UserTypeEnumMap, json['userType'])
      : null;
  (json['adjustUserProfileList'] != null)
      ? userProfile.adjustUserProfileList =
      (json['adjustUserProfileList'] as List<dynamic>)
          .map((e) => AdjustUserProfile.fromJson(e as Map<String, dynamic>))
          .toList()
      : null;
  (json['adjustStatus'] != null) ? userProfile.adjustStatus = json['adjustStatus'] as String : null;
  return userProfile;
}

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

Map<String, dynamic> _$UserProfileToJson(UserProfile instance) =>
    <String, dynamic>{
      'id': instance.id,
      'fullName': instance.fullName,
      'phoneNumber': instance.phoneNumber,
      'urlImageProfile': instance.urlImageProfile,
      'introduction': instance.introduction,
      'rate': instance.rate,
      'userType': _$UserTypeEnumMap[instance.userType],
      'adjustStatus': instance.adjustStatus,
    };

const _$UserTypeEnumMap = {
  UserType.TEACHER: 'TEACHER',
  UserType.STUDENTPARENT: 'STUDENTPARENT',
};
