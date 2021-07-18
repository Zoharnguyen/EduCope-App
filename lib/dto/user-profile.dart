
import 'package:edu_cope/constant/user-type.dart';
import 'package:edu_cope/dto/adjust-user-profile.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user-profile.g.dart';

@JsonSerializable()
class UserProfile {
  
  String? _id = '';
  String? _fullName = '';
  String? _rate = '';
  String? _introduction = '';
  String? _urlImageProfile = '';
  String? _phoneNumber = '';
  UserType? _userType = UserType.TEACHER;
  List<AdjustUserProfile>? _adjustUserProfileList = <AdjustUserProfile>[];
  List<AdjustUserProfile>? get adjustUserProfileList => _adjustUserProfileList;
  String? _adjustStatus = 'false';

  String? get adjustStatus => _adjustStatus;

  set adjustStatus(String? value) {
    _adjustStatus = value;
  }

  set adjustUserProfileList(List<AdjustUserProfile>? value) {
    _adjustUserProfileList = value;
  }

  UserType? get userType => _userType;

  set userType(UserType? value) {
    _userType = value;
  }

  String? get id => _id;

  set id(String? value) {
    _id = value;
  }

  String? get fullName => _fullName;

  String? get phoneNumber => _phoneNumber;

  set phoneNumber(String? value) {
    _phoneNumber = value;
  }

  String? get urlImageProfile => _urlImageProfile;

  set urlImageProfile(String? value) {
    _urlImageProfile = value;
  }

  String? get introduction => _introduction;

  set introduction(String? value) {
    _introduction = value;
  }

  String? get rate => _rate;

  set rate(String? value) {
    _rate = value;
  }

  set fullName(String? value) {
    _fullName = value;
  }

  UserProfile();

  factory UserProfile.fromJson(Map<String, dynamic> json) => _$UserProfileFromJson(json);
  Map<String, dynamic> toJson() => _$UserProfileToJson(this);

}