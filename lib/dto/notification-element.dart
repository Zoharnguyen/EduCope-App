import 'package:json_annotation/json_annotation.dart';

part 'notification-element.g.dart';

@JsonSerializable()
class NotificationElement {
  String? _notificationId;
  String? _screenName;
  String? _sender;
  String? _content;
  String? _iconSenderUrl;
  String? _timeCreated;
  String? _seeStatus;
  List<String>? _screenVariables;

  String? get notificationId => _notificationId;

  set notificationId(String? value) {
    _notificationId = value;
  }

  String? get screenName => _screenName;

  set screenName(String? value) {
    _screenName = value;
  }

  String? get sender => _sender;

  set sender(String? value) {
    _sender = value;
  }

  String? get content => _content;

  set content(String? value) {
    _content = value;
  }

  String? get iconSenderUrl => _iconSenderUrl;

  set iconSenderUrl(String? value) {
    _iconSenderUrl = value;
  }

  String? get timeCreated => _timeCreated;

  set timeCreated(String? value) {
    _timeCreated = value;
  }

  String? get seeStatus => _seeStatus;

  set seeStatus(String? value) {
    _seeStatus = value;
  }

  List<String>? get screenVariables => _screenVariables;

  set screenVariables(List<String>? value) {
    _screenVariables = value;
  }

  NotificationElement();

  Map<String, dynamic> toJson() => _$NotificationElementToJson(this);

  factory NotificationElement.fromJson(Map<String, dynamic> json) =>
      _$NotificationElementFromJson(json);
}
