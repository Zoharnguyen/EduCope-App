// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schedule-offer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ScheduleOffer _$ScheduleOfferFromJson(Map<String, dynamic> json) {
  return ScheduleOffer()
    ..overview = json['overview'] as String?
    ..detail = json['detail'] as String?;
}

Map<String, dynamic> _$ScheduleOfferToJson(ScheduleOffer instance) =>
    <String, dynamic>{
      'overview': instance.overview,
      'detail': instance.detail,
    };
