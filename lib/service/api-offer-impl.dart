part of 'api-offer.dart';

class _APIOfferClient implements APIOfferClient {
  final Dio _dio;
  late String baseUrl;
  final String tokenType = "Bearer ";

  _APIOfferClient(this._dio) {
    this.baseUrl = CommonUtils.baseUrl;
  }

  @override
  Future<ResponseEntity> createOffer(Offer offer) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    ResponseEntity reponseEntity = new ResponseEntity();

    var _headers = <String, dynamic>{};
    _headers.putIfAbsent("Authorization", () => tokenType + CommonUtils.userToken);

    try {
      final result = await _dio.request<Map<String, dynamic>>(
          baseUrl + '/offer/create',
          queryParameters: queryParameters,
          options: Options(
              method: 'POST', headers: _headers, extra: _extra),
          data: offer);
      reponseEntity.setStatus(HttpStatus.ok);
      reponseEntity.setData(result.data);
    } catch (error, stacktrace) {
      print("Exception occur: $error stackTrace: $stacktrace");
      reponseEntity.setStatus(HttpStatus.badRequest);
    }
    return reponseEntity;
  }

  @override
  Future<ResponseEntity> getOffersByOfferType(OfferType offerType) async {
    const _extra = <String, dynamic>{};

    var _headers = <String, dynamic>{};
    // GetList api should be available for all
    _headers.putIfAbsent("Authorization", () => tokenType + CommonUtils.userToken);

    Map<String, String> requestParam = new HashMap();
    requestParam.putIfAbsent("offerType", () => "TEACHER");

    ResponseEntity reponseEntity = new ResponseEntity();
    try {
      final result = await _dio.request<List<dynamic>>(
        baseUrl + '/offer/get-list',
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
  Future<ResponseEntity> getOffersByOfferTypeAndSubject(OfferType offerType,
      String subject) async {
    const _extra = <String, dynamic>{};

    Map<String, String> requestParam = new HashMap();
    requestParam.putIfAbsent("offerType", () => "TEACHER");
    requestParam.putIfAbsent("subject", () => subject);

    var _headers = <String, dynamic>{};
    // _headers.putIfAbsent("Authorization", () => tokenType + CommonUtils.userToken);

    ResponseEntity reponseEntity = new ResponseEntity();
    try {
      final result = await _dio.request<List<dynamic>>(
        baseUrl + '/offer/get-courses-by-type-and-subject',
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
  Future<ResponseEntity> getCourseById(String courseId) async {
    const _extra = <String, dynamic>{};

    Map<String, String> requestParam = new HashMap();
    requestParam.putIfAbsent("courseId", () => courseId);

    var _headers = <String, dynamic>{};
    _headers.putIfAbsent("Authorization", () => tokenType + CommonUtils.userToken);

    ResponseEntity reponseEntity = new ResponseEntity();
    try {
      final result = await _dio.request<dynamic>(
        baseUrl + '/offer/get-course-by-id',
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
  Future<ResponseEntity> updateOffer(Offer offer) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    ResponseEntity reponseEntity = new ResponseEntity();

    var _headers = <String, dynamic>{};
    _headers.putIfAbsent("Authorization", () => tokenType + CommonUtils.userToken);

    try {
      final result = await _dio.request<Map<String, dynamic>>(
          baseUrl + '/offer/update',
          queryParameters: queryParameters,
          options: Options(
              method: 'PATCH', headers: _headers, extra: _extra),
          data: offer);
      reponseEntity.setStatus(HttpStatus.ok);
      reponseEntity.setData(result.data);
    } catch (error, stacktrace) {
      print("Exception occur: $error stackTrace: $stacktrace");
      reponseEntity.setStatus(HttpStatus.badRequest);
    }
    return reponseEntity;
  }

  @override
  Future<ResponseEntity> getListCourseStatusByTypeAndCourseId(
      CourseRegisterStatus courseRegisterStatus, String courseId) async {
    const _extra = <String, dynamic>{};

    Map<String, String> requestParam = new HashMap();
    requestParam.putIfAbsent("courseStatus", () =>
        CommonUtils.getValueEnum(courseRegisterStatus.toString()));
    requestParam.putIfAbsent("courseId", () => courseId);

    var _headers = <String, dynamic>{};
    _headers.putIfAbsent("Authorization", () => tokenType + CommonUtils.userToken);

    ResponseEntity reponseEntity = new ResponseEntity();
    try {
      final result = await _dio.request<List<dynamic>>(
        baseUrl + '/offer/get-course-status-by-type-and-course-id',
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
  Future<ResponseEntity> updateCourseStatus(
      CourseStatusWrap courseStatusWrap) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    ResponseEntity reponseEntity = new ResponseEntity();
    // Convert object to json string
    // var jsonOffer = jsonEncode(offer.toJson());

    var _headers = <String, dynamic>{};
    _headers.putIfAbsent("Authorization", () => tokenType + CommonUtils.userToken);

    try {
      final result = await _dio.request<Map<String, dynamic>>(
          baseUrl + '/offer/update-course-status',
          queryParameters: queryParameters,
          options: Options(
              method: 'PATCH', headers: _headers, extra: _extra),
          data: courseStatusWrap);
      reponseEntity.setStatus(HttpStatus.ok);
      reponseEntity.setData(result.data);
    } catch (error, stacktrace) {
      print("Exception occur: $error stackTrace: $stacktrace");
      reponseEntity.setStatus(HttpStatus.badRequest);
    }
    return reponseEntity;
  }

  @override
  Future<ResponseEntity> createCourseContract(
      CourseContractWrap courseContractWrap) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    ResponseEntity reponseEntity = new ResponseEntity();

    var _headers = <String, dynamic>{};
    _headers.putIfAbsent("Authorization", () => tokenType + CommonUtils.userToken);

    try {
      final result = await _dio.request<Map<String, dynamic>>(
          baseUrl + '/offer/create-course-contract',
          queryParameters: queryParameters,
          options: Options(
              method: 'POST', headers: _headers, extra: _extra),
          data: courseContractWrap);
      reponseEntity.setStatus(HttpStatus.ok);
      reponseEntity.setData(result.data);
    } catch (error, stacktrace) {
      print("Exception occur: $error stackTrace: $stacktrace");
      reponseEntity.setStatus(HttpStatus.badRequest);
    }
    return reponseEntity;
  }

  @override
  Future<ResponseEntity> createCourseStatus(
      CourseStatusWrap courseStatusWrap) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    ResponseEntity reponseEntity = new ResponseEntity();

    var _headers = <String, dynamic>{};
    _headers.putIfAbsent("Authorization", () => tokenType + CommonUtils.userToken);

    try {
      final result = await _dio.request<Map<String, dynamic>>(
          baseUrl + '/offer/create-course-status',
          queryParameters: queryParameters,
          options: Options(
              method: 'POST', headers: _headers, extra: _extra),
          data: courseStatusWrap);
      reponseEntity.setStatus(HttpStatus.ok);
      reponseEntity.setData(result.data);
    } catch (error, stacktrace) {
      print("Exception occur: $error stackTrace: $stacktrace");
      reponseEntity.setStatus(HttpStatus.badRequest);
    }
    return reponseEntity;
  }

  @override
  Future<ResponseEntity> getListClassByCourseTypeAndAuthorId(
      CourseType courseType, String authorId) async {
    const _extra = <String, dynamic>{};

    Map<String, String> requestParam = new HashMap();
    requestParam.putIfAbsent(
        "courseType", () => CommonUtils.getValueEnum(courseType.toString()));
    requestParam.putIfAbsent("authorId", () => authorId);

    var _headers = <String, dynamic>{};
    _headers.putIfAbsent("Authorization", () => tokenType + CommonUtils.userToken);

    ResponseEntity reponseEntity = new ResponseEntity();
    try {
      final result = await _dio.request<List<dynamic>>(
        baseUrl + '/offer/get-courses-by-course-type-and-author-id',
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
  Future<ResponseEntity> getContractByCourseId(String courseId) async {
    const _extra = <String, dynamic>{};

    Map<String, String> requestParam = new HashMap();
    requestParam.putIfAbsent("courseId", () => courseId);

    ResponseEntity reponseEntity = new ResponseEntity();

    var _headers = <String, dynamic>{};
    _headers.putIfAbsent("Authorization", () => tokenType + CommonUtils.userToken);

    try {
      final result = await _dio.request<dynamic>(
        baseUrl + '/offer/get-contract-by-course-id',
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
  Future<ResponseEntity> updateCourseContract(
      CourseContractWrap courseContractWrap) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    ResponseEntity reponseEntity = new ResponseEntity();

    var _headers = <String, dynamic>{};
    _headers.putIfAbsent("Authorization", () => tokenType + CommonUtils.userToken);

    try {
      final result = await _dio.request<Map<String, dynamic>>(
          baseUrl + '/offer/update-course-contract',
          queryParameters: queryParameters,
          options: Options(
              method: 'PATCH', headers: _headers, extra: _extra),
          data: courseContractWrap);
      reponseEntity.setStatus(HttpStatus.ok);
      reponseEntity.setData(result.data);
    } catch (error, stacktrace) {
      print("Exception occur: $error stackTrace: $stacktrace");
      reponseEntity.setStatus(HttpStatus.badRequest);
    }
    return reponseEntity;
  }

}