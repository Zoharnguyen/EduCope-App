// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course-contract.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CourseContract _$CourseContractFromJson(Map<String, dynamic> json) {
  return CourseContract()
    ..courseContractId = json['courseContractId'] as String
    ..subject = json['subject'] as String
    ..salary = json['salary'] as String
    ..paymentDate = json['paymentDate'] as String
    ..formatLearning = json['formatLearning'] as String
    ..note = json['note'] as String
    ..userProfileCreate =
        UserProfile.fromJson(json['userProfileCreate'] as Map<String, dynamic>)
    ..userProfileRegistry = UserProfile.fromJson(
        json['userProfileRegistry'] as Map<String, dynamic>)
    ..courseRegisterStatus = _$enumDecode(
        _$CourseRegisterStatusEnumMap, json['courseRegisterStatus']);
}

Map<String, dynamic> _$CourseContractToJson(CourseContract instance) =>
    <String, dynamic>{
      'courseContractId': instance.courseContractId,
      'subject': instance.subject,
      'salary': instance.salary,
      'paymentDate': instance.paymentDate,
      'formatLearning': instance.formatLearning,
      'note': instance.note,
      'userProfileCreate': instance.userProfileCreate,
      'userProfileRegistry': instance.userProfileRegistry,
      'courseRegisterStatus':
          _$CourseRegisterStatusEnumMap[instance.courseRegisterStatus],
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

const _$CourseRegisterStatusEnumMap = {
  CourseRegisterStatus.PENDING: 'PENDING',
  CourseRegisterStatus.ACCEPT: 'ACCEPT',
  CourseRegisterStatus.REJECT: 'REJECT',
};
