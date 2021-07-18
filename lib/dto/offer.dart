
import 'package:edu_cope/constant/course-type.dart';
import 'package:edu_cope/constant/offer-type.dart';
import 'package:edu_cope/dto/course-contract.dart';
import 'package:edu_cope/dto/course-status.dart';
import 'package:edu_cope/dto/schedule-offer.dart';
import 'package:edu_cope/dto/user-profile.dart';
import 'package:json_annotation/json_annotation.dart';

part 'offer.g.dart';

@JsonSerializable()
class Offer {

  String _id = '';

  OfferType _offerType = OfferType.TEACHER;

  String _subject = '';

  String _level = '';

  String _formatLearning = '';

  String _salary = '';

  String _introductionAuthorOffer = '';

  String _note = '';

  UserProfile _profileAuthor = new UserProfile();

  ScheduleOffer _scheduleOffer = new ScheduleOffer();

  String _preferAddress = '';

  List<CourseStatus> _courseStatus = <CourseStatus>[];

  List<CourseContract> _courseContract = <CourseContract>[];

  List<UserProfile> _memberClassList = <UserProfile>[];

  CourseType _courseType = CourseType.OPENING;

  CourseType get courseType => _courseType;

  set courseType(CourseType value) {
    _courseType = value;
  }

  List<UserProfile> get memberClassList => _memberClassList;

  set memberClassList(List<UserProfile> value) {
    _memberClassList = value;
  }

  List<CourseStatus> get courseStatusList => _courseStatus;

  set courseStatusList(List<CourseStatus> value) {
    _courseStatus = value;
  }

  List<CourseStatus> get courseStatus => _courseStatus;

  set courseStatus(List<CourseStatus> value) {
    _courseStatus = value;
  }

  String get preferAddress => _preferAddress;

  set preferAddress(String value) {
    _preferAddress = value;
  }

  String get id => _id;

  set id(String value) {
    _id = value;
  }

  OfferType get offerType => _offerType;

  set offerType(OfferType value) {
    _offerType = value;
  }

  String get subject => _subject;

  set subject(String value) {
    _subject = value;
  }

  String get level => _level;

  set level(String value) {
    _level = value;
  }

  String get formatLearning => _formatLearning;

  set formatLearning(String value) {
    _formatLearning = value;
  }

  String get salary => _salary;

  set salary(String value) {
    _salary = value;
  }

  String get introductionAuthorOffer => _introductionAuthorOffer;

  set introductionAuthorOffer(String value) {
    _introductionAuthorOffer = value;
  }

  String get note => _note;

  set note(String value) {
    _note = value;
  }

  UserProfile get profileAuthor => _profileAuthor;

  set profileAuthor(UserProfile value) {
    _profileAuthor = value;
  }

  ScheduleOffer get scheduleOffer => _scheduleOffer;

  set scheduleOffer(ScheduleOffer value) {
    _scheduleOffer = value;
  }

  Offer();
  Offer.withScheduleAndUserProfile(ScheduleOffer scheduleOffer, UserProfile userProfile){
    _scheduleOffer = scheduleOffer;
    _profileAuthor = userProfile;
  }

  factory Offer.fromJson(Map<String, dynamic> json) => _$OfferFromJson(json);
  Map<String, dynamic> toJson() => _$OfferToJson(this);

  List<CourseContract> get courseContract => _courseContract;

  set courseContract(List<CourseContract> value) {
    _courseContract = value;
  }
}