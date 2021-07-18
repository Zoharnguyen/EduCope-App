// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'adjust-user-profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AdjustUserProfile _$AdjustUserProfileFromJson(Map<String, dynamic> json) {
  return AdjustUserProfile()
    ..userBeAdjustedId = json['userBeAdjustedId'] as String?
    ..courseId = json['courseId'] as String?
    ..adjustId = json['adjustId'] as String?
    ..dateAdjust = json['dateAdjust'] as String?
    ..rate = json['rate'] as String?
    ..content = json['content'] as String?
    ..userAdjust = json['userAdjust'] == null
        ? null
        : UserProfile.fromJson(json['userAdjust'] as Map<String, dynamic>);
}

Map<String, dynamic> _$AdjustUserProfileToJson(AdjustUserProfile instance) =>
    <String, dynamic>{
      'userBeAdjustedId': instance.userBeAdjustedId,
      'courseId': instance.courseId,
      'adjustId': instance.adjustId,
      'dateAdjust': instance.dateAdjust,
      'rate': instance.rate,
      'content': instance.content,
      'userAdjust': instance.userAdjust,
    };
