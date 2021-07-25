
import 'package:edu_cope/constant/course-register-status.dart';
import 'package:edu_cope/dto/user-profile.dart';
import 'package:json_annotation/json_annotation.dart';

part 'attendance-course.g.dart';

@JsonSerializable()
class AttendanceCourse {

  String? _id ;
  String? _courseId;
  String? _dateStudy;
  String? _timeStudy;
  String? _note;
  CourseRegisterStatus? _attendanceCourseStatus;
  UserProfile? _userAttendance;
  UserProfile? _userConfirm;

  String? get id => _id;

  set id(String? value) {
    _id = value;
  }

  String? get courseId => _courseId;

  set courseId(String? value) {
    _courseId = value;
  }

  String? get dateStudy => _dateStudy;

  set dateStudy(String? value) {
    _dateStudy = value;
  }

  String? get timeStudy => _timeStudy;

  set timeStudy(String? value) {
    _timeStudy = value;
  }

  String? get note => _note;

  set note(String? value) {
    _note = value;
  }

  CourseRegisterStatus? get attendanceCourseStatus => _attendanceCourseStatus;

  set attendanceCourseStatus(CourseRegisterStatus? value) {
    _attendanceCourseStatus = value;
  }

  UserProfile? get userAttendance => _userAttendance;

  set userAttendance(UserProfile? value) {
    _userAttendance = value;
  }

  UserProfile? get userConfirm => _userConfirm;

  set userConfirm(UserProfile? value) {
    _userConfirm = value;
  }

  AttendanceCourse();

  factory AttendanceCourse.fromJson(Map<String, dynamic> json) => _$AttendanceCourseFromJson(json);
  Map<String?, dynamic> toJson() => _$AttendanceCourseToJson(this);

}