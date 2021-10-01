part of 'api-attendance-course.dart';

class _APIAttendanceCourseClient implements APIAttendanceCourseClient {
  final Dio _dio;
  late String baseUrl;
  final String tokenType = "Bearer ";

  _APIAttendanceCourseClient(this._dio) {
    this.baseUrl = CommonUtils.baseUrl;
  }

  @override
  Future<ResponseEntity> createAttendanceCourse(
      AttendanceCourse attendanceCourse) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    ResponseEntity reponseEntity = new ResponseEntity();

    var _headers = <String, dynamic>{};
    _headers.putIfAbsent("Authorization", () => tokenType + CommonUtils.userToken);

    try {
      final result = await _dio.request<Map<String, dynamic>>(
          baseUrl + '/course-attendance/create',
          queryParameters: queryParameters,
          options: Options(
              method: 'POST', headers: _headers, extra: _extra),
          data: attendanceCourse);
      reponseEntity.setStatus(HttpStatus.ok);
      reponseEntity.setData(result.data);
    } catch (error, stacktrace) {
      print("Exception occur: $error stackTrace: $stacktrace");
      reponseEntity.setStatus(HttpStatus.badRequest);

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

    var _headers = <String, dynamic>{};
    _headers.putIfAbsent("Authorization", () => tokenType + CommonUtils.userToken);

    try {
      final result = await _dio.request<List<dynamic>>(
        baseUrl +
            '/course-attendance/get-attendance-course-by-type-and-course-id',
        queryParameters: requestParam,
        options:
            Options(method: 'GET', headers: _headers, extra: _extra),
      );
      reponseEntity.setStatus(HttpStatus.ok);
      reponseEntity.setData(result.data);
    } catch (error, stacktrace) {
      print("Exception occur: $error stackTrace: $stacktrace");
      reponseEntity.setStatus(HttpStatus.badRequest);

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

    var _headers = <String, dynamic>{};
    _headers.putIfAbsent("Authorization", () => tokenType + CommonUtils.userToken);

    try {
      final result = await _dio.request<Map<String, dynamic>>(
          baseUrl + '/course-attendance/update-attendance-status',
          queryParameters: queryParameters,
          options: Options(
              method: 'PATCH', headers: _headers, extra: _extra),
          data: attendanceCourse);
      reponseEntity.setStatus(HttpStatus.ok);
      reponseEntity.setData(result.data);
    } catch (error, stacktrace) {
      print("Exception occur: $error stackTrace: $stacktrace");
      reponseEntity.setStatus(HttpStatus.badRequest);

    }
    return reponseEntity;
  }
}
