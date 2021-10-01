part of 'api-chat.dart';

class _APIChatClient implements APIChatClient {
  final Dio _dio;
  late String baseUrl;
  final String tokenType = "Bearer ";

  _APIChatClient(this._dio) {
    this.baseUrl = CommonUtils.baseUrl;
  }

  @override
  Future<ResponseEntity> getMessagesByChatId(String chatId) async {
    const _extra = <String, dynamic>{};

    Map<String, String> requestParam = new HashMap();
    requestParam.putIfAbsent("chatId", () => chatId);

    ResponseEntity reponseEntity = new ResponseEntity();

    var _headers = <String, dynamic>{};
    _headers.putIfAbsent("Authorization", () => tokenType + CommonUtils.userToken);

    try {
      final result = await _dio.request<dynamic>(
        baseUrl + '/chat',
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
