import 'dart:collection';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:edu_cope/dto/response-entity.dart';
import 'package:edu_cope/view/utils/common-utils.dart';
import 'package:retrofit/http.dart';

part 'api-file-impl.dart';

@RestApi(baseUrl: "http://192.168.1.35:8081")
abstract class APIFileClient {

  factory APIFileClient(Dio dio) = _APIFileClient;

  @POST("/file/upload-single")
  Future<ResponseEntity> uploadFile(@Part(name: "file") MultipartFile file, @Query("authorId", encoded: false) String authorId);

  @GET("/file/get-file-by-id")
  Future<ResponseEntity> getFileById(@Query("fileId", encoded: false) String fileId);

}
