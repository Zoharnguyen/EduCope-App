// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat-detail-dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChatDetailDto _$ChatDetailDtoFromJson(Map<String, dynamic> json) {
  return ChatDetailDto()
    ..chatId = json['chatId'] as String?
    ..id = json['id'] as String?
    ..senderId = json['senderId'] as String?
    ..receiverId = json['receiverId'] as String?
    ..timeChat = json['timeChat'] as String?
    ..messageContent = json['messageContent'] as String?;
}

Map<String, dynamic> _$ChatDetailDtoToJson(ChatDetailDto instance) =>
    <String, dynamic>{
      'chatId': instance.chatId,
      'id': instance.id,
      'senderId': instance.senderId,
      'receiverId': instance.receiverId,
      'timeChat': instance.timeChat,
      'messageContent': instance.messageContent,
    };
