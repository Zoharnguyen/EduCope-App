import 'dart:io';

import 'package:dio/dio.dart';
import 'package:edu_cope/constant/course-register-status.dart';
import 'package:edu_cope/constant/from-screen.dart';
import 'package:edu_cope/constant/user-type.dart';
import 'package:edu_cope/dto/course-status-wrap.dart';
import 'package:edu_cope/dto/course-status.dart';
import 'package:edu_cope/dto/notification-element.dart';
import 'package:edu_cope/dto/notification-request-dto.dart';
import 'package:edu_cope/dto/response-entity.dart';
import 'package:edu_cope/service/api-notification.dart';
import 'package:edu_cope/service/api-offer.dart';
import 'package:edu_cope/view/ui/common/widget-utils.dart';
import 'package:edu_cope/view/utils/common-utils.dart';
import 'package:flutter/material.dart';

import 'manage-detail-openning-class-T-and-P.dart';

void main() {
  runApp(MyApp());
}

final double width = CommonUtils.width;
final double height = CommonUtils.height;

String courseIdGlobal = '';
bool checkCourseBelongUserGlobal = false;

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ManageRegisterCourseOpeningClassTPage(
          '', checkCourseBelongUserGlobal),
    );
  }
}

class ManageRegisterCourseOpeningClassTPage extends StatefulWidget {
  ManageRegisterCourseOpeningClassTPage(
      String courseId, bool checkCourseBelongUser) {
    courseIdGlobal = courseId;
    checkCourseBelongUserGlobal = checkCourseBelongUser;
  }

  @override
  _ManageRegisterCourseOpeningClassTPageState createState() =>
      _ManageRegisterCourseOpeningClassTPageState();
}

class _ManageRegisterCourseOpeningClassTPageState
    extends State<ManageRegisterCourseOpeningClassTPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            height: height * 4.5 / 5,
            child: DefaultTabController(
              initialIndex: 1,
              length: 3,
              child: Scaffold(
                  appBar: PreferredSize(
                    preferredSize: Size(width * 0.9, height * 0.6 / 5),
                    child: AppBar(
                      backgroundColor: Color(WidgetUtils.valueColorAppBar),
                      leading: Container(
                        margin: EdgeInsets.only(
                          top: height * 0.04 / 5,
                        ),
                        child: IconButton(
                          icon: Icon(Icons.arrow_back_ios),
                          onPressed: () {
                            // Navigator.pop(context);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        ManageDetailOpeningClassTandPPage(
                                            courseIdGlobal,
                                            checkCourseBelongUserGlobal,
                                            FromScreen
                                                .fromScreenRegisterCourseOpening)));
                          },
                        ),
                      ),
                      centerTitle: true,
                      title: Text(
                        'Trạng thái lớp Hoc',
                        style: TextStyle(
                          fontSize: CommonUtils.getUnitPx() * 20,
                        ),
                      ),
                      bottom: TabBar(
                        tabs: <Widget>[
                          Text(
                            'Chấp thuận',
                            style: TextStyle(
                                fontSize: CommonUtils.getUnitPx() * 20,
                                fontStyle: FontStyle.italic),
                          ),
                          Text(
                            'Đang chờ',
                            style: TextStyle(
                                fontSize: CommonUtils.getUnitPx() * 20,
                                fontStyle: FontStyle.italic),
                          ),
                          Text(
                            'Từ chối',
                            style: TextStyle(
                                fontSize: CommonUtils.getUnitPx() * 20,
                                fontStyle: FontStyle.italic),
                          ),
                        ],
                      ),
                    ),
                  ),
                  body: TabBarView(children: <Widget>[
                    CourseStatusBar(CourseRegisterStatus.ACCEPT),
                    CourseStatusBar(CourseRegisterStatus.PENDING),
                    CourseStatusBar(CourseRegisterStatus.REJECT),
                  ])),
            ),
          ),
          WidgetUtils.mainButton(context, 0, UserType.TEACHER)
        ],
      ),
    );
  }
}

class CourseStatusBar extends StatelessWidget {
  CourseRegisterStatus _courseRegisterStatus = CourseRegisterStatus.ACCEPT;

  CourseStatusBar(CourseRegisterStatus courseRegisterStatus) {
    _courseRegisterStatus = courseRegisterStatus;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder<List<CourseStatus>>(
            future: _fetchCourseStatusList(_courseRegisterStatus),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<CourseStatus>? data = snapshot.data;
                return Container(
                    margin: EdgeInsets.only(
                      top: height * 0.1 / 5,
                    ),
                    child: _jobsListView(data, _courseRegisterStatus));
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }
              return Text("${snapshot.error}");
            }));
  }
}

ListView _jobsListView(data, CourseRegisterStatus courseRegisterStatus) {
  return ListView.builder(
      scrollDirection: Axis.vertical,
      itemCount: data.length,
      itemBuilder: (context, index) {
        return _jobsShowUserProfileRegisterOffer(
            data[index], context, courseRegisterStatus);
      });
}

Widget _jobsShowUserProfileRegisterOffer(CourseStatus courseStatus,
    BuildContext context, CourseRegisterStatus courseRegisterStatus) {
  // Get image from profileAuthor
  Image? profileImageInternal = null;
  if (courseStatus != null && courseStatus.userProfile != null) {
    profileImageInternal =
        WidgetUtils.getImageFromUserProfile(courseStatus.userProfile!);
  }

  return Container(
    height: height * 0.5 / 5,
    width: width * 1.6 / 2,
    margin: EdgeInsets.only(
      bottom: height * 0.02 / 5,
      top: height * 0.1 / 5,
      right: width * 0.2 / 2,
      left: width * 0.2 / 2,
    ),
    decoration: BoxDecoration(
        color: Color(0xFFe9f0ef),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(17),
          bottomRight: Radius.circular(17),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade400,
            offset: Offset(0, 4),
          ),
        ]),
    child: Row(
      children: <Widget>[
        Container(
          width: width * 1 / 2,
          child: TextButton(
            onPressed: () {},
            child: Row(
              children: <Widget>[
                Container(
                  height: height * 0.4 / 5,
                  margin: EdgeInsets.only(
                    right: width * 0.03 / 2,
                  ),
                  child: CircleAvatar(
                    radius: height * 0.19 / 5,
                    backgroundColor: Color(0xFFe1f5f2),
                    child: CircleAvatar(
                      radius: height * 0.18 / 5,
                      backgroundImage: profileImageInternal != null
                          ? profileImageInternal.image
                          : NetworkImage(
                              'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg'),
                    ),
                  ),
                ),
                Container(
                  child: Column(
                    children: <Widget>[
                      Container(
                        width: width * 0.5 / 2,
                        margin: EdgeInsets.only(
                          top: height * 0.05 / 5,
                        ),
                        child: Text(
                          CommonUtils.catchCaseStringNull(
                              courseStatus.userProfile!.fullName),
                          style: TextStyle(
                              fontSize: CommonUtils.getUnitPx() * 16,
                              color: Colors.black87),
                        ),
                      ),
                      Container(
                        width: width * 0.5 / 2,
                        margin: EdgeInsets.only(
                          top: height * 0.05 / 5,
                        ),
                        child: Text(
                          CommonUtils.catchCaseStringNull(
                              courseStatus.userProfile!.rate),
                          style: TextStyle(
                              fontSize: CommonUtils.getUnitPx() * 16,
                              color: Colors.black87),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        showAcceptButton(courseRegisterStatus, context, courseStatus),
        showRejectButton(courseRegisterStatus, context, courseStatus),
      ],
    ),
  );
}

Widget showAcceptButton(CourseRegisterStatus courseRegisterStatus,
    BuildContext context, CourseStatus courseStatus) {
  if (courseRegisterStatus == CourseRegisterStatus.PENDING &&
      checkCourseBelongUserGlobal == true)
    return Container(
      height: height * 0.5 / 5,
      child: IconButton(
        icon: new Image.asset('asset/image/accept.png'),
        onPressed: () {
          _updateCourseStatus(
              courseStatus, courseIdGlobal, CourseRegisterStatus.ACCEPT);
          _sendNotification(new NotificationRequestDto());
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AcceptRegisterAlert();
              });
        },
      ),
    );
  return Container();
}

Widget showRejectButton(CourseRegisterStatus courseRegisterStatus,
    BuildContext context, CourseStatus courseStatus) {
  if (courseRegisterStatus == CourseRegisterStatus.PENDING &&
      checkCourseBelongUserGlobal == true)
    return Container(
      height: height * 0.5 / 5,
      alignment: Alignment.center,
      child: IconButton(
        icon: new Image.asset('asset/image/reject.png'),
        onPressed: () {
          _updateCourseStatus(
              courseStatus, courseIdGlobal, CourseRegisterStatus.REJECT);
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return RejectRegisterAlert();
              });
        },
      ),
    );
  return Container();
}

class AcceptRegisterAlert extends StatelessWidget {
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
                      'Bạn đã thêm thành viên mới',
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
                                    ManageRegisterCourseOpeningClassTPage(
                                        courseIdGlobal,
                                        checkCourseBelongUserGlobal)));
                        // Navigator.pop(context);
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

class RejectRegisterAlert extends StatelessWidget {
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
                      'Bạn đã từ chối đơn đăng ký',
                      style: TextStyle(fontSize: CommonUtils.getUnitPx() * 16),
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
                                    ManageRegisterCourseOpeningClassTPage(
                                        courseIdGlobal,
                                        checkCourseBelongUserGlobal)));
                      },
                      color: Colors.redAccent,
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
                  backgroundColor: Colors.redAccent,
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

Future<Widget> _updateCourseStatus(CourseStatus courseStatus, String courseId,
    CourseRegisterStatus courseRegisterStatus) async {
  CourseStatusWrap courseStatusWrap = new CourseStatusWrap();
  courseStatusWrap.courseId = courseId;
  courseStatusWrap.courseStatus = courseStatus;
  courseStatusWrap.courseStatus!.courseRegisterStatus = courseRegisterStatus;
  APIOfferClient apiOfferClient =
      APIOfferClient(Dio(BaseOptions(contentType: "application/json")));
  ResponseEntity responseEntity =
      await apiOfferClient.updateCourseStatus(courseStatusWrap);
  if (responseEntity.getStatus == HttpStatus.ok) {
    CourseStatusWrap courseStatusWrapResponse =
        CourseStatusWrap.fromJson(responseEntity.data);
    print('Id: ' + courseStatusWrapResponse.courseId.toString());
    return Text('Success!');
  } else {
    print('Error: ' + responseEntity.getException.toString());
    return Text('Failed!');
  }
}

Future<List<CourseStatus>> _fetchCourseStatusList(
    CourseRegisterStatus courseRegisterStatus) async {
  List<CourseStatus> courseStatusList = <CourseStatus>[];
  String courseId = courseIdGlobal;
  APIOfferClient apiOfferClient =
      APIOfferClient(Dio(BaseOptions(contentType: "application/json")));
  ResponseEntity responseEntity = await apiOfferClient
      .getListCourseStatusByTypeAndCourseId(courseRegisterStatus, courseId);
  if (responseEntity.getStatus == HttpStatus.ok) {
    List listDecoded = responseEntity.data;
    CourseStatus courseStatusResponse =
        CourseStatus.fromJson(responseEntity.data[0]);
    print('ID: ' + courseStatusResponse.courseStatusId.toString());
    return listDecoded
        .map((courseStatus) => new CourseStatus.fromJson(courseStatus))
        .toList();
  } else {
    print('Error: ' + responseEntity.getException.toString());
  }
  return courseStatusList;
}

Future<Widget> _sendNotification(
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
  notificationRequestDto.title = 'Noti-Decide-Register-Course';
  NotificationElement notificationElement = new NotificationElement();
  notificationElement.sender = 'BBB Nguyen';
  notificationElement.content = 'Da chap nhan don dang ky hoc cua ban';
  notificationElement.screenName =
      'ManageDetailOpeningClassTandPPage(CourseID)';
  notificationRequestDto.notificationElement = notificationElement;
}
