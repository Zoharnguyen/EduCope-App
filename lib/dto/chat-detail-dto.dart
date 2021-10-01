import 'package:json_annotation/json_annotation.dart';

part 'chat-detail-dto.g.dart';

@JsonSerializable()
class ChatDetailDto{

  String? _id;
  String? _chatId;
  String? _senderId;
  String? _receiverId;
  String? _timeChat;
  String? _messageContent;

  String? get chatId => _chatId;

  String? get id => _id;

  set id(String? value) {
    _id = value;
  }

  set chatId(String? value) {
    _chatId = value;
  }

  String? get senderId => _senderId;

  set senderId(String? value) {
    _senderId = value;
  }

  String? get receiverId => _receiverId;

  set receiverId(String? value) {
    _receiverId = value;
  }

  String? get timeChat => _timeChat;

  set timeChat(String? value) {
    _timeChat = value;
  }

  String? get messageContent => _messageContent;

  set messageContent(String? value) {
    _messageContent = value;
  }

  ChatDetailDto();

  factory ChatDetailDto.fromJson(Map<String, dynamic> json) => _$ChatDetailDtoFromJson(json);
  Map<String?, dynamic> toJson() => _$ChatDetailDtoToJson(this);

}