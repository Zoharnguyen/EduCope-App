import 'dart:io';

import 'package:dio/dio.dart';
import 'package:edu_cope/constant/course-register-status.dart';
import 'package:edu_cope/constant/user-type.dart';
import 'package:edu_cope/dto/attendance-course.dart';
import 'package:edu_cope/dto/response-entity.dart';
import 'package:edu_cope/dto/user-profile.dart';
import 'package:edu_cope/service/api-attendance-course.dart';
import 'package:edu_cope/view/ui/common/widget-utils.dart';
import 'package:edu_cope/view/utils/common-utils.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

final double width = CommonUtils.width;
final double height = CommonUtils.height;
String courseIdGlobal = '60e394825ded485c37a643f1';
AttendanceCourse attendanceCourse = new AttendanceCourse();
CourseRegisterStatus attendanceCourseStatus = CourseRegisterStatus.PENDING;
UserType userType = CommonUtils.currentUserType;

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ManageAttendanceLearningClassTandPPage(courseIdGlobal),
    );
  }
}

class ManageAttendanceLearningClassTandPPage extends StatefulWidget {
  ManageAttendanceLearningClassTandPPage(String courseId) {
    courseIdGlobal = courseId;
  }

  @override
  _ManageAttendanceLearningClassTandPPageState createState() =>
      _ManageAttendanceLearningClassTandPPageState();
}

class _ManageAttendanceLearningClassTandPPageState
    extends State<ManageAttendanceLearningClassTandPPage> {
  @override
  Widget build(BuildContext context) {
    double heightAttendances = height * 5 / 5;
    if (UserType.STUDENTPARENT == userType) heightAttendances = height * 5 / 5;
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: <Widget>[
            Container(
              height: heightAttendances,
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
                            // iconSize: 20,
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                        ),
                        centerTitle: true,
                        title: Text(
                          'Điểm danh',
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
                      AttendanceCourseBar(CourseRegisterStatus.ACCEPT),
                      AttendanceCourseBar(CourseRegisterStatus.PENDING),
                      AttendanceCourseBar(CourseRegisterStatus.REJECT),
                    ])),
              ),
            ),
            showButtonAddAttendancePosition(context),
            // showButtonAddAttendance(context),
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
        future:
            _fetchAttendanceCourseList(_courseRegisterStatus, courseIdGlobal),
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
    width: width * 1.5 / 2,
    margin: EdgeInsets.only(
      bottom: height * 0.02 / 5,
      top: height * 0.1 / 5,
      right: width * 0.25 / 2,
      left: width * 0.25 / 2,
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
    child: Row(children: <Widget>[
      Container(
        width: width * 0.9 / 2,
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
                  style: TextStyle(
                      fontSize: CommonUtils.getUnitPx() * 16,
                      color: Color(0xFF525d63)),
                ),
              ),
              showTitle("Học trong: "),
              Container(
                margin: EdgeInsets.only(
                  top: height * 0.05 / 5,
                ),
                child: Text(
                  CommonUtils.catchCaseStringNull(attendanceCourse.timeStudy),
                  style: TextStyle(
                      fontSize: CommonUtils.getUnitPx() * 16,
                      color: Color(0xFF525d63)),
                ),
              ),
              showTitle("Lưu ý: "),
              Container(
                margin: EdgeInsets.only(
                  top: height * 0.05 / 5,
                ),
                child: Text(
                  CommonUtils.catchCaseStringNull(attendanceCourse.note),
                  style: TextStyle(
                      fontSize: CommonUtils.getUnitPx() * 16,
                      color: Color(0xFF525d63)),
                ),
              )
            ],
          ),
        ),
      ),
      showAttendanceStatus(attendanceCourse.attendanceCourseStatus),
      showAcceptButton(
          attendanceCourse.attendanceCourseStatus, context, attendanceCourse),
      showRejectButton(
          attendanceCourse.attendanceCourseStatus, context, attendanceCourse),
    ]),
  );
}

Container showAttendanceStatus(CourseRegisterStatus? attendanceStatus) {
  if (CourseRegisterStatus.PENDING != attendanceStatus ||
      (CourseRegisterStatus.PENDING == attendanceStatus &&
          userType == UserType.TEACHER))
    return Container(
      margin: EdgeInsets.only(
        bottom: height * 0.1 / 5,
        left: width * 0.2 / 2,
      ),
      child: Text(
        CommonUtils.mappingValueWithCourseStatusEnum(attendanceStatus),
        style: TextStyle(
            fontSize: CommonUtils.getUnitPx() * 16, color: Colors.green),
      ),
    );
  return Container();
}

Widget showTitle(String title) {
  return Container(
    child: Text(
      title,
      style: TextStyle(
        fontSize: CommonUtils.getUnitPx() * 16,
        color: Color(0xFF1298e0),
        fontStyle: FontStyle.italic,
      ),
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
                            // Remove some unnecessary screens out stack
                            Navigator.pop(context);
                            Navigator.pop(context);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        ManageAttendanceLearningClassTandPPage(
                                            courseIdGlobal)));
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
                fontSize: CommonUtils.getUnitPx() * 18,
                fontStyle: FontStyle.italic,
              ),
            )),
      ],
    ),
  );
}

Container inputContentItem(String contentInitialValue, String fieldName,
    AttendanceCourse attendanceCourse, double heightInput) {
  setValueForAttendanceCourse(contentInitialValue, fieldName, attendanceCourse);
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
          fontSize: CommonUtils.getUnitPx() * 14,
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

Widget showAcceptButton(CourseRegisterStatus? courseRegisterStatus,
    BuildContext context, AttendanceCourse attendanceCourse) {
  if (courseRegisterStatus == CourseRegisterStatus.PENDING &&
      UserType.STUDENTPARENT == userType)
    return Container(
      height: height * 0.5 / 5,
      child: IconButton(
        icon: new Image.asset('asset/image/accept.png'),
        onPressed: () {
          attendanceCourse.attendanceCourseStatus = CourseRegisterStatus.ACCEPT;
          _updateAttendanceStatus(attendanceCourse);
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

Widget showRejectButton(CourseRegisterStatus? courseRegisterStatus,
    BuildContext context, AttendanceCourse attendanceCourse) {
  if (courseRegisterStatus == CourseRegisterStatus.PENDING &&
      UserType.STUDENTPARENT == userType)
    return Container(
      height: height * 0.5 / 5,
      alignment: Alignment.center,
      child: IconButton(
        icon: new Image.asset('asset/image/reject.png'),
        onPressed: () {
          attendanceCourse.attendanceCourseStatus = CourseRegisterStatus.REJECT;
          _updateAttendanceStatus(attendanceCourse);
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
                      'Bạn đã đồng ý điểm danh',
                      style: TextStyle(fontSize: CommonUtils.getUnitPx() * 14),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    RaisedButton(
                      onPressed: () {
                        Navigator.pop(context);
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
                      'Bạn đã từ chối điểm danh',
                      style: TextStyle(fontSize: CommonUtils.getUnitPx() * 16),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    RaisedButton(
                      onPressed: () {
                        Navigator.pop(context);
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

Widget showButtonAddAttendancePosition(BuildContext context) {
  // if (UserType.TEACHER == userType)
    return new Positioned(
      top: height * 4.4/5,
      left: width * 1.5/2,
      child: Container(
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
    );
  // return Container();
}

Container showButtonAddAttendance(BuildContext context) {
  if (UserType.TEACHER == userType)
    return Container(
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
        ));
  return Container();
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

UserProfile initializeUserProfile() {
  UserProfile userProfile = new UserProfile();
  userProfile.id = 'jflasdjfljasdlfjsdf';
  userProfile.fullName = 'Nguyen Van A';
  userProfile.rate = '4';
  return userProfile;
}

Future<Widget> _createAttendanceCourse(
    AttendanceCourse attendanceCourse) async {
  attendanceCourse.courseId = courseIdGlobal;
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
  } else {
    print('Error: ' + responseEntity.getException.toString());
    return Text('Failed!');
  }
}

Future<List<AttendanceCourse>> _fetchAttendanceCourseList(
    CourseRegisterStatus courseRegisterStatus, String courseId) async {
  List<AttendanceCourse> attendanceCourseList = <AttendanceCourse>[];
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
  } else {
    print('Error: ' + responseEntity.getException.toString());
  }
  return attendanceCourseList;
}

Future<Widget> _updateAttendanceStatus(
    AttendanceCourse attendanceCourse) async {
  APIAttendanceCourseClient apiAttendanceCourseClient =
      APIAttendanceCourseClient(
          Dio(BaseOptions(contentType: "application/json")));
  ResponseEntity responseEntity =
      await apiAttendanceCourseClient.updateAttendanceStatus(attendanceCourse);
  if (responseEntity.getStatus == HttpStatus.ok) {
    AttendanceCourse attendanceCourseResponse =
        AttendanceCourse.fromJson(responseEntity.data);
    print('Id: ' + attendanceCourseResponse.courseId.toString());
    return Text('Success!');
  } else {
    print('Error: ' + responseEntity.getException.toString());
    return Text('Failed!');
  }
}
