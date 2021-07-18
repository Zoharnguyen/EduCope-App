
import 'package:edu_cope/constant/course-register-status.dart';
import 'package:edu_cope/dto/user-profile.dart';
import 'package:json_annotation/json_annotation.dart';

part 'course-contract.g.dart';

@JsonSerializable()
class CourseContract {

  String? _courseContractId = '';
  String? _subject = '';
  String? _salary = '';
  String? _paymentDate = '';
  String? _formatLearning = '';
  String? _note = '';
  UserProfile? _userProfileCreate = new UserProfile();
  UserProfile? _userProfileRegistry = new UserProfile();
  CourseRegisterStatus? _courseRegisterStatus = CourseRegisterStatus.PENDING;

  String? get courseContractId => _courseContractId;

  set courseContractId(String? value) {
    _courseContractId = value;
  }

  String? get subject => _subject;

  set subject(String? value) {
    _subject = value;
  }

  String? get salary => _salary;

  set salary(String? value) {
    _salary = value;
  }

  String? get paymentDate => _paymentDate;

  set paymentDate(String? value) {
    _paymentDate = value;
  }

  String? get formatLearning => _formatLearning;

  set formatLearning(String? value) {
    _formatLearning = value;
  }

  String? get note => _note;

  set note(String? value) {
    _note = value;
  }

  UserProfile? get userProfileCreate => _userProfileCreate;

  set userProfileCreate(UserProfile? value) {
    _userProfileCreate = value;
  }

  UserProfile? get userProfileRegistry => _userProfileRegistry;

  set userProfileRegistry(UserProfile? value) {
    _userProfileRegistry = value;
  }

  CourseRegisterStatus? get courseRegisterStatus => _courseRegisterStatus;

  set courseRegisterStatus(CourseRegisterStatus? value) {
    _courseRegisterStatus = value;
  }

  CourseContract();

  factory CourseContract.fromJson(Map<String, dynamic> json) => _$CourseContractFromJson(json);
  Map<String?, dynamic> toJson() => _$CourseContractToJson(this);

}