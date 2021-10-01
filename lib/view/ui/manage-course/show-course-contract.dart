import 'dart:io';

import 'package:dio/dio.dart';
import 'package:edu_cope/constant/course-register-status.dart';
import 'package:edu_cope/constant/from-screen.dart';
import 'package:edu_cope/dto/course-contract-wrap.dart';
import 'package:edu_cope/dto/response-entity.dart';
import 'package:edu_cope/dto/user-profile.dart';
import 'package:edu_cope/service/api-account.dart';
import 'package:edu_cope/service/api-offer.dart';
import 'package:edu_cope/view/ui/common/developing-feature-screen-T-and-P.dart';
import 'package:edu_cope/view/ui/common/widget-utils.dart';
import 'package:edu_cope/view/ui/manage-course/manage-class-T-and-P.dart';
import 'package:edu_cope/view/utils/common-utils.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

double width = CommonUtils.width;
double height = CommonUtils.height;
String courseIdGlobal = '';
String userIdGlobal = CommonUtils.currentUserId;
bool checkCourseBelongUserGlobal = false;
CourseContractWrap courseContractWrap = new CourseContractWrap();
UserProfile userProfileGlobal = new UserProfile();
String fromPreviousScreenGlobal = '';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ShowCourseContractPage(
          '', checkCourseBelongUserGlobal, fromPreviousScreenGlobal),
    );
  }
}

class ShowCourseContractPage extends StatefulWidget {
  ShowCourseContractPage(
      String courseId, bool checkCourseBelongUser, String fromPreviousScreen) {
    courseIdGlobal = courseId;
    checkCourseBelongUserGlobal = checkCourseBelongUser;
    fromPreviousScreenGlobal = fromPreviousScreen;
  }

  @override
  _ShowCourseContractPageState createState() => _ShowCourseContractPageState();
}

class _ShowCourseContractPageState extends State<ShowCourseContractPage> {
  @override
  initState() {
    super.initState();
    getContractByCourseId(courseIdGlobal).then((value) {
      setState(() {
        courseContractWrap = value;
      });
    });
    getUserProfileById(userIdGlobal).then((value) {
      setState(() {
        userProfileGlobal = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(WidgetUtils.valueColorAppBar),
        title: Container(
            child: Text(
              'Thông tin hợp đồng',
              style: TextStyle(
                color: Colors.white,
                fontSize: CommonUtils.getUnitPx() * 20,
                fontFamily: "Roboto",
                fontStyle: FontStyle.normal,
              ),
            ),
        ),
        centerTitle: true,
        leading: Container(
          child: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        actions: [
          buttonEdit(context, userIdGlobal, courseContractWrap),
        ],
      ),
      body: SingleChildScrollView(
        reverse: false,
        child: Column(
          // Make list containers in Column start with left screen
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(
                top: height * 0.05 / 5,
              ),
            ),
            titleForItems('Môn học'),
            showShortContentItem(courseContractWrap.courseContract!.subject),
            titleForItems('Hoc phi'),
            showShortContentItem(courseContractWrap.courseContract!.salary),
            titleForItems('Thanh toán sau'),
            showShortContentItem(
                courseContractWrap.courseContract!.paymentDate),
            titleForItems('Hình thức học'),
            showShortContentItem(
                courseContractWrap.courseContract!.formatLearning),
            titleForItems('Luu y'),
            showLongContentItem(courseContractWrap.courseContract!.note),
            showButtonAcceptOrReject(userIdGlobal, courseContractWrap, context),
          ],
        ),
      ),
    );
  }
}

class AdvanceCustomAlert extends StatelessWidget {
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
                      'Hợp đồng đã được ký',
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
                                    ManageClassTandPPage(userIdGlobal)));
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

Container showShortContentItem(String? value) {
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
        CommonUtils.catchCaseStringNull(value),
        style: TextStyle(
          fontSize: CommonUtils.getUnitPx() * 16,
        ),
      ),
    ),
  );
}

Container showLongContentItem(String? value) {
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
        CommonUtils.catchCaseStringNull(value),
        style: TextStyle(fontSize: CommonUtils.getUnitPx() * 16),
      ),
    ),
  );
}

Container showButtonAcceptOrReject(String userCurrentId,
    CourseContractWrap courseContractWrap, BuildContext context) {
  if (userCurrentId !=
          courseContractWrap.courseContract!.userProfileCreate!.id &&
      FromScreen.fromScreenManageEndClass != fromPreviousScreenGlobal) {
    return Container(
      margin: EdgeInsets.only(
        top: height * 0.5 / 5,
        bottom: height * 0.5 / 5,
      ),
      child: Row(
        children: <Widget>[
          Container(
            height: height * 0.3 / 5,
            width: width * 1.5 / 5,
            margin: EdgeInsets.only(
              left: width * 0.2 / 2,
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
              onPressed: () {
                courseContractWrap.courseContract!.userProfileRegistry =
                    userProfileGlobal;
                courseContractWrap.courseContract!.courseRegisterStatus =
                    CourseRegisterStatus.ACCEPT;
                updateCourseContract(courseContractWrap);
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AdvanceCustomAlert();
                    });
              },
              child: Text(
                "Đồng ý",
                style: TextStyle(
                    fontSize: CommonUtils.getUnitPx() * 18,
                    color: Colors.white,
                    fontFamily: "Roboto",
                    fontStyle: FontStyle.normal),
              ),
            ),
          ),
          Container(
            height: height * 0.3 / 5,
            width: width * 1.5 / 5,
            margin: EdgeInsets.only(
              left: width * 0.3 / 2,
            ),
            decoration: BoxDecoration(
                color: Colors.redAccent[200],
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
              onPressed: () {
                //ToDo execute for case reject courseContract here
              },
              child: Text(
                "Từ chối",
                style: TextStyle(
                    fontSize: CommonUtils.getUnitPx() * 18,
                    color: Colors.white,
                    fontFamily: "Roboto",
                    fontStyle: FontStyle.normal),
              ),
            ),
          ),
        ],
      ),
    );
  }
  return Container();
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

Container buttonEdit(BuildContext context, String userCurrentId,
    CourseContractWrap courseContractWrap) {
  if (userCurrentId ==
          courseContractWrap.courseContract!.userProfileCreate!.id &&
      FromScreen.fromScreenManageEndClass != fromPreviousScreenGlobal)
    return Container(
      child: TextButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => DevelopingFeatureScreenTandPPage()));
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

Future<CourseContractWrap> getContractByCourseId(String courseId) async {
  APIOfferClient apiOfferClient =
      APIOfferClient(Dio(BaseOptions(contentType: "application/json")));
  ResponseEntity responseEntity =
      await apiOfferClient.getContractByCourseId(courseId);
  if (responseEntity.getStatus == HttpStatus.ok) {
    CourseContractWrap response =
        CourseContractWrap.fromJson(responseEntity.data);
    print('Id: ' + response.courseId.toString());
    return response;
  } else {
    print('Error: ' + responseEntity.getException.toString());
  }
  return new CourseContractWrap();
}

Future<Widget> updateCourseContract(
    CourseContractWrap courseContractWrap) async {
  APIOfferClient apiOfferClient =
      APIOfferClient(Dio(BaseOptions(contentType: "application/json")));
  ResponseEntity responseEntity =
      await apiOfferClient.updateCourseContract(courseContractWrap);
  if (responseEntity.getStatus == HttpStatus.ok) {
    CourseContractWrap response =
        CourseContractWrap.fromJson(responseEntity.data);
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
