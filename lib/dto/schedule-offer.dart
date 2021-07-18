
import 'package:json_annotation/json_annotation.dart';

part 'schedule-offer.g.dart';

@JsonSerializable()
class ScheduleOffer {

  String _overview = '';

  String _detail = '';

  String get overview => _overview;

  set overview(String value) {
    _overview = value;
  }

  String get detail => _detail;

  set detail(String value) {
    _detail = value;
  }

  ScheduleOffer();

  factory ScheduleOffer.fromJson(Map<String, dynamic> json) => _$ScheduleOfferFromJson(json);
  Map<String, dynamic> toJson() => _$ScheduleOfferToJson(this);

}