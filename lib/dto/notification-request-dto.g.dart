// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification-request-dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NotificationRequestDto _$NotificationRequestDtoFromJson(
    Map<String, dynamic> json) {
  return NotificationRequestDto()
    ..notificationElement = json['notificationElement'] == null
        ? null
        : NotificationElement.fromJson(
            json['notificationElement'] as Map<String, dynamic>)
    ..target = json['target'] as String?
    ..title = json['title'] as String?;
}

Map<String, dynamic> _$NotificationRequestDtoToJson(
        NotificationRequestDto instance) =>
    <String, dynamic>{
      'notificationElement': instance.notificationElement,
      'target': instance.target,
      'title': instance.title,
    };
