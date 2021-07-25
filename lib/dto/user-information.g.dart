// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user-information.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserInformation _$UserInformationFromJson(Map<String, dynamic> json) {
  return UserInformation()
    ..adjustUserProfileList = (json['adjustUserProfileList'] as List<dynamic>?)
        ?.map((e) => AdjustUserProfile.fromJson(e as Map<String, dynamic>))
        .toList()
    ..adjustStatus = json['adjustStatus'] as String?
    ..userType = _$enumDecodeNullable(_$UserTypeEnumMap, json['userType'])
    ..id = json['id'] as String?
    ..fullName = json['fullName'] as String?
    ..phoneNumber = json['phoneNumber'] as String?
    ..urlImageProfile = json['urlImageProfile'] as String?
    ..introduction = json['introduction'] as String?
    ..rate = json['rate'] as String?
    ..certificate = json['certificate'] as String?
    ..doB = json['doB'] as String?
    ..experience = json['experience'] as String?
    ..gender = json['gender'] as String?
    ..address = json['address'] as String?;
}

Map<String, dynamic> _$UserInformationToJson(UserInformation instance) =>
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
      'certificate': instance.certificate,
      'doB': instance.doB,
      'experience': instance.experience,
      'gender': instance.gender,
      'address': instance.address,
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
