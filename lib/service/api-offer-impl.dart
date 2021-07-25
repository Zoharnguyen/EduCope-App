part of 'api-offer.dart';

class _APIOfferClient implements APIOfferClient {
  final Dio _dio;
  late String baseUrl;

  _APIOfferClient(this._dio) {
    this.baseUrl = "http://172.17.0.1:8081";
  }

  @override
  Future<ResponseEntity> createOffer(Offer offer) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    ResponseEntity reponseEntity = new ResponseEntity();
    try {
      final result = await _dio.request<Map<String, dynamic>>(
          baseUrl + '/offer/create',
          queryParameters: queryParameters,
          options: Options(
              method: 'POST', headers: <String, dynamic>{}, extra: _extra),
          data: offer);
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
  Future<ResponseEntity> getOffersByOfferType(OfferType offerType) async {
    const _extra = <String, dynamic>{};

    Map<String, String> requestParam = new HashMap();
    requestParam.putIfAbsent("offerType", () => "TEACHER");

    ResponseEntity reponseEntity = new ResponseEntity();
    try {
      final result = await _dio.request<List<dynamic>>(
        baseUrl + '/offer/get-list',
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
  Future<ResponseEntity> getOffersByOfferTypeAndSubject(
      OfferType offerType, String subject) async {
    const _extra = <String, dynamic>{};

    Map<String, String> requestParam = new HashMap();
    requestParam.putIfAbsent("offerType", () => "TEACHER");
    requestParam.putIfAbsent("subject", () => subject);

    ResponseEntity reponseEntity = new ResponseEntity();
    try {
      final result = await _dio.request<List<dynamic>>(
        baseUrl + '/offer/get-offers-by-type-and-subject',
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
  Future<ResponseEntity> getCourseById(String courseId) async {
    const _extra = <String, dynamic>{};

    Map<String, String> requestParam = new HashMap();
    requestParam.putIfAbsent("courseId", () => courseId);

    ResponseEntity reponseEntity = new ResponseEntity();
    try {
      final result = await _dio.request<dynamic>(
        baseUrl + '/offer/get-course-by-id',
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
  Future<ResponseEntity> updateOffer(Offer offer) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    ResponseEntity reponseEntity = new ResponseEntity();
    // Convert object to json string
    // var jsonOffer = jsonEncode(offer.toJson());
    try {
      final result = await _dio.request<Map<String, dynamic>>(
          baseUrl + '/offer/update',
          queryParameters: queryParameters,
          options: Options(
              method: 'PATCH', headers: <String, dynamic>{}, extra: _extra),
          data: offer);
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
  Future<ResponseEntity> getListCourseStatusByTypeAndCourseId(
      CourseRegisterStatus courseRegisterStatus, String courseId) async {
    const _extra = <String, dynamic>{};

    Map<String, String> requestParam = new HashMap();
    requestParam.putIfAbsent("courseStatus", () => CommonUtils.getValueEnum(courseRegisterStatus.toString()));
    requestParam.putIfAbsent("courseId", () => courseId);

    ResponseEntity reponseEntity = new ResponseEntity();
    try {
      final result = await _dio.request<List<dynamic>>(
        baseUrl + '/offer/get-course-status-by-type-and-course-id',
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
  Future<ResponseEntity> updateCourseStatus( CourseStatusWrap courseStatusWrap) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    ResponseEntity reponseEntity = new ResponseEntity();
    // Convert object to json string
    // var jsonOffer = jsonEncode(offer.toJson());
    try {
      final result = await _dio.request<Map<String, dynamic>>(
          baseUrl + '/offer/update-course-status',
          queryParameters: queryParameters,
          options: Options(
              method: 'PATCH', headers: <String, dynamic>{}, extra: _extra),
          data: courseStatusWrap);
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
  Future<ResponseEntity> createCourseContract(CourseContractWrap courseContractWrap) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    ResponseEntity reponseEntity = new ResponseEntity();
    try {
      final result = await _dio.request<Map<String, dynamic>>(
          baseUrl + '/offer/create-course-contract',
          queryParameters: queryParameters,
          options: Options(
              method: 'POST', headers: <String, dynamic>{}, extra: _extra),
          data: courseContractWrap);
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
  Future<ResponseEntity> createCourseStatus(CourseStatusWrap courseStatusWrap) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    ResponseEntity reponseEntity = new ResponseEntity();
    try {
      final result = await _dio.request<Map<String, dynamic>>(
          baseUrl + '/offer/create-course-status',
          queryParameters: queryParameters,
          options: Options(
              method: 'POST', headers: <String, dynamic>{}, extra: _extra),
          data: courseStatusWrap);
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
  Future<ResponseEntity> getListClassByCourseTypeAndAuthorId(CourseType courseType, String authorId) async {
    const _extra = <String, dynamic>{};

    Map<String, String> requestParam = new HashMap();
    requestParam.putIfAbsent("courseType", () => CommonUtils.getValueEnum(courseType.toString()));
    requestParam.putIfAbsent("authorId", () => authorId);

    ResponseEntity reponseEntity = new ResponseEntity();
    try {
      final result = await _dio.request<List<dynamic>>(
        baseUrl + '/offer/get-courses-by-course-type-and-author-id',
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

}
