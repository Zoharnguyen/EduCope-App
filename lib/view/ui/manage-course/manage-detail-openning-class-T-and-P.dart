import 'dart:io';

import 'package:dio/dio.dart';
import 'package:edu_cope/constant/from-screen.dart';
import 'package:edu_cope/constant/user-type.dart';
import 'package:edu_cope/dto/offer.dart';
import 'package:edu_cope/dto/response-entity.dart';
import 'package:edu_cope/dto/schedule-offer.dart';
import 'package:edu_cope/dto/user-profile.dart';
import 'package:edu_cope/service/api-offer.dart';
import 'package:edu_cope/view/ui/basic-operate-course/detail-information-opening-and-not-offer-class-T-and-P.dart';
import 'package:edu_cope/view/ui/common/widget-utils.dart';
import 'package:edu_cope/view/ui/manage-course/create-course-contract-T.dart';
import 'package:edu_cope/view/ui/manage-course/manage-class-T-and-P.dart';
import 'package:edu_cope/view/ui/manage-course/manage-register-course-opening-class-T.dart';
import 'package:edu_cope/view/ui/manage-course/show-course-contract.dart';
import 'package:edu_cope/view/utils/common-utils.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

final double width = CommonUtils.width;
final double height = CommonUtils.height;
String courseIdGlobal = '';
String userIdGlobal = CommonUtils.currentUserId;
bool checkCourseBelongUserGlobal = false;
String previousScreenGlobal = '';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ManageDetailOpeningClassTandPPage(
          '', checkCourseBelongUserGlobal, previousScreenGlobal),
    );
  }
}

class ManageDetailOpeningClassTandPPage extends StatefulWidget {
  ManageDetailOpeningClassTandPPage(
      String courseId, bool checkCourseBelongUser, String previousScreen) {
    courseIdGlobal = courseId;
    checkCourseBelongUserGlobal = checkCourseBelongUser;
    previousScreenGlobal = previousScreen;
  }

  @override
  _ManageDetailOpeningClassTandPPageState createState() =>
      _ManageDetailOpeningClassTandPPageState();
}

class _ManageDetailOpeningClassTandPPageState
    extends State<ManageDetailOpeningClassTandPPage> {
  Offer _offer =
      Offer.withScheduleAndUserProfile(new ScheduleOffer(), new UserProfile());

  @override
  initState() {
    super.initState();
    // Get value of offer
    getOfferById(courseIdGlobal).then((value) {
      setState(() {
        _offer = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(height * 0.41 / 5),
          child: AppBar(
              backgroundColor: Color(WidgetUtils.valueColorAppBar),
            title: Container(
                child: Text(
                  'Môn toán - Đang mở',
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
                  if (FromScreen.fromScreenRegisterCourseOpening ==
                      previousScreenGlobal) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                ManageClassTandPPage(userIdGlobal)));
                  } else
                    Navigator.pop(context);
                },
              ),
            ),
          )),
      body: Column(
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
                                          DetailInformationOpeningAndNotOfferClassTandPPage(
                                              checkCourseBelongUserGlobal,
                                              FromScreen
                                                  .fromScreenManageOpeningClass,
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
                        child: new Image.asset('asset/image/class_status.png'),
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
                                          ManageRegisterCourseOpeningClassTPage(
                                              courseIdGlobal,
                                              checkCourseBelongUserGlobal)));
                            },
                            child: Text(
                              'Trạng thái lớp học',
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
                              if (_offer.courseContract != null &&
                                  _offer.courseContract!.length > 0) {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            ShowCourseContractPage(
                                                courseIdGlobal,
                                                checkCourseBelongUserGlobal,
                                                '')));
                              } else {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            CreateCourseContractTPage(
                                                courseIdGlobal,
                                                checkCourseBelongUserGlobal)));
                              }
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
                              // Navigator.push(context,
                              //     MaterialPageRoute(builder: (context) => ProfileBasicInformation())
                              // );
                            },
                            child: Text(
                              'Hủy bỏ lớp học',
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
          WidgetUtils.mainButton(context, height * 0.05 / 5, UserType.TEACHER)
        ],
      ),
    );
  }
}

Future<Offer> getOfferById(String courseId) async {
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
  return new Offer();
}
