// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course-status.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CourseStatus _$CourseStatusFromJson(Map<String, dynamic> json) {
  return CourseStatus()
    ..courseStatusId = json['courseStatusId'] as String?
    ..userProfile = json['userProfile'] == null
        ? null
        : UserProfile.fromJson(json['userProfile'] as Map<String, dynamic>)
    ..courseRegisterStatus = _$enumDecodeNullable(
        _$CourseRegisterStatusEnumMap, json['courseRegisterStatus'])
    ..reason = json['reason'] as String?;
}

Map<String, dynamic> _$CourseStatusToJson(CourseStatus instance) =>
    <String, dynamic>{
      'courseStatusId': instance.courseStatusId,
      'userProfile': instance.userProfile,
      'courseRegisterStatus':
          _$CourseRegisterStatusEnumMap[instance.courseRegisterStatus],
      'reason': instance.reason,
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

const _$CourseRegisterStatusEnumMap = {
  CourseRegisterStatus.PENDING: 'PENDING',
  CourseRegisterStatus.ACCEPT: 'ACCEPT',
  CourseRegisterStatus.REJECT: 'REJECT',
};
