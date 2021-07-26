part of 'api-notification.dart';

class _APINotificationClient implements APINotificationClient {
  final Dio _dio;
  late String baseUrl;

  _APINotificationClient(this._dio) {
    this.baseUrl = "http://172.17.0.1:8081";
  }

  @override
  Future<ResponseEntity> getNotificationsByUserId(String userId) async {
    const _extra = <String, dynamic>{};

    Map<String, String> requestParam = new HashMap();
    requestParam.putIfAbsent("userId", () => userId);

    ResponseEntity reponseEntity = new ResponseEntity();
    try {
      final result = await _dio.request<dynamic>(
        baseUrl + '/notification/get-list',
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
  Future<ResponseEntity> sendPnsToTopic(
      NotificationRequestDto notificationRequestDto, String receiverId) async {
    const _extra = <String, dynamic>{};
    ResponseEntity reponseEntity = new ResponseEntity();
    Map<String, String> requestParam = new HashMap();
    requestParam.putIfAbsent("receiverId", () => receiverId);

    try {
      final result = await _dio.request<Map<String, dynamic>>(
          baseUrl + '/notification/topic',
          queryParameters: requestParam,
          options: Options(
              method: 'POST', headers: <String, dynamic>{}, extra: _extra),
          data: notificationRequestDto);
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
