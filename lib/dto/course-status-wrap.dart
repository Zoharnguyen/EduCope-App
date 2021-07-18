import 'package:edu_cope/dto/course-status.dart';
import 'package:json_annotation/json_annotation.dart';

part 'course-status-wrap.g.dart';

@JsonSerializable()
class CourseStatusWrap {
  String _courseId = '';
  CourseStatus _courseStatus = new CourseStatus();

  String get courseId => _courseId;

  set courseId(String value) {
    _courseId = value;
  }

  CourseStatus get courseStatus => _courseStatus;

  set courseStatus(CourseStatus value) {
    _courseStatus = value;
  }

  CourseStatusWrap();

  factory CourseStatusWrap.fromJson(Map<String, dynamic> json) =>
      _$CourseStatusWrapFromJson(json);

  Map<String, dynamic> toJson() => _$CourseStatusWrapToJson(this);
}
