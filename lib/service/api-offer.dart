import 'dart:collection';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:edu_cope/constant/course-register-status.dart';
import 'package:edu_cope/constant/course-type.dart';
import 'package:edu_cope/constant/offer-type.dart';
import 'package:edu_cope/dto/course-contract-wrap.dart';
import 'package:edu_cope/dto/course-status-wrap.dart';
import 'package:edu_cope/dto/offer.dart';
import 'package:edu_cope/dto/response-entity.dart';
import 'package:edu_cope/view/utils/common-utils.dart';
import 'package:retrofit/http.dart';

part 'api-offer-impl.dart';

@RestApi(baseUrl: "http://172.17.0.1:8081")
abstract class APIOfferClient {
  factory APIOfferClient(Dio dio) = _APIOfferClient;

  @POST("/offer/create")
  Future<ResponseEntity> createOffer(@Body() Offer offer);

  @GET("/offer/get-list")
  Future<ResponseEntity> getOffersByOfferType(
      @Query("offerType", encoded: false) OfferType offerType);

  @GET("/offer/get-offers-by-type-and-subject")
  Future<ResponseEntity> getOffersByOfferTypeAndSubject(
    @Query("offerType", encoded: false) OfferType offerType,
    @Query("subject", encoded: false) String subject,
  );

  @GET("/offer/get-course-by-id")
  Future<ResponseEntity> getCourseById(
      @Query("courseId", encoded: false) String courseId);

  @PATCH("/offer/update")
  Future<ResponseEntity> updateOffer(@Body() Offer offer);

  @GET("/offer/get-course-status-by-type-and-course-id")
  Future<ResponseEntity> getListCourseStatusByTypeAndCourseId(
      @Query("courseStatus", encoded: false)
          CourseRegisterStatus courseRegisterStatus,
      @Query("courseId", encoded: false)
          String courseId);

  @PATCH("/offer/update-course-status")
  Future<ResponseEntity> updateCourseStatus(
      @Body() CourseStatusWrap courseStatusWrap);

  @POST("/offer/create-course-contract")
  Future<ResponseEntity> createCourseContract(
      @Body() CourseContractWrap courseContractWrap);

  @POST("/offer/create-course-status")
  Future<ResponseEntity> createCourseStatus(
      @Body() CourseStatusWrap courseStatusWrap);

  @GET("/offer/get-courses-by-course-type-and-author-id")
  Future<ResponseEntity> getListClassByCourseTypeAndAuthorId(
      @Query("courseType", encoded: false) CourseType courseType,
      @Query("authorId", encoded: false) String authorId);
}
