part of 'api-account.dart';

class _APIAcountClient implements APIAcountClient {
  final Dio _dio;
  late String baseUrl;

  _APIAcountClient(this._dio) {
    this.baseUrl = "http://172.17.0.1:8081";
  }

  @override
  Future<ResponseEntity> createAccount(UserBasic userBasic) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    ResponseEntity reponseEntity = new ResponseEntity();
    try {
      final result = await _dio.request<Map<String, dynamic>>('/user/create',
          queryParameters: queryParameters,
          // options: RequestOptions(
          //     method: 'POST',
          //     headers: <String, dynamic>{},
          //     extra: _extra,
          //     baseUrl: baseUrl, path: ''),
          data: userBasic);
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
  Future<ResponseEntity> login(UserBasic userBasic) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    ResponseEntity reponseEntity = new ResponseEntity();
    try {
      final result = await _dio.request<Map<String, dynamic>>('/user/login',
          queryParameters: queryParameters,
          // options: RequestOptions(
          //     method: 'POST',
          //     headers: <String, dynamic>{},
          //     extra: _extra,
          //     baseUrl: baseUrl),
          data: userBasic);
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
  Future<ResponseEntity> getUserProfileById(String userId) async {
    const _extra = <String, dynamic>{};

    Map<String, String> requestParam = new HashMap();
    requestParam.putIfAbsent("userId", () => userId);

    ResponseEntity reponseEntity = new ResponseEntity();
    try {
      final result = await _dio.request<dynamic>(
        baseUrl + '/user/get-profile',
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
  Future<ResponseEntity> adjustUser(AdjustUserProfile adjustUserProfile) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    ResponseEntity reponseEntity = new ResponseEntity();
    try {
      final result = await _dio.request<Map<String, dynamic>>(
          baseUrl + '/user/adjust-user',
          queryParameters: queryParameters,
          options: Options(
              method: 'POST', headers: <String, dynamic>{}, extra: _extra),
          data: adjustUserProfile);
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
  Future<ResponseEntity> getUserInformation(String userId) async {
    const _extra = <String, dynamic>{};

    Map<String, String> requestParam = new HashMap();
    requestParam.putIfAbsent("userId", () => userId);

    ResponseEntity reponseEntity = new ResponseEntity();
    try {
      final result = await _dio.request<dynamic>(
        baseUrl + '/user/get-user-information',
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
  Future<ResponseEntity> updateUserInformation(UserInformation userInformation) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    ResponseEntity reponseEntity = new ResponseEntity();
    // Convert object to json string
    // var jsonOffer = jsonEncode(offer.toJson());
    try {
      final result = await _dio.request<Map<String, dynamic>>(
          baseUrl + '/user/add-user-information',
          queryParameters: queryParameters,
          options: Options(
              method: 'PUT', headers: <String, dynamic>{}, extra: _extra),
          data: userInformation);
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
