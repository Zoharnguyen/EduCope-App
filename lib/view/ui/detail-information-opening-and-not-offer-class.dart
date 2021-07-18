import 'dart:io';

import 'package:dio/dio.dart';
import 'package:edu_cope/dto/offer.dart';
import 'package:edu_cope/dto/response-entity.dart';
import 'package:edu_cope/dto/schedule-offer.dart';
import 'package:edu_cope/dto/user-profile.dart';
import 'package:edu_cope/service/api-offer.dart';
import 'package:edu_cope/view/ui/detail-information-opening-and-not-offer-class-edit.dart';
import 'package:edu_cope/view/ui/manage-detail-openning-class.dart';
import 'package:edu_cope/view/ui/manage-profile.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

double width = 411.4285;
double height = 683.4285;

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DetailInformationOpeningAndNotOfferClass(),
    );
  }
}

class DetailInformationOpeningAndNotOfferClass extends StatefulWidget {
  DetailInformationOpeningAndNotOfferClass();

  @override
  _DetailInformationOpeningAndNotOfferClassState createState() =>
      _DetailInformationOpeningAndNotOfferClassState();
}

class _DetailInformationOpeningAndNotOfferClassState
    extends State<DetailInformationOpeningAndNotOfferClass> {
  Offer _offer = _initializeOffer();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    final bottomKeyboard = MediaQuery.of(context).viewInsets.bottom;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        title: Container(
          child: Align(
            child: Text(
              'Thông tin lớp học',
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontFamily: "Roboto",
                fontStyle: FontStyle.normal,
              ),
            ),
          ),
        ),
        leading: Container(
          // width: width * 0.29 / 2,
          // decoration: BoxDecoration(
          //   border: Border.all(
          //     color: Colors.green,
          //     width: 2,
          //   )
          // ),
          child: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ManageDetailOpeningClass()));
              ;
            },
          ),
        ),
        actions: [
          Container(
            child: TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            DetailInformationOpeningAndNotOfferClassEdit()));
              },
              child: Text(
                "Sửa",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        reverse: false,
        // padding: EdgeInsets.only(
        //   bottom: bottomKeyboard * 0.1,
        // ),
        child: FutureBuilder<Offer>(
          future: getOfferById(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              _offer = snapshot.data!;
            }
            return Column(
              // Make list containers in Column start with left screen
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  child: Row(
                    children: <Widget>[
                      Container(
                        // decoration: BoxDecoration(
                        //     border: Border.all(
                        //   color: Colors.grey[400],
                        //   width: 1,
                        // )),
                        width: width / 2,
                        height: height * 1.5 / 5,
                        child: Column(
                          children: <Widget>[
                            titleForItems('Môn học'),
                            inputShortestContentItem(_offer.subject),
                            titleForItems('Mức lương'),
                            inputShortestContentItem(_offer.salary),
                          ],
                        ),
                      ),
                      Container(
                          decoration: BoxDecoration(
                            color: Colors.lightBlue[50],
                            border: Border.all(
                              color: Colors.grey.shade400,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(10),
                              topLeft: Radius.circular(10),
                              bottomRight: Radius.circular(10),
                              topRight: Radius.circular(10),
                            ),
                          ),
                          margin: EdgeInsets.only(
                            top: height * 0.04 / 5,
                            right: width * 0.1 / 2,
                          ),
                          width: width * 0.9 / 2,
                          height: height * 1.6 / 5,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.only(
                                  top: height * 0.05 / 5,
                                ),
                                child: Text(
                                  _catchCaseStringNull('Người đăng:'),
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontFamily: "Roboto",
                                    fontStyle: FontStyle.normal,
                                  ),
                                ),
                              ),
                              Container(
                                height: height * 0.6 / 5,
                                child: new Image.asset(
                                    'asset/image/blank-account.jpg'),
                              ),
                              Container(
                                margin: EdgeInsets.only(
                                  top: height * 0.05 / 5,
                                ),
                                child: Text(
                                  _catchCaseStringNull('5'),
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontFamily: "Roboto",
                                    fontStyle: FontStyle.normal,
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(
                                  top: height * 0.05 / 5,
                                ),
                                child: Text(
                                  _catchCaseStringNull('Nguyen Van A'),
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontFamily: "Roboto",
                                    fontStyle: FontStyle.normal,
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(
                                  top: height * 0.05 / 5,
                                ),
                                child: Text(
                                  _catchCaseStringNull('0123456789'),
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontFamily: "Roboto",
                                    fontStyle: FontStyle.normal,
                                  ),
                                ),
                              ),
                              Container(
                                height: height * 0.2 / 5,
                                margin: EdgeInsets.only(
                                  top: height * 0.03 / 5,
                                ),
                                child: FlatButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => ManageProfile()));
                                  },
                                  child: Text(
                                    'Chi tiết >>>',
                                    style: TextStyle(
                                        fontSize: 16, color: Colors.black),
                                  ),
                                ),
                              )
                            ],
                          )),
                    ],
                  ),
                ),
                titleForItems('Hinh thuc hoc'),
                inputShortContentItem(_offer.formatLearning),
                titleForItems('Cấp học'),
                inputShortContentItem(_offer.level),
                titleForItems('Ngay hoc trong tuan'),
                inputShortContentItem(_offer.scheduleOffer.overview),
                titleForItems('Thoi gian hoc'),
                inputShortContentItem(_offer.scheduleOffer.detail),
                titleForItems('Dia diem(Neu chon hoc tai nha)'),
                inputShortContentItem(_offer.preferAddress),
                titleForItems('Luu y'),
                inputLongContentItem(_offer.note),
                Container(
                  margin: EdgeInsets.only(
                    bottom: height * 0.5 / 5,
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}

Container inputShortestContentItem(String value) {
  return Container(
    height: height * 0.3 / 5,
    width: width * 0.6 / 2,
    margin: EdgeInsets.only(
      right: width * 0.2 / 2,
      left: width * 0.3 / 2,
    ),
    decoration: BoxDecoration(
      color: Colors.lightBlue[50],
      border: Border.all(
        color: Colors.grey.shade400,
        width: 1,
      ),
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(10),
        topLeft: Radius.circular(10),
        bottomRight: Radius.circular(10),
        topRight: Radius.circular(10),
      ),
    ),
    child: Container(
      margin: EdgeInsets.only(top: height * 0.07 / 5, left: width * 0.02 / 2),
      child: Text(
        _catchCaseStringNull(value),
        style: TextStyle(
          fontSize: 16,
        ),
      ),
    ),
  );
}

Container inputShortContentItem(String value) {
  return Container(
    height: height * 0.3 / 5,
    width: width * 1.3 / 2,
    margin: EdgeInsets.only(
      right: width * 0.2 / 2,
      left: width * 0.3 / 2,
    ),
    decoration: BoxDecoration(
      color: Colors.lightBlue[50],
      border: Border.all(
        color: Colors.grey.shade400,
        width: 1,
      ),
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(10),
        topLeft: Radius.circular(10),
        bottomRight: Radius.circular(10),
        topRight: Radius.circular(10),
      ),
    ),
    child: Container(
      margin: EdgeInsets.only(top: height * 0.07 / 5, left: width * 0.02 / 2),
      child: Text(
        _catchCaseStringNull(value),
        style: TextStyle(
          fontSize: 16,
        ),
      ),
    ),
  );
}

Container titleForItems(String initialValueTitle) {
  return Container(
    height: height * 0.35 / 5,
    // decoration: BoxDecoration(
    //     border: Border.all(
    //       color: Colors.green,
    //       width: 2,
    //     )
    // ),
    child: Row(
      children: <Widget>[
        Container(
            // width: width * 0.3 / 2,
            margin: EdgeInsets.only(
              left: width * 0.15 / 2,
            ),
            // decoration: BoxDecoration(
            //     border: Border.all(
            //       color: Colors.green,
            //       width: 2,
            //     )
            // ),
            child: Text(
              initialValueTitle,
              style: TextStyle(
                color: Colors.blue,
                fontSize: 20,
              ),
            )),
      ],
    ),
  );
}

Container inputLongContentItem(String value) {
  return Container(
    width: width * 1.3 / 2,
    height: height * 0.7 / 5,
    margin: EdgeInsets.only(
      right: width * 0.2 / 2,
      left: width * 0.3 / 2,
    ),
    decoration: BoxDecoration(
      color: Colors.lightBlue[50],
      border: Border.all(
        color: Colors.grey.shade400,
        width: 1,
      ),
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(10),
        topLeft: Radius.circular(10),
        bottomRight: Radius.circular(10),
        topRight: Radius.circular(10),
      ),
    ),
    child: Container(
      margin: EdgeInsets.only(top: height * 0.02 / 5, left: width * 0.02 / 2),
      child: Text(
        _catchCaseStringNull(value),
        style: TextStyle(fontSize: 16),
      ),
    ),
  );
}

Future<Offer> getOfferById() async {
  Offer offer = new Offer();
  //Mock data
  // Offer offer = new Offer();
  // UserProfile userProfile = new UserProfile();
  // userProfile.rate = '5';
  // userProfile.phoneNumber = '0123456789';
  // offer.profileAuthor = userProfile;
  // offer.subject = 'Toan';
  // offer.salary = '500k/1b';
  // offer.formatLearning = 'Hoc tai nha';
  // offer.level = 'Trung hoc';
  String courseId = '60a9d1ae40a781483137bd76';
  APIOfferClient apiOfferClient =
      APIOfferClient(Dio(BaseOptions(contentType: "application/json")));
  ResponseEntity responseEntity = await apiOfferClient.getCourseById(courseId);
  if (responseEntity.getStatus == HttpStatus.ok) {
    Offer offerResponse = Offer.fromJson(responseEntity.data);
    print('Subject: ' + offerResponse.subject);
    return offerResponse;
    // Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
  } else {
    // Show pop up notification about fail reason.
    print('Error: ' + responseEntity.getException.toString());
  }
  return offer;
}

String _catchCaseStringNull(String value) {
  if (value == null)
    return '';
  else
    return value;
}

Offer _initializeOffer() {
  Offer offer = new Offer();
  UserProfile userProfile = new UserProfile();
  ScheduleOffer scheduleOffer = new ScheduleOffer();
  scheduleOffer.overview = 'Thu 3,5';
  scheduleOffer.detail = 'Tu 8h-10h toi';
  userProfile.rate = '5';
  userProfile.phoneNumber = '0123456789';
  userProfile.fullName = 'Nguyen Van A';
  offer.profileAuthor = userProfile;
  offer.scheduleOffer = scheduleOffer;
  offer.subject = 'Toan';
  offer.salary = '500k/1b';
  offer.formatLearning = 'Hoc tai nha';
  offer.level = 'Trung hoc';
  offer.preferAddress = 'Ha Noi';
  offer.note =
      'Chung toi muon gia su dang song tai Ha Noi, co kinh nghiem gia su tu 3 nam tro len';
  return offer;
}
