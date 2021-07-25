part of 'api-attendance-course.dart';

class _APIAttendanceCourseClient implements APIAttendanceCourseClient {
  final Dio _dio;
  late String baseUrl;

  _APIAttendanceCourseClient(this._dio) {
    this.baseUrl = "http://172.17.0.1:8081";
  }

  @override
  Future<ResponseEntity> createAttendanceCourse(
      AttendanceCourse attendanceCourse) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    ResponseEntity reponseEntity = new ResponseEntity();
    try {
      final result = await _dio.request<Map<String, dynamic>>(
          baseUrl + '/course-attendance/create',
          queryParameters: queryParameters,
          options: Options(
              method: 'POST', headers: <String, dynamic>{}, extra: _extra),
          data: attendanceCourse);
      reponseEntity.setStatus(HttpStatus.ok);
      reponseEntity.setData(result.data);
    } catch (error, stacktrace) {
      print("Exception occur: $error stackTrace: $stacktrace");
      reponseEntity.setStatus(HttpStatus.badRequest);
      // reponseEntity.setException(error);
    }
    return reponseEntity;
  }

  @override
  Future<ResponseEntity> getAttendanceCourseListByTypeAndCourseId(
      CourseRegisterStatus courseRegisterStatus, String courseId) async {
    const _extra = <String, dynamic>{};

    Map<String, String> requestParam = new HashMap();
    requestParam.putIfAbsent("attendanceCourseStatus",
        () => CommonUtils.getValueEnum(courseRegisterStatus.toString()));
    requestParam.putIfAbsent("courseId", () => courseId);

    ResponseEntity reponseEntity = new ResponseEntity();
    try {
      final result = await _dio.request<List<dynamic>>(
        baseUrl +
            '/course-attendance/get-attendance-course-by-type-and-course-id',
        queryParameters: requestParam,
        options:
            Options(method: 'GET', headers: <String, dynamic>{}, extra: _extra),
      );
      reponseEntity.setStatus(HttpStatus.ok);
      reponseEntity.setData(result.data);
    } catch (error, stacktrace) {
      print("Exception occur: $error stackTrace: $stacktrace");
      reponseEntity.setStatus(HttpStatus.badRequest);
      // reponseEntity.setException(error);
    }
    return reponseEntity;
  }

  @override
  Future<ResponseEntity> updateAttendanceStatus(
      AttendanceCourse attendanceCourse) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    ResponseEntity reponseEntity = new ResponseEntity();
    // Convert object to json string
    // var jsonOffer = jsonEncode(offer.toJson());
    try {
      final result = await _dio.request<Map<String, dynamic>>(
          baseUrl + '/course-attendance/update-attendance-status',
          queryParameters: queryParameters,
          options: Options(
              method: 'PATCH', headers: <String, dynamic>{}, extra: _extra),
          data: attendanceCourse);
      reponseEntity.setStatus(HttpStatus.ok);
      reponseEntity.setData(result.data);
    } catch (error, stacktrace) {
      print("Exception occur: $error stackTrace: $stacktrace");
      reponseEntity.setStatus(HttpStatus.badRequest);
      // reponseEntity.setException(error);
    }
    return reponseEntity;
  }
}
