
import 'package:edu_cope/constant/course-register-status.dart';
import 'package:edu_cope/dto/user-profile.dart';
import 'package:json_annotation/json_annotation.dart';

part 'course-status.g.dart';

@JsonSerializable()
class CourseStatus {
  String? _courseStatusId = '';
  UserProfile? _userProfile = new UserProfile();
  CourseRegisterStatus? _courseRegisterStatus = CourseRegisterStatus.ACCEPT;
  String? _reason = '';

  String? get courseStatusId => _courseStatusId;

  set courseStatusId(String? value) {
    _courseStatusId = value;
  }

  UserProfile? get userProfile => _userProfile;

  set userProfile(UserProfile? value) {
    _userProfile = value;
  }

  CourseRegisterStatus? get courseRegisterStatus => _courseRegisterStatus;

  set courseRegisterStatus(CourseRegisterStatus? value) {
    _courseRegisterStatus = value;
  }

  String? get reason => _reason;

  set reason(String? value) {
    _reason = value;
  }

  CourseStatus();

  factory CourseStatus.fromJson(Map<String, dynamic> json) => _$CourseStatusFromJson(json);
  Map<String?, dynamic> toJson() => _$CourseStatusToJson(this);

}