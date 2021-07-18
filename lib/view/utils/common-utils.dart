import 'package:edu_cope/constant/course-register-status.dart';
import 'package:edu_cope/constant/user-type.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CommonUtils {
  static saveValue(String key, String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(key, value);
  }

  static getValue(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? value = prefs.getString(key);
    return value;
  }

  static String getValueEnum(String entireValueEnum) {
    if (entireValueEnum.isNotEmpty) return entireValueEnum.split('.')[1];
    return '';
  }

  static String mappingRoleWithUserTypeInClass(String userType) {
    if (UserType.TEACHER.toString() == userType) return 'Host';
    if (UserType.STUDENTPARENT.toString() == userType) return 'Mem';
    return '';
  }

  static String mappingValueWithCourseStatusEnum(
      CourseRegisterStatus courseRegisterStatus) {
    if (courseRegisterStatus == CourseRegisterStatus.ACCEPT) return "Accept";
    if (courseRegisterStatus == CourseRegisterStatus.PENDING) return "Pending";
    if (courseRegisterStatus == CourseRegisterStatus.REJECT) return "Reject";
    return '';
  }

  static String catchCaseStringNull(String value) {
    if (value == null)
      return '';
    else
      return value;
  }

  static String getDayMonthYearFromDateString(String date) {
    if (date != null && date.isNotEmpty) {
      var dateSplit = date.split('.');
      return dateSplit[2] + '-' + dateSplit[1] + '-' + dateSplit[0];
    }
    return '';
  }

}
