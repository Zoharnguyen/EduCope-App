import 'package:edu_cope/constant/user-type.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user-basic.g.dart';

@JsonSerializable()
class UserBasic {

  String _gmail = '';
  String _password = '';
  UserType _userType = UserType.TEACHER;

  String get gmail => _gmail;

  set gmail(String value) {
    _gmail = value;
  }

  String get password => _password;

  set password(String value) {
    _password = value;
  }

  UserType get userType => _userType;

  set userType(UserType value) {
    _userType = value;
  }

  UserBasic();

  factory UserBasic.fromJson(Map<String, dynamic> json) => _$UserBasicFromJson(json);
  Map<String, dynamic> toJson() => _$UserBasicToJson(this);

}