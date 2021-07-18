import 'dart:collection';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:edu_cope/constant/course-register-status.dart';
import 'package:edu_cope/dto/attendance-course.dart';
import 'package:edu_cope/dto/response-entity.dart';
import 'package:edu_cope/view/utils/common-utils.dart';
import 'package:retrofit/http.dart';

part 'api-attendance-course-impl.dart';

@RestApi(baseUrl: "http://172.17.0.1:8081")
abstract class APIAttendanceCourseClient {
  factory APIAttendanceCourseClient(Dio dio) = _APIAttendanceCourseClient;

  @POST("/course-attendance/create")
  Future<ResponseEntity> createAttendanceCourse(
      @Body() AttendanceCourse attendanceCourse);

  @GET("/course-attendance/get-attendance-course-by-type-and-course-id")
  Future<ResponseEntity> getAttendanceCourseListByTypeAndCourseId(
      @Query("attendanceCourseStatus", encoded: false)
          CourseRegisterStatus courseRegisterStatus,
      @Query("courseId", encoded: false)
          String courseId);
}
