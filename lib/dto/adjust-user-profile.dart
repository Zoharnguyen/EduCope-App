import 'package:edu_cope/dto/user-profile.dart';
import 'package:json_annotation/json_annotation.dart';

part 'adjust-user-profile.g.dart';

@JsonSerializable()
class AdjustUserProfile {
  String? _adjustId = '';
  String? _dateAdjust = '';
  String? _rate = '';
  String? _content = '';
  UserProfile? _userAdjust = new UserProfile();
  String? _userBeAdjustedId = '';
  String? _courseId = '';

  String? get userBeAdjustedId => _userBeAdjustedId;

  set userBeAdjustedId(String? value) {
    _userBeAdjustedId = value;
  }

  String? get courseId => _courseId;

  set courseId(String? value) {
    _courseId = value;
  }

  String? get adjustId => _adjustId;

  set adjustId(String? value) {
    _adjustId = value;
  }

  String? get dateAdjust => _dateAdjust;

  set dateAdjust(String? value) {
    _dateAdjust = value;
  }

  String? get rate => _rate;

  set rate(String? value) {
    _rate = value;
  }

  String? get content => _content;

  set content(String? value) {
    _content = value;
  }

  UserProfile? get userAdjust => _userAdjust;

  set userAdjust(UserProfile? value) {
    _userAdjust = value;
  }

  AdjustUserProfile();

  factory AdjustUserProfile.fromJson(Map<String, dynamic> json) =>
      _$AdjustUserProfileFromJson(json);

  Map<String?, dynamic> toJson() => _$AdjustUserProfileToJson(this);

}
