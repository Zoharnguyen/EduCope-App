// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'offer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Offer _$OfferFromJson(Map<String, dynamic> json) {
  Offer offer = new Offer();
  // ignore: unnecessary_statements
  (json['preferAddress'] != null)
      ? offer.preferAddress = json['preferAddress'] as String
      : null;
  (json['id'] != null) ? offer.id = json['id'] as String : null;
  (json['offerType'] != null)
      ? offer.offerType = _$enumDecode(_$OfferTypeEnumMap, json['offerType'])
      : null;
  (json['subject'] != null) ? offer.subject = json['subject'] as String : null;
  (json['level'] != null) ? offer.level = json['level'] as String : null;
  (json['formatLearning'] != null)
      ? offer.formatLearning = json['formatLearning'] as String
      : null;
  (json['salary'] != null) ? offer.salary = json['salary'] as String : null;
  (json['introductionAuthorOffer'] != null)
      ? offer.introductionAuthorOffer =
  json['introductionAuthorOffer'] as String
      : null;
  (json['note'] != null) ? offer.note = json['note'] as String : null;
  (json['profileAuthor'] != null)
      ? offer.profileAuthor =
      UserProfile.fromJson(json['profileAuthor'] as Map<String, dynamic>)
      : null;
  (json['scheduleOffer'] != null)
      ? offer.scheduleOffer =
      ScheduleOffer.fromJson(json['scheduleOffer'] as Map<String, dynamic>)
      : null;
  (json['courseStatus'] != null)
      ? offer.courseStatus = (json['courseStatusList'] as List<dynamic>)
      .map((e) => CourseStatus.fromJson(e as Map<String, dynamic>))
      .toList()
      : null;
  (json['courseContract'] != null)
      ? offer.courseContract = (json['courseContract'] as List<dynamic>)
      .map((e) => CourseContract.fromJson(e as Map<String, dynamic>))
      .toList()
      : null;
  (json['memberClassList'] != null)
      ? offer.memberClassList = (json['memberClassList'] as List<dynamic>)
      .map((e) => UserProfile.fromJson(e as Map<String, dynamic>))
      .toList()
      : null;
  (json['courseType'] != null)
      ? offer.courseType = _$enumDecode(_$CourseTypeEnumMap, json['courseType'])
      : null;
  return offer;
}

Map<String, dynamic> _$OfferToJson(Offer instance) => <String, dynamic>{
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
  'courseType' : _$CourseTypeEnumMap[instance.courseType]
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

const _$OfferTypeEnumMap = {
  OfferType.TEACHER: 'TEACHER',
  OfferType.COURSE: 'COURSE',
};

const _$CourseTypeEnumMap = {
  CourseType.END: 'END',
  CourseType.LEARNING: 'LEARNING',
  CourseType.OPENING: 'OPENING',
};

