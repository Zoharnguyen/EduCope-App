// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course-status-wrap.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CourseStatusWrap _$CourseStatusWrapFromJson(Map<String, dynamic> json) {
  return CourseStatusWrap()
    ..courseId = json['courseId'] as String?
    ..courseStatus = json['courseStatus'] == null
        ? null
        : CourseStatus.fromJson(json['courseStatus'] as Map<String, dynamic>);
}

Map<String, dynamic> _$CourseStatusWrapToJson(CourseStatusWrap instance) =>
    <String, dynamic>{
      'courseId': instance.courseId,
      'courseStatus': instance.courseStatus,
    };
