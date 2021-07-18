// // GENERATED CODE - DO NOT MODIFY BY HAND
//
// part of 'course-contract.dart';
//
// // **************************************************************************
// // JsonSerializableGenerator
// // **************************************************************************
//
// CourseContract _$CourseContractFromJson(Map<String, dynamic> json) {
//   CourseContract courseContract = new CourseContract();
//   (json['courseContractId'] != null)
//       ? courseContract.courseContractId = json['courseContractId'] as String
//       : null;
//   (json['subject'] != null)
//       ? courseContract.subject = json['subject'] as String
//       : null;
//   (json['salary'] != null)
//       ? courseContract.salary = json['salary'] as String
//       : null;
//   (json['paymentDate'] != null)
//       ? courseContract.paymentDate = json['paymentDate'] as String
//       : null;
//   (json['formatLearning'] != null)
//       ? courseContract.formatLearning = json['formatLearning'] as String
//       : null;
//   (json['note'] != null) ? courseContract.note = json['note'] as String : null;
//   (json['userProfileCreate'] != null)
//       ? courseContract.userProfileCreate = UserProfile.fromJson(
//           json['userProfileCreate'] as Map<String, dynamic>)
//       : null;
//   (json['userProfileRegistry'] != null)
//       ? courseContract.userProfileRegistry = UserProfile.fromJson(
//           json['userProfileRegistry'] as Map<String, dynamic>)
//       : null;
//   (json['courseRegisterStatus'] != null)
//       ? courseContract.courseRegisterStatus = _$enumDecode(
//           _$CourseRegisterStatusEnumMap, json['courseRegisterStatus'])
//       : null;
//   return courseContract;
// }
//
// Map<String, dynamic> _$CourseContractToJson(CourseContract instance) =>
//     <String, dynamic>{
//       'courseContractId': instance.courseContractId,
//       'subject': instance.subject,
//       'salary': instance.salary,
//       'paymentDate': instance.paymentDate,
//       'formatLearning': instance.formatLearning,
//       'note': instance.note,
//       'userProfileCreate': instance.userProfileCreate,
//       'userProfileRegistry': instance.userProfileRegistry,
//       'courseRegisterStatus':
//           _$CourseRegisterStatusEnumMap[instance.courseRegisterStatus],
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
