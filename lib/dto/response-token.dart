
import 'package:json_annotation/json_annotation.dart';

part 'response-token.g.dart';

@JsonSerializable()
class TokenResponse {

  late String _token;

  String get token => _token;

  set token(String value) {
    _token = value;
  }

  TokenResponse();

  factory TokenResponse.fromJson(Map<String, dynamic> json) => _$TokenResponseFromJson(json);
  Map<String, dynamic> toJson() => _$TokenResponseToJson(this);

}