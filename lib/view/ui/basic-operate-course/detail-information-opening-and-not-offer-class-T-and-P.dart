import 'dart:io';

import 'package:dio/dio.dart';
import 'package:edu_cope/constant/user-type.dart';
import 'package:edu_cope/dto/course-status-wrap.dart';
import 'package:edu_cope/dto/course-status.dart';
import 'package:edu_cope/dto/offer.dart';
import 'package:edu_cope/dto/response-entity.dart';
import 'package:edu_cope/dto/schedule-offer.dart';
import 'package:edu_cope/dto/user-profile.dart';
import 'package:edu_cope/service/api-offer.dart';
import 'package:edu_cope/view/ui/manage-course/edit-detail-information-opening-and-not-offer-class-T.dart';
import 'package:edu_cope/view/ui/manage-profile/manage-profile-T-and-P.dart';
import 'package:flutter/material.dart';

import '../homepage-T-and-P.dart';

void main() {
  runApp(MyApp());
}

double width = 411.4285;
double height = 683.4285;
UserType userType = UserType.STUDENTPARENT;
String courseId = "60e394825ded485c37a643f1";

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DetailInformationOpeningAndNotOfferClassTandPPage(),
    );
  }
}

class DetailInformationOpeningAndNotOfferClassTandPPage extends StatefulWidget {
  DetailInformationOpeningAndNotOfferClassTandPPage();

  @override
  _DetailInformationOpeningAndNotOfferClassTandPPageState createState() =>
      _DetailInformationOpeningAndNotOfferClassTandPPageState();
}

class _DetailInformationOpeningAndNotOfferClassTandPPageState
    extends State<DetailInformationOpeningAndNotOfferClassTandPPage> {
  Offer _offer = _initializeOffer();

  @override
  Widget build(BuildContext context) {
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
          child: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.pop(context);
              ;
            },
          ),
        ),
        actions: [
          buttonEdit(userType, context),
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
                        width: width / 2,
                        height: height * 1.5 / 5,
                        child: Column(
                          children: <Widget>[
                            titleForItems('Môn học'),
                            inputShortestContentItem(_offer.subject.toString()),
                            titleForItems('Mức lương'),
                            inputShortestContentItem(_offer.salary.toString()),
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
                                            builder: (context) =>
                                                ManageProfileTandPPage()));
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
                inputShortContentItem(_offer.formatLearning.toString()),
                titleForItems('Cấp học'),
                inputShortContentItem(_offer.level.toString()),
                titleForItems('Ngay hoc trong tuan'),
                inputShortContentItem(
                    _offer.scheduleOffer!.overview.toString()),
                titleForItems('Thoi gian hoc'),
                inputShortContentItem(_offer.scheduleOffer!.detail.toString()),
                titleForItems('Dia diem(Neu chon hoc tai nha)'),
                inputShortContentItem(_offer.preferAddress.toString()),
                titleForItems('Luu y'),
                inputLongContentItem(_offer.note.toString()),
                buttonRegister(userType, context),
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
    child: Row(
      children: <Widget>[
        Container(
            // width: width * 0.3 / 2,
            margin: EdgeInsets.only(
              left: width * 0.15 / 2,
            ),
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
    print('Subject: ' + offerResponse.subject.toString());
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

Container buttonEdit(UserType userType, BuildContext context) {
  if (UserType.TEACHER == userType)
    return Container(
      child: TextButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      EditDetailInformationOpeningAndNotOfferClassTPage()));
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
    );
  return Container();
}

Container buttonRegister(UserType userType, BuildContext context) {
  if (UserType.STUDENTPARENT == userType)
    return Container(
      height: height * 0.3 / 5,
      width: width * 0.6 / 2,
      margin: EdgeInsets.only(
        top: height * 0.3 / 5,
        left: width * 0.7 / 2,
        bottom: height * 0.3 / 5,
      ),
      decoration: BoxDecoration(
          color: Colors.blue[300],
          // border: Border.all(
          //   color: Colors.green,
          //   width: 2,
          // ),
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(27),
            topLeft: Radius.circular(27),
            bottomRight: Radius.circular(27),
            topRight: Radius.circular(27),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade400,
              offset: Offset(0, 4),
            ),
          ]),
      child: FlatButton(
        child: Text(
          "Đăng ký",
          style: TextStyle(
              fontSize: 18,
              color: Colors.white,
              fontFamily: "Roboto",
              fontStyle: FontStyle.normal),
        ),
        onPressed: () {
          createCourseStatus(new CourseStatusWrap());
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return RegisterSuccessAlert();
              });
        },
      ),
    );
  return Container();
}

class RegisterSuccessAlert extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Dialog(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4.0)
        ),
        child: Stack(
          overflow: Overflow.visible,
          alignment: Alignment.topCenter,
          children: [
            Container(
              height: 200,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 70, 10, 10),
                child: Column(
                  children: [
                    Text('Thành Công', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.blue),),
                    SizedBox(height: 5,),
                    Text('Khóa học đã được đăng ký', style: TextStyle(fontSize: 14),),
                    SizedBox(height: 20,),
                    RaisedButton(onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => HomePageTandP()));
                    },
                      color: Colors.lightBlue,
                      child: Text('Đóng', style: TextStyle(color: Colors.white),),
                    )
                  ],
                ),
              ),
            ),
            Positioned(
                top: -60,
                child: CircleAvatar(
                  backgroundColor: Colors.lightBlue,
                  radius: 60,
                  child: Icon(Icons.save, color: Colors.white, size: 50,),
                )
            ),
          ],
        )
    );
  }
}

Future<Widget> createCourseStatus(CourseStatusWrap courseStatusWrap) async {
  courseStatusWrap.courseId = courseId;
  courseStatusWrap.courseStatus = mockCourseStatus();
  APIOfferClient apiOfferClient =
  APIOfferClient(Dio(BaseOptions(contentType: "application/json")));
  ResponseEntity responseEntity = await apiOfferClient.createCourseStatus(courseStatusWrap);
  if (responseEntity.getStatus == HttpStatus.ok) {
    CourseStatusWrap response = CourseStatusWrap.fromJson(responseEntity.data);
    print('Id: ' + response.courseId.toString());
    return Text('Success!');
    // Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
  } else {
    // Show pop up notification about fail reason.
    print('Error: ' + responseEntity.getException.toString());
    return Text('Failed!');
  }
}

CourseStatus mockCourseStatus() {
  CourseStatus courseStatus = new CourseStatus();
  courseStatus.courseStatusId = "abcdef111";
  courseStatus.reason = "Một hai ba bon";
  UserProfile userProfile = new UserProfile();
  userProfile.fullName = "AAAAA";
  userProfile.rate = '2';
  userProfile.id = '607a8b832ea23669aaea68e3';
  courseStatus.userProfile = userProfile;
  return courseStatus;
}
