// // GENERATED CODE - DO NOT MODIFY BY HAND
//
// part of 'attendance-course.dart';
//
// // **************************************************************************
// // JsonSerializableGenerator
// // **************************************************************************
//
// AttendanceCourse _$AttendanceCourseFromJson(Map<String, dynamic> json) {
//   AttendanceCourse attendanceCourse = new AttendanceCourse();
//   (json['id'] != null) ? attendanceCourse.id = json['id'] as String : null;
//   (json['courseId'] != null)
//       ? attendanceCourse.courseId = json['courseId'] as String
//       : null;
//   (json['dateStudy'] != null)
//       ? attendanceCourse.dateStudy = json['dateStudy'] as String
//       : null;
//   (json['timeStudy'] != null)
//       ? attendanceCourse.timeStudy = json['timeStudy'] as String
//       : null;
//   (json['note'] != null)
//       ? attendanceCourse.note = json['note'] as String
//       : null;
//   (json['attendanceCourseStatus'] != null)
//       ? attendanceCourse.attendanceCourseStatus = _$enumDecode(
//           _$CourseRegisterStatusEnumMap, json['attendanceCourseStatus'])
//       : null;
//   (json['userAttendance'] != null)
//       ? attendanceCourse.userAttendance =
//           UserProfile.fromJson(json['userAttendance'] as Map<String, dynamic>)
//       : null;
//   (json['userConfirm'] != null)
//       ? attendanceCourse.userConfirm =
//           UserProfile.fromJson(json['userConfirm'] as Map<String, dynamic>)
//       : null;
//   return attendanceCourse;
// }
//
// Map<String, dynamic> _$AttendanceCourseToJson(AttendanceCourse instance) =>
//     <String, dynamic>{
//       'id': instance.id,
//       'courseId': instance.courseId,
//       'dateStudy': instance.dateStudy,
//       'timeStudy': instance.timeStudy,
//       'note': instance.note,
//       'attendanceCourseStatus':
//           _$CourseRegisterStatusEnumMap[instance.attendanceCourseStatus],
//       'userAttendance': instance.userAttendance,
//       'userConfirm': instance.userConfirm,
//     };
//
// K _$enumDecode<K, V>(
//   Map<K, V> enumValues,
//   Object? source, {
//   K? unknownValue,
// }) {
//   if (source == null) {
//     throw ArgumentError(
//       'A value must be provided. Supported values: '
//       '${enumValues.values.join(', ')}',
//     );
//   }
//
//   return enumValues.entries.singleWhere(
//     (e) => e.value == source,
//     orElse: () {
//       if (unknownValue == null) {
//         throw ArgumentError(
//           '`$source` is not one of the supported values: '
//           '${enumValues.values.join(', ')}',
//         );
//       }
//       return MapEntry(unknownValue, enumValues.values.first);
//     },
//   ).key;
// }
//
// const _$CourseRegisterStatusEnumMap = {
//   CourseRegisterStatus.PENDING: 'PENDING',
//   CourseRegisterStatus.ACCEPT: 'ACCEPT',
//   CourseRegisterStatus.REJECT: 'REJECT',
// };
