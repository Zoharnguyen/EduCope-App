import 'dart:collection';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:edu_cope/dto/response-entity.dart';
import 'package:edu_cope/view/utils/common-utils.dart';
import 'package:retrofit/http.dart';

part 'api-chat-impl.dart';

@RestApi(baseUrl: "http://172.17.0.1:8081")
abstract class APIChatClient {

  factory APIChatClient(Dio dio) = _APIChatClient;

  @GET("/chat")
  Future<ResponseEntity> getMessagesByChatId(
      @Query("chatId", encoded: false) String chatId);

}
