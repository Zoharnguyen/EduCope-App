// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'offer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Offer _$OfferFromJson(Map<String, dynamic> json) {
  return Offer()
    ..id = json['id'] as String?
    ..offerType = _$enumDecodeNullable(_$OfferTypeEnumMap, json['offerType'])
    ..subject = json['subject'] as String?
    ..level = json['level'] as String?
    ..formatLearning = json['formatLearning'] as String?
    ..salary = json['salary'] as String?
    ..introductionAuthorOffer = json['introductionAuthorOffer'] as String?
    ..note = json['note'] as String?
    ..profileAuthor = json['profileAuthor'] == null
        ? null
        : UserProfile.fromJson(json['profileAuthor'] as Map<String, dynamic>)
    ..scheduleOffer = json['scheduleOffer'] == null
        ? null
        : ScheduleOffer.fromJson(json['scheduleOffer'] as Map<String, dynamic>)
    ..preferAddress = json['preferAddress'] as String?
    ..courseStatus = (json['courseStatus'] as List<dynamic>?)
        ?.map((e) => CourseStatus.fromJson(e as Map<String, dynamic>))
        .toList()
    ..courseContract = (json['courseContract'] as List<dynamic>?)
        ?.map((e) => CourseContract.fromJson(e as Map<String, dynamic>))
        .toList()
    ..memberClassList = (json['memberClassList'] as List<dynamic>?)
        ?.map((e) => UserProfile.fromJson(e as Map<String, dynamic>))
        .toList()
    ..courseType =
        _$enumDecodeNullable(_$CourseTypeEnumMap, json['courseType']);
}

Map<String, dynamic> _$OfferToJson(Offer instance) => <String, dynamic>{
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
      'preferAddress': instance.preferAddress,
      'courseStatus': instance.courseStatus,
      'courseContract': instance.courseContract,
      'memberClassList': instance.memberClassList,
      'courseType': _$CourseTypeEnumMap[instance.courseType],
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

const _$OfferTypeEnumMap = {
  OfferType.TEACHER: 'TEACHER',
  OfferType.COURSE: 'COURSE',
};

const _$CourseTypeEnumMap = {
  CourseType.LEARNING: 'LEARNING',
  CourseType.OPENING: 'OPENING',
  CourseType.END: 'END',
};
