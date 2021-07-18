// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response-token.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TokenResponse _$TokenResponseFromJson(Map<String, dynamic> json) {
  TokenResponse tokenResponse = new TokenResponse();
  (json['token'] != null) ? tokenResponse.token = json['token'] as String : null;
  return tokenResponse;
}

Map<String, dynamic> _$TokenResponseToJson(TokenResponse instance) =>
    <String, dynamic>{
      'token': instance.token,
    };
