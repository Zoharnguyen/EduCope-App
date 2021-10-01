part of 'api-file.dart';

class _APIFileClient implements APIFileClient {
  final Dio _dio;
  late String baseUrl;
  final String tokenType = "Bearer ";

  _APIFileClient(this._dio) {
    this.baseUrl = CommonUtils.baseUrl;
  }

  @override
  Future<ResponseEntity> uploadFile(MultipartFile file, String authorId) async {
    const _extra = <String, dynamic>{};

    Map<String, dynamic> requestParam = new HashMap();
    requestParam.putIfAbsent("authorId", () => authorId);
    requestParam.putIfAbsent("file", () => file);

    ResponseEntity reponseEntity = new ResponseEntity();

    var _headers = <String, dynamic>{};
    _headers.putIfAbsent(
        "Authorization", () => tokenType + CommonUtils.userToken);
    // _headers.putIfAbsent("Content-Type", () => "multipart/form-data");

    try {
      final result = await _dio.request<dynamic>(
          baseUrl + '/file/upload-single',
          queryParameters: requestParam,
          options: Options(method: 'POST', headers: _headers, extra: _extra));
      reponseEntity.setStatus(HttpStatus.ok);
      reponseEntity.setData(result.data);
    } catch (error, stacktrace) {
      print("Exception occur: $error stackTrace: $stacktrace");
      reponseEntity.setStatus(HttpStatus.badRequest);
    }
    return reponseEntity;
  }

  @override
  Future<ResponseEntity> getFileById(String fileId) async {
    const _extra = <String, dynamic>{};

    Map<String, String> requestParam = new HashMap();
    requestParam.putIfAbsent("fileId", () => fileId);

    ResponseEntity reponseEntity = new ResponseEntity();

    var _headers = <String, dynamic>{};
    _headers.putIfAbsent("Authorization", () => tokenType + CommonUtils.userToken);

    try {
      final result = await _dio.request<dynamic>(
        baseUrl + '/file/get-file-by-id',
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
