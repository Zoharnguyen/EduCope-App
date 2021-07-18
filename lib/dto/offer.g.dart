// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'offer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Offer _$OfferFromJson(Map<String, dynamic> json) {
  return Offer()
    ..courseType = _$enumDecode(_$CourseTypeEnumMap, json['courseType'])
    ..memberClassList = (json['memberClassList'] as List<dynamic>)
        .map((e) => UserProfile.fromJson(e as Map<String, dynamic>))
        .toList()
    ..courseStatusList = (json['courseStatusList'] as List<dynamic>)
        .map((e) => CourseStatus.fromJson(e as Map<String, dynamic>))
        .toList()
    ..courseStatus = (json['courseStatus'] as List<dynamic>)
        .map((e) => CourseStatus.fromJson(e as Map<String, dynamic>))
        .toList()
    ..preferAddress = json['preferAddress'] as String
    ..id = json['id'] as String
    ..offerType = _$enumDecode(_$OfferTypeEnumMap, json['offerType'])
    ..subject = json['subject'] as String
    ..level = json['level'] as String
    ..formatLearning = json['formatLearning'] as String
    ..salary = json['salary'] as String
    ..introductionAuthorOffer = json['introductionAuthorOffer'] as String
    ..note = json['note'] as String
    ..profileAuthor =
        UserProfile.fromJson(json['profileAuthor'] as Map<String, dynamic>)
    ..scheduleOffer =
        ScheduleOffer.fromJson(json['scheduleOffer'] as Map<String, dynamic>)
    ..courseContract = (json['courseContract'] as List<dynamic>)
        .map((e) => CourseContract.fromJson(e as Map<String, dynamic>))
        .toList();
}

Map<String, dynamic> _$OfferToJson(Offer instance) => <String, dynamic>{
      'courseType': _$CourseTypeEnumMap[instance.courseType],
      'memberClassList': instance.memberClassList,
      'courseStatusList': instance.courseStatusList,
      'courseStatus': instance.courseStatus,
      'preferAddress': instance.preferAddress,
      'id': instance.id,
      'offerType': _$OfferTypeEnumMap[instance.offerType],
      'subject': instance.subject,
      'level': instance.level,
      'formatLearning': instance.formatLearning,
      'salary': instance.salary,
      'introductionAuthorOffer': instance.introductionAuthorOffer,
      'note': instance.note,
      'profileAuthor': instance.profileAuthor,
      'scheduleOffer': instance.scheduleOffer,
      'courseContract': instance.courseContract,
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

const _$CourseTypeEnumMap = {
  CourseType.LEARNING: 'LEARNING',
  CourseType.OPENING: 'OPENING',
  CourseType.END: 'END',
};

const _$OfferTypeEnumMap = {
  OfferType.TEACHER: 'TEACHER',
  OfferType.COURSE: 'COURSE',
};
