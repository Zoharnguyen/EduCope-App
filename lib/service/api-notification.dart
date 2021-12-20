import 'dart:collection';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:edu_cope/dto/notification-request-dto.dart';
import 'package:edu_cope/dto/response-entity.dart';
import 'package:edu_cope/view/utils/common-utils.dart';
import 'package:retrofit/http.dart';

part 'api-notification-impl.dart';

@RestApi(baseUrl: "http://192.168.1.212:8081")
abstract class APINotificationClient {
  factory APINotificationClient(Dio dio) = _APINotificationClient;

  @GET("/notification/get-list")
  Future<ResponseEntity> getNotificationsByUserId(
      @Query("userId", encoded: false) String userId);

  @POST("/notification/topic")
  Future<ResponseEntity> sendPnsToTopic(@Body() NotificationRequestDto notificationRequestDto, String receiverId);

}
