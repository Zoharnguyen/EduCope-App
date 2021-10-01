import 'package:json_annotation/json_annotation.dart';

part 'chat-overview-dto.g.dart';

@JsonSerializable()
class ChatOverviewDto{

  String? _chatId;
  String? _partnerName;
  String? _partnerImage;
  String? _ownerId;
  String? _messageContent;
  String? _messageStatus;
  String? _timeSend;
  String? _partnerStatus;
  String? _partnerId;

  String? get chatId => _chatId;

  set chatId(String? value) {
    _chatId = value;
  }

  String? get partnerName => _partnerName;

  set partnerName(String? value) {
    _partnerName = value;
  }

  String? get partnerImage => _partnerImage;

  set partnerImage(String? value) {
    _partnerImage = value;
  }

  String? get ownerId => _ownerId;

  set ownerId(String? value) {
    _ownerId = value;
  }

  String? get messageContent => _messageContent;

  set messageContent(String? value) {
    _messageContent = value;
  }

  String? get messageStatus => _messageStatus;

  set messageStatus(String? value) {
    _messageStatus = value;
  }

  String? get timeSend => _timeSend;

  set timeSend(String? value) {
    _timeSend = value;
  }

  String? get partnerStatus => _partnerStatus;

  set partnerStatus(String? value) {
    _partnerStatus = value;
  }

  String? get partnerId => _partnerId;

  set partnerId(String? value) {
    _partnerId = value;
  }

  ChatOverviewDto();

  factory ChatOverviewDto.fromJson(Map<String, dynamic> json) => _$ChatOverviewDtoFromJson(json);
  Map<String, dynamic> toJson() => _$ChatOverviewDtoToJson(this);
}