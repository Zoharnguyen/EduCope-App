part of 'api-account.dart';

class _APIAcountClient implements APIAcountClient {
  final Dio _dio;
  late String baseUrl;
  final String tokenType = "Bearer ";

  _APIAcountClient(this._dio) {
    this.baseUrl = CommonUtils.baseUrl;
  }

  @override
  Future<ResponseEntity> createAccount(UserBasic userBasic) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    ResponseEntity reponseEntity = new ResponseEntity();

    var _headers = <String, dynamic>{};
    // _headers.putIfAbsent("Authorization", () => tokenType + CommonUtils.userToken);

    try {
      final result = await _dio.request<Map<String, dynamic>>(
          baseUrl + '/user/create',
          queryParameters: queryParameters,
          options: Options(
              method: 'POST', headers: _headers, extra: _extra),
          data: userBasic);
      reponseEntity.setStatus(HttpStatus.ok);
      reponseEntity.setData(result.data);
    } catch (error, stacktrace) {
      print("Exception occur: $error stackTrace: $stacktrace");
      reponseEntity.setStatus(HttpStatus.badRequest);

    }
    return reponseEntity;
  }

  @override
  Future<ResponseEntity> login(UserBasic userBasic) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    ResponseEntity reponseEntity = new ResponseEntity();

    var _headers = <String, dynamic>{};
    // _headers.putIfAbsent("Authorization", () => tokenType + CommonUtils.userToken);

    try {
      final result = await _dio.request<Map<String, dynamic>>(
          baseUrl + '/user/login',
          queryParameters: queryParameters,
          options: Options(
              method: 'POST', headers: _headers, extra: _extra),
          data: userBasic);
      reponseEntity.setStatus(HttpStatus.ok);
      reponseEntity.setData(result.data);
    } catch (error, stacktrace) {
      print("Exception occur: $error stackTrace: $stacktrace");
      reponseEntity.setStatus(HttpStatus.badRequest);

    }
    return reponseEntity;
  }

  @override
  Future<ResponseEntity> getUserProfileById(String userId) async {
    const _extra = <String, dynamic>{};

    Map<String, String> requestParam = new HashMap();
    requestParam.putIfAbsent("userId", () => userId);

    ResponseEntity reponseEntity = new ResponseEntity();

    var _headers = <String, dynamic>{};
    _headers.putIfAbsent("Authorization", () => tokenType + CommonUtils.userToken);

    try {
      final result = await _dio.request<dynamic>(
        baseUrl + '/user/get-profile',
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
  Future<ResponseEntity> adjustUser(AdjustUserProfile adjustUserProfile) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    ResponseEntity reponseEntity = new ResponseEntity();

    var _headers = <String, dynamic>{};
    _headers.putIfAbsent("Authorization", () => tokenType + CommonUtils.userToken);

    try {
      final result = await _dio.request<Map<String, dynamic>>(
          baseUrl + '/user/adjust-user',
          queryParameters: queryParameters,
          options: Options(
              method: 'POST', headers:_headers, extra: _extra),
          data: adjustUserProfile);
      reponseEntity.setStatus(HttpStatus.ok);
      reponseEntity.setData(result.data);
    } catch (error, stacktrace) {
      print("Exception occur: $error stackTrace: $stacktrace");
      reponseEntity.setStatus(HttpStatus.badRequest);

    }
    return reponseEntity;
  }

  @override
  Future<ResponseEntity> getUserInformation(String userId) async {
    const _extra = <String, dynamic>{};

    Map<String, String> requestParam = new HashMap();
    requestParam.putIfAbsent("userId", () => userId);

    ResponseEntity reponseEntity = new ResponseEntity();

    var _headers = <String, dynamic>{};
    _headers.putIfAbsent("Authorization", () => tokenType + CommonUtils.userToken);

    try {
      final result = await _dio.request<dynamic>(
        baseUrl + '/user/get-user-information',
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
  Future<ResponseEntity> updateUserInformation(UserInformation userInformation) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    ResponseEntity reponseEntity = new ResponseEntity();
    // Convert object to json string
    // var jsonOffer = jsonEncode(offer.toJson());

    var _headers = <String, dynamic>{};
    _headers.putIfAbsent("Authorization", () => tokenType + CommonUtils.userToken);

    try {
      final result = await _dio.request<Map<String, dynamic>>(
          baseUrl + '/user/add-user-information',
          queryParameters: queryParameters,
          options: Options(
              method: 'PUT', headers: _headers, extra: _extra),
          data: userInformation);
      reponseEntity.setStatus(HttpStatus.ok);
      reponseEntity.setData(result.data);
    } catch (error, stacktrace) {
      print("Exception occur: $error stackTrace: $stacktrace");
      reponseEntity.setStatus(HttpStatus.badRequest);

    }
    return reponseEntity;
  }

  @override
  Future<ResponseEntity> getListChat(String userId) async {
    const _extra = <String, dynamic>{};

    Map<String, String> requestParam = new HashMap();
    requestParam.putIfAbsent("userId", () => userId);

    ResponseEntity reponseEntity = new ResponseEntity();

    var _headers = <String, dynamic>{};
    _headers.putIfAbsent("Authorization", () => tokenType + CommonUtils.userToken);

    try {
      final result = await _dio.request<dynamic>(
        baseUrl + '/user/get-list-chat',
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
}
