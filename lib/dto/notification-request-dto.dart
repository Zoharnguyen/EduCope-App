import 'package:edu_cope/dto/notification-element.dart';
import 'package:json_annotation/json_annotation.dart';

part 'notification-request-dto.g.dart';

@JsonSerializable()
class NotificationRequestDto {
  String? _target;
  String? _title;
  NotificationElement? _notificationElement;

  NotificationElement? get notificationElement => _notificationElement;

  set notificationElement(NotificationElement? value) {
    _notificationElement = value;
  }

  String? get target => _target;

  set target(String? value) {
    _target = value;
  }

  String? get title => _title;

  set title(String? value) {
    _title = value;
  }

  NotificationRequestDto();

  Map<String?, dynamic> toJson() => _$notificationRequestDtoToJson(this);

  factory NotificationRequestDto.fromJson(Map<String, dynamic> json) =>
      _$notificationRequestDtoFromJson(json);
}
