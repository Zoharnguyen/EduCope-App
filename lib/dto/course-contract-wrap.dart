import 'package:edu_cope/dto/course-contract.dart';
import 'package:json_annotation/json_annotation.dart';

part 'course-contract-wrap.g.dart';

@JsonSerializable()
class CourseContractWrap {

  String? _courseId = '';
  CourseContract? _courseContract = new CourseContract();

  String? get courseId => _courseId;

  set courseId(String? value) {
    _courseId = value;
  }

  CourseContract? get courseContract => _courseContract;

  set courseContract(CourseContract? value) {
    _courseContract = value;
  }

  CourseContractWrap();

  factory CourseContractWrap.fromJson(Map<String, dynamic> json) => _$CourseContractWrapFromJson(json);
  Map<String?, dynamic> toJson() => _$CourseContractWrapToJson(this);

}