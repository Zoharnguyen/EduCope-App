// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course-contract-wrap.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CourseContractWrap _$CourseContractWrapFromJson(Map<String, dynamic> json) {
  CourseContractWrap courseContractWrap = new CourseContractWrap();
  (json['courseId'] != null)
      ? courseContractWrap.courseId = json['courseId'] as String
      : null;
  (json['courseContract'] != null)
      ? courseContractWrap.courseContract = CourseContract.fromJson(
          json['courseContract'] as Map<String, dynamic>)
      : null;
  return courseContractWrap;
}

Map<String, dynamic> _$CourseContractWrapToJson(CourseContractWrap instance) =>
    <String, dynamic>{
      'courseId': instance.courseId,
      'courseContract': instance.courseContract,
    };
