import 'dart:collection';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:edu_cope/dto/adjust-user-profile.dart';
import 'package:edu_cope/dto/response-entity.dart';
import 'package:edu_cope/dto/user-basic.dart';
import 'package:retrofit/http.dart';
part 'api-account-impl.dart';

@RestApi(baseUrl: "http://172.17.0.1:8081")
abstract class APIAcountClient {

  factory APIAcountClient(Dio dio) = _APIAcountClient;

  @POST("/user/create")
  Future<ResponseEntity> createAccount(@Body() UserBasic userBasic);

  @POST("/user/login")
  Future<ResponseEntity> login(@Body() UserBasic userBasic);

  @GET("/user/get-profile")
  Future<ResponseEntity> getUserProfileById(
      @Query("userId", encoded: false) String userId);

  @POST("/user/adjust-user")
  Future<ResponseEntity> adjustUser(@Body() AdjustUserProfile adjustUserProfile);

}