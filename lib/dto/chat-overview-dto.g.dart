// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat-overview-dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChatOverviewDto _$ChatOverviewDtoFromJson(Map<String, dynamic> json) {
  return ChatOverviewDto()
    ..chatId = json['chatId'] as String?
    ..partnerName = json['partnerName'] as String?
    ..partnerImage = json['partnerImage'] as String?
    ..ownerId = json['ownerId'] as String?
    ..messageContent = json['messageContent'] as String?
    ..messageStatus = json['messageStatus'] as String?
    ..timeSend = json['timeSend'] as String?
    ..partnerStatus = json['partnerStatus'] as String?
    ..partnerId = json['partnerId'] as String?;
}

Map<String, dynamic> _$ChatOverviewDtoToJson(ChatOverviewDto instance) =>
    <String, dynamic>{
      'chatId': instance.chatId,
      'partnerName': instance.partnerName,
      'partnerImage': instance.partnerImage,
      'ownerId': instance.ownerId,
      'messageContent': instance.messageContent,
      'messageStatus': instance.messageStatus,
      'timeSend': instance.timeSend,
      'partnerStatus': instance.partnerStatus,
      'partnerId': instance.partnerId,
    };
