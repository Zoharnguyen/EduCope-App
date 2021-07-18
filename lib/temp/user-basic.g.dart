// // GENERATED CODE - DO NOT MODIFY BY HAND
//
// part of 'user-basic.dart';
//
// // **************************************************************************
// // JsonSerializableGenerator
// // **************************************************************************
//
// UserBasic _$UserBasicFromJson(Map<String, dynamic> json) {
//   UserBasic userBasic = new UserBasic();
//   (json['gmail'] != null) ? userBasic.gmail = json['gmail'] as String : null;
//   (json['password'] != null) ? userBasic.password = json['password'] as String : null;
//   (json['userType'] != null) ? userBasic.userType = _$enumDecode(_$UserTypeEnumMap, json['userType']) : null;
//   return userBasic;
// }
//
// Map<String, dynamic> _$UserBasicToJson(UserBasic instance) => <String, dynamic>{
//   'gmail': instance.gmail,
//   'password': instance.password,
//   'userType': _$UserTypeEnumMap[instance.userType],
// };
//
// K _$enumDecode<K, V>(
//     Map<K, V> enumValues,
//     Object? source, {
//       K? unknownValue,
//     }) {
//   if (source == null) {
//     throw ArgumentError(
//       'A value must be provided. Supported values: '
//           '${enumValues.values.join(', ')}',
//     );
//   }
//
//   return enumValues.entries.singleWhere(
//         (e) => e.value == source,
//     orElse: () {
//       if (unknownValue == null) {
//         throw ArgumentError(
//           '`$source` is not one of the supported values: '
//               '${enumValues.values.join(', ')}',
//         );
//       }
//       return MapEntry(unknownValue, enumValues.values.first);
//     },
//   ).key;
// }
//
// const _$UserTypeEnumMap = {
//   UserType.TEACHER: 'TEACHER',
//   UserType.STUDENTPARENT: 'STUDENTPARENT',
// };
