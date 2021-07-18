import 'package:edu_cope/constant/user-type.dart';
import 'package:edu_cope/dto/user-profile.dart';
import 'package:json_annotation/json_annotation.dart';
import 'adjust-user-profile.dart';

part 'user-information.g.dart';

@JsonSerializable()
class UserInformation extends UserProfile {
  
  String? _certificate = '';
  String? _DoB = '';
  String? _experience = '';
  String? _gender = '';
  String? _address = '';

  String? get certificate => _certificate;

  set certificate(String? value) {
    _certificate = value;
  }

  String? get DoB => _DoB;

  set DoB(String? value) {
    _DoB = value;
  }

  String? get experience => _experience;

  set experience(String? value) {
    _experience = value;
  }

  String? get gender => _gender;

  set gender(String? value) {
    _gender = value;
  }

  String? get address => _address;

  set address(String? value) {
    _address = value;
  }

  UserInformation();

  factory UserInformation.fromJson(Map<String, dynamic> json) =>
      _$UserInformationFromJson(json);

  Map<String, dynamic> toJson() => _$UserInformationToJson(this);

}
