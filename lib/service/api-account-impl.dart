part of 'api-account.dart';

class _APIAcountClient implements APIAcountClient {
  final Dio _dio;
  String baseUrl;

  _APIAcountClient(this._dio, {this.baseUrl}) {
    this.baseUrl = "http://192.168.10.107:8081";
  }

  @override
  Future<ResponseEntity> createAccount(UserBasic userBasic) async {

    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    ResponseEntity reponseEntity = new ResponseEntity();
    try {
      final result = await _dio.request<Map<String, dynamic>>('/user/create',
          queryParameters: queryParameters,
          options: RequestOptions(
              method: 'POST',
              headers: <String, dynamic>{},
              extra: _extra,
              baseUrl: baseUrl),
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
          options: RequestOptions(
              method: 'POST',
              headers: <String, dynamic>{},
              extra: _extra,
              baseUrl: baseUrl),
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

}
