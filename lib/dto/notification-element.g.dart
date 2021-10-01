// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification-element.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NotificationElement _$NotificationElementFromJson(Map<String, dynamic> json) {
  return NotificationElement()
    ..notificationId = json['notificationId'] as String?
    ..screenName = json['screenName'] as String?
    ..sender = json['sender'] as String?
    ..content = json['content'] as String?
    ..iconSenderUrl = json['iconSenderUrl'] as String?
    ..timeCreated = json['timeCreated'] as String?
    ..seeStatus = json['seeStatus'] as String?
    ..screenVariables = (json['screenVariables'] as List<dynamic>?)
        ?.map((e) => e as String)
        .toList();
}

Map<String, dynamic> _$NotificationElementToJson(
        NotificationElement instance) =>
    <String, dynamic>{
      'notificationId': instance.notificationId,
      'screenName': instance.screenName,
      'sender': instance.sender,
      'content': instance.content,
      'iconSenderUrl': instance.iconSenderUrl,
      'timeCreated': instance.timeCreated,
      'seeStatus': instance.seeStatus,
      'screenVariables': instance.screenVariables,
    };
