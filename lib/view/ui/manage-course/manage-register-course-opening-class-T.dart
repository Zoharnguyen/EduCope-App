import 'dart:io';

import 'package:dio/dio.dart';
import 'package:edu_cope/constant/course-register-status.dart';
import 'package:edu_cope/dto/course-status-wrap.dart';
import 'package:edu_cope/dto/course-status.dart';
import 'package:edu_cope/dto/response-entity.dart';
import 'package:edu_cope/service/api-offer.dart';
import 'package:edu_cope/view/ui/basic-operate-course/create-offer-class-T.dart';
import 'package:edu_cope/view/ui/manage-profile/manage-profile-T-and-P.dart';
import 'package:edu_cope/view/utils/common-utils.dart';
import 'package:flutter/material.dart';

import '../homepage-T.dart';
import 'manage-detail-openning-class-T-and-P.dart';

void main() {
  runApp(MyApp());
}

final double width = CommonUtils.width;
final double height = CommonUtils.height;

String courseId = '60e394825ded485c37a643f1';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // title: 'Edu Cope',
      // theme: ThemeData(
      //   primarySwatch: Colors.blue,
      // ),
      home: ManageRegisterCourseOpeningClassTPage(),
    );
  }
}

class ManageRegisterCourseOpeningClassTPage extends StatefulWidget {
  ManageRegisterCourseOpeningClassTPage();

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
            height: height * 4.55 / 5,
            child: DefaultTabController(
              length: 3,
              child: Scaffold(
                  appBar: PreferredSize(
                    preferredSize: Size(width * 0.9, height * 0.6 / 5),
                    child: AppBar(
                      leading: Container(
                        margin: EdgeInsets.only(
                          top: height * 0.04 / 5,
                        ),
                        child: IconButton(
                          icon: Icon(Icons.arrow_back_ios),
                          // iconSize: 20,
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        ManageDetailOpeningClassTandPPage()));
                          },
                        ),
                      ),
                      centerTitle: true,
                      title: Text(
                        'Trạng thái lớp Hoc',
                        style: TextStyle(
                          fontSize: 24,
                        ),
                      ),
                      bottom: TabBar(
                        tabs: <Widget>[
                          Text(
                            'Chấp thuận',
                            style: TextStyle(fontSize: 20),
                          ),
                          Text(
                            'Đang chờ',
                            style: TextStyle(fontSize: 20),
                          ),
                          Text(
                            'Từ chối',
                            style: TextStyle(fontSize: 20),
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
          Container(
            color: Colors.grey[100],
            margin: EdgeInsets.only(
                // top: height * 0.1 / 5,
                ),
            child: Row(
              children: <Widget>[
                Container(
                  // height: height * 0.3 / 5,
                  width: width * 0.45 / 2,
                  margin: EdgeInsets.only(
                    left: width * 0.07 / 2,
                  ),
                  child: FlatButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => HomePageT()));
                    },
                    child: new Image.asset('asset/image/homepage_green.jpg'),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                    left: width * 0.25 / 2,
                  ),
                  height: height * 0.4 / 5,
                  child: FlatButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CreateOfferClassTPage()));
                    },
                    child: new Image.asset('asset/image/add.png'),
                  ),
                ),
                Container(
                    margin: EdgeInsets.only(
                      left: width * 0.2 / 2,
                    ),
                    height: height * 0.4 / 5,
                    child: FlatButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => ManageProfileTandPPage()));
                      },
                      child: new Image.asset('asset/image/personal_blue.png'),
                    )),
              ],
            ),
          ),
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
    return FutureBuilder<List<CourseStatus>>(
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
        });
  }
}

Future<List<CourseStatus>> _fetchCourseStatusList(
    CourseRegisterStatus courseRegisterStatus) async {
  List<CourseStatus> courseStatusList = <CourseStatus>[];
  // Mock data courseStatusList
  // CourseStatus courseStatus= new CourseStatus();
  // UserProfile userProfile = new UserProfile();
  // userProfile.rate = '5';
  // userProfile.phoneNumber = '0123456789';
  // userProfile.fullName = 'Nguyen Van A';
  // userProfile.urlImageProfile = 'test';
  // courseStatus.userProfile = userProfile;
  // courseStatusList.add(courseStatus);
  String courseId = '60e394825ded485c37a643f1';
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
    // Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
  } else {
    // Show pop up notification about fail reason.
    print('Error: ' + responseEntity.getException.toString());
  }
  return courseStatusList;
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
        color: Colors.lightBlue[50],
        // border: Border.all(
        //   color: Colors.green,f
        //   width: 2,
        // ),
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
                  child: new Image.asset('asset/image/personal.png'),
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
                          style: TextStyle(fontSize: 16, color: Colors.black87),
                        ),
                      ),
                      Container(
                        width: width * 0.5 / 2,
                        margin: EdgeInsets.only(
                          top: height * 0.05 / 5,
                        ),
                        child: Text(
                          CommonUtils.catchCaseStringNull(courseStatus.userProfile!.rate),
                          style: TextStyle(fontSize: 16, color: Colors.black87),
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
  if (courseRegisterStatus == CourseRegisterStatus.PENDING)
    return Container(
      height: height * 0.5 / 5,
      child: IconButton(
        icon: new Image.asset('asset/image/accept.png'),
        onPressed: () {
          _updateCourseStatus(
              courseStatus, courseId, CourseRegisterStatus.ACCEPT);
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
  if (courseRegisterStatus == CourseRegisterStatus.PENDING)
    return Container(
      height: height * 0.5 / 5,
      alignment: Alignment.center,
      child: IconButton(
        icon: new Image.asset('asset/image/reject.png'),
        onPressed: () {
          _updateCourseStatus(
              courseStatus, courseId, CourseRegisterStatus.REJECT);
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
                          fontSize: 20,
                          color: Colors.blue),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Bạn đã thêm thành viên mới',
                      style: TextStyle(fontSize: 14),
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
                                    ManageRegisterCourseOpeningClassTPage()));
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
                      style: TextStyle(fontSize: 16),
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
                                    ManageRegisterCourseOpeningClassTPage()));
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
    // Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
  } else {
    // Show pop up notification about fail reason.
    print('Error: ' + responseEntity.getException.toString());
    return Text('Failed!');
  }
}
