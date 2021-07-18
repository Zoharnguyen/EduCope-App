// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attendance-course.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AttendanceCourse _$AttendanceCourseFromJson(Map<String, dynamic> json) {
  return AttendanceCourse()
    ..id = json['id'] as String?
    ..courseId = json['courseId'] as String?
    ..dateStudy = json['dateStudy'] as String?
    ..timeStudy = json['timeStudy'] as String?
    ..note = json['note'] as String?
    ..attendanceCourseStatus = _$enumDecodeNullable(
        _$CourseRegisterStatusEnumMap, json['attendanceCourseStatus'])
    ..userAttendance = json['userAttendance'] == null
        ? null
        : UserProfile.fromJson(json['userAttendance'] as Map<String, dynamic>)
    ..userConfirm = json['userConfirm'] == null
        ? null
        : UserProfile.fromJson(json['userConfirm'] as Map<String, dynamic>);
}

Map<String, dynamic> _$AttendanceCourseToJson(AttendanceCourse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'courseId': instance.courseId,
      'dateStudy': instance.dateStudy,
      'timeStudy': instance.timeStudy,
      'note': instance.note,
      'attendanceCourseStatus':
          _$CourseRegisterStatusEnumMap[instance.attendanceCourseStatus],
      'userAttendance': instance.userAttendance,
      'userConfirm': instance.userConfirm,
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
