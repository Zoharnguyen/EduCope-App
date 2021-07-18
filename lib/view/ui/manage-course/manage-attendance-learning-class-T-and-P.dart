import 'dart:io';

import 'package:dio/dio.dart';
import 'package:edu_cope/constant/course-register-status.dart';
import 'package:edu_cope/dto/attendance-course.dart';
import 'package:edu_cope/dto/response-entity.dart';
import 'package:edu_cope/dto/user-profile.dart';
import 'package:edu_cope/service/api-attendance-course.dart';
import 'package:edu_cope/view/ui/manage-course/manage-detail-learning-class-T-and-P.dart';
import 'package:edu_cope/view/utils/common-utils.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

final double width = CommonUtils.width;
final double height = CommonUtils.height;
String courseId = '60e394825ded485c37a643f1';
AttendanceCourse attendanceCourse = new AttendanceCourse();

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // title: 'Edu Cope',
      // theme: ThemeData(
      //   primarySwatch: Colors.blue,
      // ),
      home: ManageAttendanceLearningClassTandPPage(),
    );
  }
}

class ManageAttendanceLearningClassTandPPage extends StatefulWidget {
  ManageAttendanceLearningClassTandPPage();

  @override
  _ManageAttendanceLearningClassTandPPageState createState() =>
      _ManageAttendanceLearningClassTandPPageState();
}

class _ManageAttendanceLearningClassTandPPageState
    extends State<ManageAttendanceLearningClassTandPPage> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: height * 4.4 / 5,
              child: DefaultTabController(
                initialIndex: 1,
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
                                          ManageDetailLearningClassTandPPage()));
                            },
                          ),
                        ),
                        centerTitle: true,
                        title: Text(
                          'Điểm danh',
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
                      AttendanceCourseBar(CourseRegisterStatus.ACCEPT),
                      AttendanceCourseBar(CourseRegisterStatus.PENDING),
                      AttendanceCourseBar(CourseRegisterStatus.REJECT),
                    ])),
              ),
            ),
            Container(
                margin: EdgeInsets.only(
                  left: width * 1.2 / 2,
                ),
                height: height * 0.5 / 5,
                child: TextButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return CreateAttendanceCourse();
                        });
                  },
                  child: new Image.asset('asset/image/add.png'),
                )),
          ],
        ),
      ),
    );
  }
}

class AttendanceCourseBar extends StatelessWidget {
  CourseRegisterStatus _courseRegisterStatus = CourseRegisterStatus.ACCEPT;

  AttendanceCourseBar(CourseRegisterStatus courseRegisterStatus) {
    _courseRegisterStatus = courseRegisterStatus;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<AttendanceCourse>>(
        future: _fetchAttendanceCourseList(_courseRegisterStatus, courseId),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<AttendanceCourse>? data = snapshot.data;
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

Future<List<AttendanceCourse>> _fetchAttendanceCourseList(
    CourseRegisterStatus courseRegisterStatus, String courseId) async {
  List<AttendanceCourse> attendanceCourseList = <AttendanceCourse>[];
  // Mock data courseStatusList
  // CourseStatus courseStatus= new CourseStatus();
  // UserProfile userProfile = new UserProfile();
  // userProfile.rate = '5';
  // userProfile.phoneNumber = '0123456789';
  // userProfile.fullName = 'Nguyen Van A';
  // userProfile.urlImageProfile = 'test';
  // courseStatus.userProfile = userProfile;
  // courseStatusList.add(courseStatus);
  APIAttendanceCourseClient apiAttendanceCourseClient =
      APIAttendanceCourseClient(
          Dio(BaseOptions(contentType: "application/json")));
  ResponseEntity responseEntity = await apiAttendanceCourseClient
      .getAttendanceCourseListByTypeAndCourseId(courseRegisterStatus, courseId);
  if (responseEntity.getStatus == HttpStatus.ok) {
    List listDecoded = responseEntity.data;
    AttendanceCourse attendanceCourseResponse =
        AttendanceCourse.fromJson(responseEntity.data[0]);
    print('Id: ' + attendanceCourseResponse.id.toString());
    return listDecoded
        .map((attendanceCourse) =>
            new AttendanceCourse.fromJson(attendanceCourse))
        .toList();
    // Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
  } else {
    // Show pop up notification about fail reason.
    print('Error: ' + responseEntity.getException.toString());
  }
  return attendanceCourseList;
}

ListView _jobsListView(data, CourseRegisterStatus courseRegisterStatus) {
  return ListView.builder(
      scrollDirection: Axis.vertical,
      itemCount: data.length,
      itemBuilder: (context, index) {
        return _jobsShowAttendanceCourse(
            data[index], context, courseRegisterStatus);
      });
}

Widget _jobsShowAttendanceCourse(AttendanceCourse attendanceCourse,
    BuildContext context, CourseRegisterStatus courseRegisterStatus) {
  return Container(
    height: height * 1.2 / 5,
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
    child: Row(children: <Widget>[
      Container(
        width: width * 1 / 2,
        child: TextButton(
          onPressed: () {},
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              showTitle("Ngày: "),
              Container(
                margin: EdgeInsets.only(
                  top: height * 0.05 / 5,
                ),
                child: Text(
                  CommonUtils.catchCaseStringNull(attendanceCourse.dateStudy),
                  style: TextStyle(fontSize: 16, color: Colors.black87),
                ),
              ),
              showTitle("Học trong: "),
              Container(
                margin: EdgeInsets.only(
                  top: height * 0.05 / 5,
                ),
                child: Text(
                  CommonUtils.catchCaseStringNull(attendanceCourse.timeStudy),
                  style: TextStyle(fontSize: 16, color: Colors.black87),
                ),
              ),
              showTitle("Lưu ý: "),
              Container(
                margin: EdgeInsets.only(
                  top: height * 0.05 / 5,
                ),
                child: Text(
                  CommonUtils.catchCaseStringNull(attendanceCourse.note),
                  style: TextStyle(fontSize: 16, color: Colors.black87),
                ),
              )
            ],
          ),
        ),
      ),
      Container(
        margin: EdgeInsets.only(
          bottom: height * 0.1 / 5,
          left: width * 0.2 / 2,
        ),
        child: Text(
          CommonUtils.mappingValueWithCourseStatusEnum(
              attendanceCourse.attendanceCourseStatus),
          style: TextStyle(fontSize: 16, color: Colors.green),
        ),
      ),
    ]),
  );
}

Widget showTitle(String title) {
  return Container(
    child: Text(
      title,
      style: TextStyle(fontSize: 16, color: Colors.blue),
    ),
  );
}

class CreateAttendanceCourse extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0)),
        child: Stack(
          overflow: Overflow.visible,
          alignment: Alignment.topCenter,
          children: [
            Container(
              height: height * 3.2 / 5,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 70, 10, 10),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      titleForItems('Học trong'),
                      inputContentItem('2h15p', 'timeStudy', attendanceCourse,
                          height * 0.4 / 5),
                      titleForItems('Lưu ý'),
                      inputContentItem('Học thêm 15p', 'note', attendanceCourse,
                          height * 0.8 / 5),
                      Container(
                        margin: EdgeInsets.only(
                          top: height * 0.1 / 5,
                        ),
                        child: RaisedButton(
                          onPressed: () {
                            _createAttendanceCourse(attendanceCourse);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        ManageAttendanceLearningClassTandPPage()));
                          },
                          color: Colors.lightBlue,
                          child: Text(
                            'Điểm danh',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      )
                    ],
                  ),
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
                fontSize: 18,
              ),
            )),
      ],
    ),
  );
}

Container inputContentItem(String contentInitialValue, String fieldName,
    AttendanceCourse attendanceCourse, double heightInput) {
  return Container(
    height: heightInput,
    width: width * 1.3 / 2,
    margin: EdgeInsets.only(
      right: width * 0.2 / 2,
      left: width * 0.3 / 2,
    ),
    child: TextFormField(
      autofocus: false,
      maxLines: 2,
      cursorWidth: 2,
      cursorHeight: 25,
      // focusNode: FocusNode(canRequestFocus: false),
      initialValue: contentInitialValue,
      onChanged: (text) {
        setValueForAttendanceCourse(text, fieldName, attendanceCourse);
      },
      decoration: InputDecoration(
        hintStyle: TextStyle(
          fontSize: 14,
          color: Colors.lightBlue,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 1,
            color: Colors.grey.shade400,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 1,
            color: Colors.lightBlue,
          ),
        ),
      ),
    ),
  );
}

void setValueForAttendanceCourse(
    String value, String fieldName, AttendanceCourse attendanceCourse) {
  switch (fieldName) {
    case 'timeStudy':
      attendanceCourse.timeStudy = value;
      break;
    case 'note':
      attendanceCourse.note = value;
      break;
  }
}

Future<Widget> _createAttendanceCourse(
    AttendanceCourse attendanceCourse) async {
  attendanceCourse.courseId = courseId;
  attendanceCourse.userAttendance = initializeUserProfile();
  APIAttendanceCourseClient apiAttendanceCourseClient =
      APIAttendanceCourseClient(
          Dio(BaseOptions(contentType: "application/json")));
  ResponseEntity responseEntity =
      await apiAttendanceCourseClient.createAttendanceCourse(attendanceCourse);
  if (responseEntity.getStatus == HttpStatus.ok) {
    AttendanceCourse response = AttendanceCourse.fromJson(responseEntity.data);
    ;
    print('Id: ' + response.id.toString());
    return Text('Success!');
    // Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
  } else {
    // Show pop up notification about fail reason.
    print('Error: ' + responseEntity.getException.toString());
    return Text('Failed!');
  }
}

UserProfile initializeUserProfile() {
  UserProfile userProfile = new UserProfile();
  userProfile.id = 'jflasdjfljasdlfjsdf';
  userProfile.fullName = 'Nguyen Van A';
  userProfile.rate = '4';
  return userProfile;
}
