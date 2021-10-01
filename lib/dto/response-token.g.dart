// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response-token.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TokenResponse _$TokenResponseFromJson(Map<String, dynamic> json) {
  return TokenResponse()
    ..userId = json['userId'] as String
    ..token = json['token'] as String;
}

Map<String, dynamic> _$TokenResponseToJson(TokenResponse instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'token': instance.token,
    };
