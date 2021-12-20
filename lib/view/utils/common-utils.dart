import 'package:edu_cope/constant/common-constant.dart';
import 'package:edu_cope/constant/course-register-status.dart';
import 'package:edu_cope/constant/user-type.dart';
import 'package:enum_to_string/enum_to_string.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CommonUtils {
  static double width = 838.09;
  static double height = 896.76;
  static UserType currentUserType = UserType.TEACHER;
  // static String currentUserId = '607a8b832ea23669aaea68e3';
  static String currentUserId = '';
  // static String tempUserId = '60b30dbe7d31c248aa760f27';
  static String tempUserId = '';
  static double standardWidth = 411.428;
  static double standardHeight = 683.428;
  static String userToken = "";
  static String baseUrl = "http://192.168.1.212:8081";

  static saveValue(String key, String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(key, value);
  }

  static Future<String> getValue(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(key) ?? '';
  }

  static String getValueEnum(String entireValueEnum) {
    if (entireValueEnum.isNotEmpty) return entireValueEnum.split('.')[1];
    return '';
  }

  static Future<UserType> getCurrentUserType() async {
    String userTypeValue = '';
    await CommonUtils.getValue(
            describeEnum(CommonConstant.USER_TYPE).toString())
        .then((value) {
      print("value: " + value.toString());
      userTypeValue = CommonUtils.getValueEnum(value.toString());
      print("userTypeValue: " + userTypeValue);
    });
    var result = EnumToString.fromString(UserType.values, userTypeValue);
    return result ?? UserType.TEACHER;
  }

  static String mappingRoleWithUserTypeInClass(String userType) {
    if (UserType.TEACHER.toString() == userType) return 'Host';
    if (UserType.STUDENTPARENT.toString() == userType) return 'Mem';
    return '';
  }

  static String mappingValueWithCourseStatusEnum(
      CourseRegisterStatus? courseRegisterStatus) {
    if (courseRegisterStatus == CourseRegisterStatus.ACCEPT) return "Accept";
    if (courseRegisterStatus == CourseRegisterStatus.PENDING) return "Pending";
    if (courseRegisterStatus == CourseRegisterStatus.REJECT) return "Reject";
    return '';
  }

  static String catchCaseStringNull(var value) {
    if (value == null)
      return '';
    else
      return value;
  }

  static String getDayMonthYearFromDateString(String? date) {
    if (date != null && date.isNotEmpty) {
      var dateSplit = date.split('.');
      return dateSplit[2] + '-' + dateSplit[1] + '-' + dateSplit[0];
    }
    return '';
  }

  static List mapNumStarsToListStars(String numStars) {
    var stars = <String>[];
    if (numStars != null && numStars != '') {
      int numIntStars = 0;
      try {
        numIntStars = int.parse(numStars);
        for (int i = 0; i < numIntStars; i++) {
          stars.add('asset/image/rating-star.png');
        }
      } on Exception catch (e) {
        return stars;
      }
    }
    return stars;
  }

  static double getUnitPx() {
    double unitPx = 1;
    try {
      double rateCurrent = double.parse((width / height).toStringAsFixed(3));
      double rateStandard =
          double.parse((standardWidth / standardHeight).toStringAsFixed(3));
      if (rateCurrent < rateStandard) {
        unitPx =
            unitPx * double.parse((width / standardWidth).toStringAsFixed(3));
      } else {
        unitPx =
            unitPx * double.parse((height / standardHeight).toStringAsFixed(3));
      }
    } on Exception catch (e) {
      print(e);
      print("Error when try to calculate unitPx");
    }
    return unitPx;
  }

  static double getUnitHeight() {
    double unitHeight = 1;
    try {
      unitHeight = double.parse((height / standardHeight).toStringAsFixed(3));
    } on Exception catch (e) {
      print(e);
      print("Error when try to calculate unitHeight");
    }
    return unitHeight;
  }

  static double getUnitWidth() {
    double unitWidth = 1;
    try {
      unitWidth = double.parse((width / standardWidth).toStringAsFixed(3));
    } on Exception catch (e) {
      print(e);
      print("Error when try to calculate unitHeight");
    }
    return unitWidth;
  }

}
