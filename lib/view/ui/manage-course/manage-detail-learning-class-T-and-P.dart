import 'dart:io';

import 'package:dio/dio.dart';
import 'package:edu_cope/constant/course-type.dart';
import 'package:edu_cope/constant/user-type.dart';
import 'package:edu_cope/dto/adjust-user-profile.dart';
import 'package:edu_cope/dto/offer.dart';
import 'package:edu_cope/dto/response-entity.dart';
import 'package:edu_cope/dto/user-profile.dart';
import 'package:edu_cope/service/api-offer.dart';
import 'package:edu_cope/view/ui/common/developing-feature-screen-T-and-P.dart';
import 'package:edu_cope/view/ui/common/widget-utils.dart';
import 'package:edu_cope/view/ui/manage-course/manage-attendance-learning-class-T-and-P.dart';
import 'package:edu_cope/view/ui/manage-course/manage-class-T-and-P.dart';
import 'package:edu_cope/view/utils/common-utils.dart';
import 'package:flutter/material.dart';

import 'detail-information-learning-class-T-and-P.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ManageDetailLearningClassTandPPage(courseIdGlobal),
    );
  }
}

String courseIdGlobal = '';
final double width = CommonUtils.width;
final double height = CommonUtils.height;
AdjustUserProfile adjustUserProfile = new AdjustUserProfile();
var userType = CommonUtils.currentUserType;
String userIdGlobal = CommonUtils.currentUserId;

class ManageDetailLearningClassTandPPage extends StatefulWidget {
  ManageDetailLearningClassTandPPage(String courseId) {
    courseIdGlobal = courseId;
  }

  @override
  _ManageDetailLearningClassTandPPageState createState() =>
      _ManageDetailLearningClassTandPPageState();
}

class _ManageDetailLearningClassTandPPageState
    extends State<ManageDetailLearningClassTandPPage> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(height * 0.41 / 5),
          child: AppBar(
              backgroundColor: Color(WidgetUtils.valueColorAppBar),
            title: Container(
                child: Text(
                  'Môn toán - Đang học',
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
          )),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: height * 3.86 / 5,
              child: Column(
                children: <Widget>[
                  Container(
                    height: height * 0.35 / 5,
                    width: width * 1.4 / 2,
                    margin: EdgeInsets.only(
                      top: height * 0.5 / 5,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25),
                        topRight: Radius.circular(8),
                        bottomLeft: Radius.circular(8),
                        bottomRight: Radius.circular(25),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          height: height * 0.3 / 5,
                          child: new Image.asset(
                              'asset/image/class_information.png'),
                        ),
                        Container(
                            margin: EdgeInsets.only(
                              left: width * 0.1 / 2,
                            ),
                            child: TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            DetailInformationLearingClassTandPPage(
                                                courseIdGlobal)));
                              },
                              child: Text(
                                'Thông tin lớp học',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: CommonUtils.getUnitPx() * 20,
                                ),
                              ),
                            )),
                      ],
                    ),
                  ),
                  Container(
                    height: height * 0.35 / 5,
                    width: width * 1.4 / 2,
                    margin: EdgeInsets.only(
                      top: height * 0.3 / 5,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25),
                        topRight: Radius.circular(8),
                        bottomLeft: Radius.circular(8),
                        bottomRight: Radius.circular(25),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          height: height * 0.3 / 5,
                          child:
                              new Image.asset('asset/image/class_status.png'),
                        ),
                        Container(
                            margin: EdgeInsets.only(
                              left: width * 0.1 / 2,
                            ),
                            child: TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            DevelopingFeatureScreenTandPPage()));
                              },
                              child: Text(
                                'Kết quả học tập',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: CommonUtils.getUnitPx() * 20,
                                ),
                              ),
                            )),
                      ],
                    ),
                  ),
                  Container(
                    height: height * 0.35 / 5,
                    width: width * 1.4 / 2,
                    margin: EdgeInsets.only(
                      top: height * 0.3 / 5,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25),
                        topRight: Radius.circular(8),
                        bottomLeft: Radius.circular(8),
                        bottomRight: Radius.circular(25),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          height: height * 0.32 / 5,
                          child: new Image.asset('asset/image/attendance.png'),
                        ),
                        Container(
                            margin: EdgeInsets.only(
                              left: width * 0.1 / 2,
                            ),
                            child: TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            ManageAttendanceLearningClassTandPPage(
                                                courseIdGlobal)));
                              },
                              child: Text(
                                'Điểm danh',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: CommonUtils.getUnitPx() * 20,
                                ),
                              ),
                            )),
                      ],
                    ),
                  ),
                  Container(
                    height: height * 0.35 / 5,
                    width: width * 1.4 / 2,
                    margin: EdgeInsets.only(
                      top: height * 0.3 / 5,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25),
                        topRight: Radius.circular(8),
                        bottomLeft: Radius.circular(8),
                        bottomRight: Radius.circular(25),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          height: height * 0.3 / 5,
                          child: new Image.asset('asset/image/contract.png'),
                        ),
                        Container(
                            margin: EdgeInsets.only(
                              left: width * 0.1 / 2,
                            ),
                            child: TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            DevelopingFeatureScreenTandPPage()));
                              },
                              child: Text(
                                'Hợp đồng',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: CommonUtils.getUnitPx() * 20,
                                ),
                              ),
                            )),
                      ],
                    ),
                  ),
                  Container(
                    height: height * 0.35 / 5,
                    width: width * 1.4 / 2,
                    margin: EdgeInsets.only(
                      top: height * 0.3 / 5,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25),
                        topRight: Radius.circular(8),
                        bottomLeft: Radius.circular(8),
                        bottomRight: Radius.circular(25),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          height: height * 0.3 / 5,
                          child: new Image.asset('asset/image/cancel.png'),
                        ),
                        Container(
                            margin: EdgeInsets.only(
                              left: width * 0.1 / 2,
                            ),
                            child: TextButton(
                              onPressed: () {
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return QuestionYesOrNo();
                                    });
                                // Navigator.push(context,
                                //     MaterialPageRoute(builder: (context) => ProfileBasicInformation())
                                // );
                              },
                              child: Text(
                                'Kết thúc lớp học',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: CommonUtils.getUnitPx() * 20,
                                ),
                              ),
                            )),
                      ],
                    ),
                  )
                ],
              ),
            ),
            WidgetUtils.mainButton(context, height * 0.05 / 5, userType)
          ],
        ),
      ),
    );
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
              ),
            )),
      ],
    ),
  );
}

Container titleForItemAjust(String nameUser) {
  return Container(
    height: height * 0.35 / 5,
    child: Align(
      child: Text(
        nameUser,
        style: TextStyle(
          color: Color(0xFF1298e0),
          fontSize: CommonUtils.getUnitPx() * 20,
        ),
      ),
    ),
  );
}

Container inputContentItem(String contentInitialValue, String fieldName,
    AdjustUserProfile adjustUserProfile, double heightInput) {
  setValueForAdjustMember(contentInitialValue, fieldName, adjustUserProfile);
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
        setValueForAdjustMember(text, fieldName, adjustUserProfile);
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

void setValueForAdjustMember(
    String value, String fieldName, AdjustUserProfile adjustUserProfile) {
  switch (fieldName) {
    case 'rate':
      adjustUserProfile.rate = value;
      break;
    case 'content':
      adjustUserProfile.content = value;
      break;
  }
}

List<UserProfile> getMemberClass(Offer offer) {
  List<UserProfile> memberClass = <UserProfile>[];
  if (offer != null &&
      offer.memberClassList != null &&
      offer.memberClassList!.isNotEmpty) {
    for (UserProfile userProfile in offer.memberClassList!.toList()) {
      if (userProfile.userType == UserType.STUDENTPARENT)
        memberClass.add(userProfile);
    }
  }
  return memberClass;
}

class QuestionYesOrNo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0)),
        child: Stack(
          overflow: Overflow.visible,
          alignment: Alignment.topCenter,
          children: [
            Container(
              height: height * 1.5 / 5,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 70, 10, 10),
                child: Column(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(
                        bottom: height * 0.1 / 2,
                      ),
                      child: Align(
                        child: Text(
                          'Bạn sẽ kết thúc lớp học?',
                          style: TextStyle(
                            fontSize: CommonUtils.getUnitPx() * 20,
                            color: Color(0xFF1298e0),
                          ),
                        ),
                      ),
                    ),
                    Container(
                        width: width * 1.6 / 2,
                        child: Row(
                          children: [
                            Container(
                              width: width * 0.5 / 2,
                              margin: EdgeInsets.only(
                                left: width * 0.16 / 2,
                              ),
                              child: RaisedButton(
                                onPressed: () {
                                  updateOffer();
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              ManageClassTandPPage(
                                                  userIdGlobal)));
                                },
                                color: Colors.lightBlue,
                                child: Text(
                                  'Đồng ý',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: CommonUtils.getUnitPx() * 16),
                                ),
                              ),
                            ),
                            Container(
                              width: width * 0.5 / 2,
                              margin: EdgeInsets.only(
                                left: width * 0.2 / 2,
                              ),
                              child: RaisedButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              ManageClassTandPPage(
                                                  userIdGlobal)));
                                },
                                color: Colors.lightBlue,
                                child: Text(
                                  'Hủy bỏ',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: CommonUtils.getUnitPx() * 16),
                                ),
                              ),
                            )
                          ],
                        )),
                  ],
                ),
              ),
            ),
            Positioned(
                top: -40,
                child: CircleAvatar(
                  backgroundColor: Colors.redAccent,
                  radius: 40,
                  child: Icon(
                    Icons.assignment_turned_in_outlined,
                    color: Colors.white,
                    size: 40,
                  ),
                )),
          ],
        ));
  }
}

Future<Offer> getOfferById(String courseId) async {
  Offer offer = new Offer();
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

Future<Widget> updateOffer() async {
  Offer offer = new Offer();
  offer.id = courseIdGlobal;
  offer.courseType = CourseType.END;
  APIOfferClient apiOfferClient =
      APIOfferClient(Dio(BaseOptions(contentType: "application/json")));
  ResponseEntity responseEntity = await apiOfferClient.updateOffer(offer);
  if (responseEntity.getStatus == HttpStatus.ok) {
    Offer offerResponse = Offer.fromJson(responseEntity.data);
    print('Subject: ' + offerResponse.subject.toString());
    print('Id: ' + offerResponse.id.toString());
    return Text('Success!');
  } else {
    print('Error: ' + responseEntity.getException.toString());
    return Text('Failed!');
  }
}
