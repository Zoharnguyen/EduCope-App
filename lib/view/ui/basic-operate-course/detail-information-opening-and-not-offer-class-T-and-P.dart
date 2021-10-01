import 'dart:io';

import 'package:dio/dio.dart';
import 'package:edu_cope/constant/from-screen.dart';
import 'package:edu_cope/constant/user-type.dart';
import 'package:edu_cope/dto/course-status-wrap.dart';
import 'package:edu_cope/dto/course-status.dart';
import 'package:edu_cope/dto/notification-element.dart';
import 'package:edu_cope/dto/notification-request-dto.dart';
import 'package:edu_cope/dto/offer.dart';
import 'package:edu_cope/dto/response-entity.dart';
import 'package:edu_cope/dto/schedule-offer.dart';
import 'package:edu_cope/dto/user-profile.dart';
import 'package:edu_cope/service/api-account.dart';
import 'package:edu_cope/service/api-notification.dart';
import 'package:edu_cope/service/api-offer.dart';
import 'package:edu_cope/view/ui/common/widget-utils.dart';
import 'package:edu_cope/view/ui/manage-course/edit-detail-information-opening-and-not-offer-class-T.dart';
import 'package:edu_cope/view/ui/manage-profile/manage-profile-T-and-P.dart';
import 'package:edu_cope/view/utils/common-utils.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

import '../homepage-T-and-P.dart';

void main() {
  runApp(MyApp());
}

double width = CommonUtils.width;
double height = CommonUtils.height;
UserType userType = CommonUtils.currentUserType;
String courseIdGlobal = '';
bool checkCourseBelongUserGlobal = false;
String fromScreenGlobal = '';
String userIdGlobal = CommonUtils.currentUserId;
CourseStatusWrap courseStatusWrap = new CourseStatusWrap();

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DetailInformationOpeningAndNotOfferClassTandPPage(false, '', ''),
    );
  }
}

class DetailInformationOpeningAndNotOfferClassTandPPage extends StatefulWidget {
  DetailInformationOpeningAndNotOfferClassTandPPage(
      bool checkCourseBelongUser, String fromScreen, String courseId) {
    checkCourseBelongUserGlobal = checkCourseBelongUser;
    fromScreenGlobal = fromScreen;
    courseIdGlobal = courseId;
  }

  @override
  _DetailInformationOpeningAndNotOfferClassTandPPageState createState() =>
      _DetailInformationOpeningAndNotOfferClassTandPPageState();
}

class _DetailInformationOpeningAndNotOfferClassTandPPageState
    extends State<DetailInformationOpeningAndNotOfferClassTandPPage> {
  Offer _offer = _initializeOffer();
  var stars = [];
  Image? profileImageInternal = null;

  @override
  void initState() {
    super.initState();
    getUserProfileById(userIdGlobal).then((value) {
      courseStatusWrap.courseStatus!.userProfile = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(WidgetUtils.valueColorAppBar),
        title: Container(
          child: Align(
            child: Text(
              'Thông tin lớp học',
              style: TextStyle(
                color: Colors.white,
                fontSize: CommonUtils.getUnitPx() * 20,
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
          buttonEdit(context),
        ],
      ),
      body: SingleChildScrollView(
        reverse: false,
        child: FutureBuilder<Offer>(
          future: getOfferById(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              _offer = snapshot.data!;

              // Convert base64 to image
              if (_offer != null &&
                  _offer.profileAuthor != null &&
                  _offer.profileAuthor!.urlImageProfile != null &&
                  _offer.profileAuthor!.urlImageProfile != ' ') {
                profileImageInternal = new Image.memory(
                    WidgetUtils.dataFromBase64String(
                        _offer.profileAuthor!.urlImageProfile.toString()));
              }

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
                            color: Color(0xFFe9f0ef),
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
                                  right: width * 0.5 / 2,
                                  bottom: height * 0.04 / 5,
                                ),
                                child: Text(
                                  _catchCaseStringNull('Người đăng:'),
                                  style: TextStyle(
                                    fontSize: CommonUtils.getUnitPx() * 12,
                                    fontFamily: "Roboto",
                                    fontStyle: FontStyle.normal,
                                  ),
                                ),
                              ),
                              Container(
                                height: height * 0.8 / 5,
                                width: width * 0.45 / 2,
                                margin: EdgeInsets.only(
                                  bottom: height * 0.05 / 5,
                                ),
                                decoration: BoxDecoration(
                                    color: Color(0xFFe4f2f0),
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(17),
                                      topRight: Radius.circular(17),
                                      bottomLeft: Radius.circular(17),
                                      bottomRight: Radius.circular(17),
                                    ),
                                    border: Border.all(
                                      color: Color(0xFFe1f5f2),
                                      width: 2,
                                    ),
                                    image: DecorationImage(
                                        fit: BoxFit.fill,
                                        image: profileImageInternal != null
                                            ? profileImageInternal!.image
                                            : NetworkImage(
                                                'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg'))),
                              ),
                              WidgetUtils.showRatingStarsMinor(
                                  _catchCaseStringNull(
                                      _offer.profileAuthor!.rate ?? '0'),
                                  stars),
                              Container(
                                margin: EdgeInsets.only(
                                  top: height * 0.05 / 5,
                                ),
                                child: Text(
                                  _catchCaseStringNull(
                                      _offer.profileAuthor!.fullName ?? ''),
                                  style: TextStyle(
                                    fontSize: CommonUtils.getUnitPx() * 14,
                                    fontFamily: "Roboto",
                                    fontStyle: FontStyle.normal,
                                  ),
                                ),
                              ),
                              Container(
                                height: height * 0.25 / 5,
                                margin: EdgeInsets.only(
                                  top: height * 0.03 / 5,
                                ),
                                child: TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                ManageProfileTandPPage(
                                                    CommonUtils
                                                        .catchCaseStringNull(
                                                            _offer
                                                                .profileAuthor!
                                                                .id))));
                                  },
                                  child: Text(
                                    'Chi tiết >>>',
                                    style: TextStyle(
                                      fontSize: CommonUtils.getUnitPx() * 16,
                                      color: Colors.black,
                                      fontStyle: FontStyle.italic,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          )),
                    ],
                  ),
                ),
                titleForItems('Hình thức học'),
                inputShortContentItem(_offer.formatLearning.toString()),
                titleForItems('Cấp học'),
                inputShortContentItem(_offer.level.toString()),
                titleForItems('Ngày học trong tuần'),
                inputShortContentItem(
                    _offer.scheduleOffer!.overview.toString()),
                titleForItems('Thời gian học'),
                inputShortContentItem(_offer.scheduleOffer!.detail.toString()),
                titleForItems('Địa điểm(Nếu chọn học tại nhà)'),
                inputShortContentItem(_offer.preferAddress.toString()),
                titleForItems('Lưu ý'),
                inputLongContentItem(_offer.note.toString()),
                buttonRegister(context),
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
      color: Color(0xFFe9f0ef),
      border: Border.all(
        color: Colors.grey.shade400,
        width: 1,
      ),
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(25),
        topRight: Radius.circular(8),
        bottomLeft: Radius.circular(8),
        bottomRight: Radius.circular(25),
      ),
    ),
    child: Container(
      margin: EdgeInsets.only(top: height * 0.07 / 5, left: width * 0.02 / 2),
      child: Text(
        _catchCaseStringNull(value),
        style: TextStyle(
          fontSize: CommonUtils.getUnitPx() * 16,
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
      color: Color(0xFFe9f0ef),
      border: Border.all(
        color: Colors.grey.shade400,
        width: 1,
      ),
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(25),
        topRight: Radius.circular(8),
        bottomLeft: Radius.circular(8),
        bottomRight: Radius.circular(25),
      ),
    ),
    child: Container(
      margin: EdgeInsets.only(top: height * 0.07 / 5, left: width * 0.02 / 2),
      child: Text(
        _catchCaseStringNull(value),
        style: TextStyle(
          fontSize: CommonUtils.getUnitPx() * 16,
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
                color: Color(0xFF1298e0),
                fontSize: CommonUtils.getUnitPx() * 20,
                fontStyle: FontStyle.italic,
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
      color: Color(0xFFe9f0ef),
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
        style: TextStyle(fontSize: CommonUtils.getUnitPx() * 16),
      ),
    ),
  );
}

Future<Offer> getOfferById() async {
  Offer offer = new Offer();
  String courseId = courseIdGlobal;
  APIOfferClient apiOfferClient =
      APIOfferClient(Dio(BaseOptions(contentType: "application/json")));
  ResponseEntity responseEntity = await apiOfferClient.getCourseById(courseId);
  if (responseEntity.getStatus == HttpStatus.ok) {
    Offer offerResponse = Offer.fromJson(responseEntity.data);
    print('Subject: ' + offerResponse.subject.toString());
    return offerResponse;
  } else {
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

Container buttonEdit(BuildContext context) {
  if (checkCourseBelongUserGlobal &&
      FromScreen.fromScreenManageEndClass != fromScreenGlobal)
    return Container(
      child: TextButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      EditDetailInformationOpeningAndNotOfferClassTPage(
                          courseIdGlobal)));
        },
        child: Text(
          "Sửa",
          style: TextStyle(
            fontSize: CommonUtils.getUnitPx() * 20,
            color: Colors.white,
            fontStyle: FontStyle.italic,
          ),
        ),
      ),
    );
  return Container();
}

Container buttonRegister(BuildContext context) {
  if (!checkCourseBelongUserGlobal &&
      fromScreenGlobal == FromScreen.fromScreenHomePage)
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
      child: TextButton(
        child: Text(
          "Đăng ký",
          style: TextStyle(
              fontSize: CommonUtils.getUnitPx() * 18,
              color: Colors.white,
              fontFamily: "Roboto",
              fontStyle: FontStyle.normal),
        ),
        onPressed: () {
          createCourseStatus(courseStatusWrap);
          sendNotification(new NotificationRequestDto());
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return RegisterSuccessAlert();
              });
        },
      ),
    );
  return Container(
    margin: EdgeInsets.only(
      top: height * 0.5 / 5,
    ),
  );
}

class RegisterSuccessAlert extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0)),
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
                    Text(
                      'Thành Công',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: CommonUtils.getUnitPx() * 20,
                          color: Colors.blue),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Khóa học đã được đăng ký',
                      style: TextStyle(fontSize: CommonUtils.getUnitPx() * 14),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    RaisedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    HomePageTandP(userIdGlobal)));
                      },
                      color: Colors.lightBlue,
                      child: Text(
                        'Đóng',
                        style: TextStyle(color: Colors.white),
                      ),
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
                  child: Icon(
                    Icons.save,
                    color: Colors.white,
                    size: 50,
                  ),
                )),
          ],
        ));
  }
}

Future<Widget> createCourseStatus(CourseStatusWrap courseStatusWrap) async {
  courseStatusWrap.courseId = courseIdGlobal;
  mockCourseStatus(courseStatusWrap.courseStatus ?? new CourseStatus());
  APIOfferClient apiOfferClient =
      APIOfferClient(Dio(BaseOptions(contentType: "application/json")));
  ResponseEntity responseEntity =
      await apiOfferClient.createCourseStatus(courseStatusWrap);
  if (responseEntity.getStatus == HttpStatus.ok) {
    CourseStatusWrap response = CourseStatusWrap.fromJson(responseEntity.data);
    print('Id: ' + response.courseId.toString());
    return Text('Success!');
  } else {
    print('Error: ' + responseEntity.getException.toString());
    return Text('Failed!');
  }
}

Future<UserProfile> getUserProfileById(String userId) async {
  UserProfile userProfile = new UserProfile();
  APIAcountClient apiAcountClient =
      APIAcountClient(Dio(BaseOptions(contentType: "application/json")));
  ResponseEntity responseEntity =
      await apiAcountClient.getUserProfileById(userId);
  if (responseEntity.getStatus == HttpStatus.ok) {
    UserProfile response = UserProfile.fromJson(responseEntity.data);
    print('Id: ' + response.id.toString());
    return response;
  } else {
    print('Error: ' + responseEntity.getException.toString());
  }
  return userProfile;
}

void mockCourseStatus(CourseStatus courseStatus) {
  courseStatus.courseStatusId = new Uuid().v1();
  courseStatus.reason = "Toi dong y dang ky";
}

Future<Widget> sendNotification(
    NotificationRequestDto notificationRequestDto) async {
  mockNotificationRequestDto(notificationRequestDto);
  String receiverId = '';
  APINotificationClient apiNotificationClient =
      APINotificationClient(Dio(BaseOptions(contentType: "application/json")));
  ResponseEntity responseEntity = await apiNotificationClient.sendPnsToTopic(
      notificationRequestDto, receiverId);
  if (responseEntity.getStatus == HttpStatus.ok) {
    NotificationElement response =
        NotificationElement.fromJson(responseEntity.data);
    print('Id: ' + response.notificationId.toString());
    return Text('Success!');
  } else {
    print('Error: ' + responseEntity.getException.toString());
    return Text('Failed!');
  }
}

void mockNotificationRequestDto(NotificationRequestDto notificationRequestDto) {
  if (notificationRequestDto == null)
    notificationRequestDto = new NotificationRequestDto();
  notificationRequestDto.target = 'trungnq-topic';
  notificationRequestDto.title = 'Notification-Test';
  NotificationElement notificationElement = new NotificationElement();
  notificationElement.sender = 'AAA Nguyen';
  notificationElement.content = 'Da dang ky Môn học cua bro day';
  notificationRequestDto.notificationElement = notificationElement;
}
