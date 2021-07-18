// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course-contract-wrap.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CourseContractWrap _$CourseContractWrapFromJson(Map<String, dynamic> json) {
  return CourseContractWrap()
    ..courseId = json['courseId'] as String?
    ..courseContract = json['courseContract'] == null
        ? null
        : CourseContract.fromJson(
            json['courseContract'] as Map<String, dynamic>);
}

Map<String, dynamic> _$CourseContractWrapToJson(CourseContractWrap instance) =>
    <String, dynamic>{
      'courseId': instance.courseId,
      'courseContract': instance.courseContract,
    };
