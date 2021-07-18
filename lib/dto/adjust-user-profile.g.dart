// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'adjust-user-profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AdjustUserProfile _$AdjustUserProfileFromJson(Map<String, dynamic> json) {
  AdjustUserProfile adjustUserProfile = new AdjustUserProfile();
  (json['adjustId'] != null)
      ? adjustUserProfile._adjustId = json['adjustId'] as String
      : null;
  (json['dateAdjust'] != null)
      ? adjustUserProfile.dateAdjust = json['dateAdjust'] as String
      : null;
  (json['rate'] != null)
      ? adjustUserProfile.rate = json['rate'] as String
      : null;
  (json['content'] != null)
      ? adjustUserProfile.content = json['content'] as String
      : null;
  (json['userAdjust'] != null)
      ? adjustUserProfile.userAdjust =
          UserProfile.fromJson(json['userAdjust'] as Map<String, dynamic>)
      : null;
  (json['userBeAdjustedId'] != null)
      ? adjustUserProfile.userBeAdjustedId = json['userBeAdjustedId'] as String
      : null;
  (json['courseId'] != null)
      ? adjustUserProfile.courseId = json['courseId'] as String
      : null;
  return adjustUserProfile;
}

Map<String, dynamic> _$AdjustUserProfileToJson(AdjustUserProfile instance) =>
    <String, dynamic>{
      'adjustId': instance.adjustId,
      'dateAdjust': instance.dateAdjust,
      'rate': instance.rate,
      'content': instance.content,
      'userAdjust': instance.userAdjust,
      'userBeAdjustedId': instance.userBeAdjustedId,
      'courseId': instance.courseId,
    };
