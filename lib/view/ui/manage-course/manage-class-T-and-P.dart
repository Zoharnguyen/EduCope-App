import 'dart:io';

import 'package:dio/dio.dart';
import 'package:edu_cope/constant/course-type.dart';
import 'package:edu_cope/dto/offer.dart';
import 'package:edu_cope/dto/response-entity.dart';
import 'package:edu_cope/dto/user-profile.dart';
import 'package:edu_cope/service/api-offer.dart';
import 'package:edu_cope/view/ui/common/widget-utils.dart';
import 'package:edu_cope/view/ui/manage-course/manage-detail-end-class-T-and-P.dart';
import 'package:edu_cope/view/ui/manage-course/manage-detail-learning-class-T-and-P.dart';
import 'package:edu_cope/view/utils/common-utils.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

import '../homepage-T-and-P.dart';
import 'manage-detail-openning-class-T-and-P.dart';

void main() {
  runApp(MyApp());
}

final double width = CommonUtils.width;
final double height = CommonUtils.height;
String userIdGlobal = CommonUtils.currentUserId;
var userType = CommonUtils.currentUserType;

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ManageClassTandPPage(userIdGlobal),
    );
  }
}

class ManageClassTandPPage extends StatefulWidget {
  ManageClassTandPPage(String userId) {
    userIdGlobal = userId;
  }

  @override
  _ManageClassTandPPageState createState() => _ManageClassTandPPageState();
}

class _ManageClassTandPPageState extends State<ManageClassTandPPage> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            height: height * 4.5 / 5,
            child: DefaultTabController(
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
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        HomePageTandP(userIdGlobal)));
                          },
                        ),
                      ),
                      centerTitle: true,
                      title: Text(
                        'Quản Lý Lớp Hoc',
                        style: TextStyle(
                          fontSize: CommonUtils.getUnitPx() * 20,
                        ),
                      ),
                      bottom: TabBar(
                        tabs: <Widget>[
                          Text(
                            'Đang học',
                            style: TextStyle(
                              fontSize: CommonUtils.getUnitPx() * 20,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                          Text(
                            'Đang mở',
                            style: TextStyle(
                              fontSize: CommonUtils.getUnitPx() * 20,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                          Text(
                            'Đã kết thúc',
                            style: TextStyle(
                              fontSize: CommonUtils.getUnitPx() * 20,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  body: TabBarView(children: <Widget>[
                    JobsClassListViewC(CourseType.LEARNING),
                    JobsClassListViewC(CourseType.OPENING),
                    JobsClassListViewC(CourseType.END),
                  ])),
            ),
          ),
          WidgetUtils.mainButton(context, 0, userType),
        ],
      ),
    );
  }
}

// Tab list view for learning class
class JobsClassListViewC extends StatelessWidget {
  CourseType _courseType = CourseType.LEARNING;

  JobsClassListViewC(CourseType courseType) {
    _courseType = courseType;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Offer>>(
        future: _fetchClasses(_courseType, userIdGlobal),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<Offer>? data = snapshot.data;
            return Container(
                margin: EdgeInsets.only(
                  top: height * 0.1 / 5,
                ),
                child: _jobsClassListView(data, _courseType));
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }
          return Text("${snapshot.error}");
        });
  }
}

ListView _jobsClassListView(data, CourseType courseType) {
  return ListView.builder(
      scrollDirection: Axis.vertical,
      itemCount: data.length,
      itemBuilder: (context, index) {
        return _jobsShowOverviewClass(
            data[index].subject,
            data[index].salary,
            data[index].formatLearning,
            data[index].level,
            data[index].profileAuthor,
            data[index].id,
            courseType,
            context);
      });
}

Widget _jobsShowOverviewClass(
    String subject,
    String salary,
    String formatLearning,
    String level,
    UserProfile profileAuthor,
    String courseId,
    CourseType courseType,
    BuildContext context) {
  Color? colorOverviewClassContent = null;
  if (CourseType.OPENING == courseType) {
    colorOverviewClassContent = Colors.lightBlue[50];
  } else if (CourseType.LEARNING == courseType) {
    colorOverviewClassContent = Colors.green[50];
  } else if (CourseType.END == courseType) {
    colorOverviewClassContent = Color(0xFFf7d7d7);
  }

  Image? profileImageInternal = null;

  // Convert base64 to image
  if (profileAuthor != null &&
      profileAuthor.urlImageProfile != null &&
      profileAuthor.urlImageProfile != '') {
    profileImageInternal = new Image.memory(WidgetUtils.dataFromBase64String(
        profileAuthor.urlImageProfile.toString()));
  }

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
        color: colorOverviewClassContent,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(17),
          bottomRight: Radius.circular(17),
          topLeft: Radius.circular(17),
          topRight: Radius.circular(17),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade400,
            offset: Offset(0, 4),
          ),
        ]),
    child: Column(
      // crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          child: Row(
            children: <Widget>[
              Container(
                width: width * 0.6 / 2,
                height: height * 1.2 / 5,
                margin: EdgeInsets.only(),
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
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade400,
                        offset: Offset(0, 4),
                      ),
                    ],
                    image: DecorationImage(
                        fit: BoxFit.fill,
                        image: profileImageInternal != null
                            ? profileImageInternal.image
                            : NetworkImage(
                                'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg'))),
              ),
              Container(
                height: height * 1.2 / 5,
                width: width * 0.9 / 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(
                        top: height * 0.1 / 5,
                      ),
                      child: Align(
                          child: Text(CommonUtils.catchCaseStringNull(subject),
                              style: TextStyle(
                                  fontSize: CommonUtils.getUnitPx() * 16,
                                  fontStyle: FontStyle.italic,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400))),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        top: height * 0.1 / 5,
                        left: width * 0.15 / 2,
                      ),
                      child: RichText(
                        text: TextSpan(children: <TextSpan>[
                          TextSpan(
                              text: CommonUtils.catchCaseStringNull(
                                  formatLearning),
                              style: TextStyle(
                                fontSize: CommonUtils.getUnitPx() * 14,
                                fontStyle: FontStyle.normal,
                                color: Colors.black,
                              ))
                        ]),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        top: height * 0.05 / 5,
                        left: width * 0.15 / 2,
                      ),
                      child: RichText(
                        text: TextSpan(children: <TextSpan>[
                          TextSpan(
                              text: CommonUtils.catchCaseStringNull(level),
                              style: TextStyle(
                                fontSize: CommonUtils.getUnitPx() * 14,
                                fontStyle: FontStyle.normal,
                                color: Colors.black,
                              ))
                        ]),
                      ),
                    ),
                    showCompletedCourse(courseType),
                    Container(
                      height: height * 0.25 / 5,
                      margin: EdgeInsets.only(
                          // top: height * 0.1 / 5,
                          ),
                      child: TextButton(
                        onPressed: () {
                          if (CourseType.LEARNING == courseType) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        ManageDetailLearningClassTandPPage(
                                            courseId)));
                          } else if (CourseType.OPENING == courseType) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        ManageDetailOpeningClassTandPPage(
                                            courseId,
                                            checkCourseBelongUser(
                                                profileAuthor, userIdGlobal),
                                            '')));
                          } else if (CourseType.END == courseType) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        ManageDetailEndClassTandPPage(
                                            courseId,
                                            checkCourseBelongUser(
                                                profileAuthor, userIdGlobal),
                                            '')));
                          }
                        },
                        child: Align(
                          child: Text(
                            'Chi tiết >>>',
                            style: TextStyle(
                              fontSize: CommonUtils.getUnitPx() * 16,
                              color: Colors.black,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

Container showCompletedCourse(CourseType courseType) {
  double percentD = 0.2;
  String percentS = "20.0%";
  if (CourseType.OPENING == courseType) {
    percentD = 0.0;
    percentS = "0.0%";
  } else if (CourseType.END == courseType) {
    percentD = 1.0;
    percentS = "100%";
  }
  return Container(
    margin: EdgeInsets.only(
      top: height * 0.05 / 5,
    ),
    padding: EdgeInsets.all(CommonUtils.getUnitPx() * 10),
    child: new LinearPercentIndicator(
      width: width * 0.7 / 2,
      animation: true,
      lineHeight: CommonUtils.getUnitPx() * 10,
      animationDuration: 2000,
      percent: percentD,
      center: Text(
        percentS,
        style: TextStyle(
          fontSize: CommonUtils.getUnitPx() * 9,
        ),
      ),
      linearStrokeCap: LinearStrokeCap.roundAll,
      progressColor: Colors.greenAccent,
    ),
  );
}

Future<List<Offer>> _fetchClasses(
    CourseType courseType, String authorId) async {
  APIOfferClient apiOfferClient =
      APIOfferClient(Dio(BaseOptions(contentType: "application/json")));
  ResponseEntity responseEntity = await apiOfferClient
      .getListClassByCourseTypeAndAuthorId(courseType, authorId);
  if (responseEntity.getStatus == HttpStatus.ok) {
    List listDecoded = responseEntity.data;
    Offer offerResponse = Offer.fromJson(responseEntity.data[0]);
    print('ID: ' + offerResponse.id.toString());
    return listDecoded.map((offer) => new Offer.fromJson(offer)).toList();
  } else {
    print('Error: ' + responseEntity.getException.toString());
  }
  return <Offer>[];
}

bool checkCourseBelongUser(UserProfile authorProfile, String userId) {
  if (userId == null || authorProfile == null) return false;
  if (userId == authorProfile.id) return true;
  return false;
}
