import 'dart:io';

import 'package:dio/dio.dart';
import 'package:edu_cope/constant/from-screen.dart';
import 'package:edu_cope/constant/offer-type.dart';
import 'package:edu_cope/dto/course-status.dart';
import 'package:edu_cope/dto/offer.dart';
import 'package:edu_cope/dto/response-entity.dart';
import 'package:edu_cope/dto/user-profile.dart';
import 'package:edu_cope/service/api-offer.dart';
import 'package:edu_cope/view/ui/basic-operate-course/detail-information-opening-and-not-offer-class-T-and-P.dart';
import 'package:edu_cope/view/ui/common/widget-utils.dart';
import 'package:edu_cope/view/ui/manage-course/manage-detail-openning-class-T-and-P.dart';
import 'package:edu_cope/view/utils/common-utils.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

double width = CommonUtils.width;
double height = CommonUtils.height;
String subject = 'toan';
Future<List<Offer>> offers = _fetchLearningOffers(subject);
var userType = CommonUtils.currentUserType;
String userIdGlobal = CommonUtils.currentUserId;
var stars = [];

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ShowAllOfferOpenningCourseTandPPage(),
    );
  }
}

class ShowAllOfferOpenningCourseTandPPage extends StatefulWidget {
  ShowAllOfferOpenningCourseTandPPage();

  @override
  _ShowAllOfferOpenningCourseTandPPageState createState() =>
      _ShowAllOfferOpenningCourseTandPPageState();
}

class _ShowAllOfferOpenningCourseTandPPageState
    extends State<ShowAllOfferOpenningCourseTandPPage> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(height * 0.41 / 5),
          child: AppBar(
            backgroundColor: Color(WidgetUtils.valueColorAppBar),
            centerTitle: true,
            title: Container(
              child: Text(
                'Danh sách khóa học',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: CommonUtils.getUnitPx() * 20,
                  fontFamily: "Roboto",
                  fontStyle: FontStyle.normal,
                ),
              ),
            ),
            leading: Container(
              child: IconButton(
                icon: Icon(Icons.arrow_back_ios),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
          )),
      body: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(bottom: height * 0.05 / 5),
            height: height * 0.5 / 5,
            decoration: BoxDecoration(
                color: Color(0xFFe9f0ef),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(17),
                  // topLeft: Radius.circular(27),
                  bottomRight: Radius.circular(17),
                  // topRight: Radius.circular(27),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade300,
                    offset: Offset(0, 4),
                  ),
                ]),
            child: Row(
              children: <Widget>[
                Container(
                  width: width * 1.4 / 2,
                  padding: EdgeInsets.only(
                    left: width * 0.2 / 2,
                    right: width * 0.2 / 2,
                  ),
                  child: TextField(
                    autofocus: false,
                    cursorWidth: 2,
                    cursorHeight: 25,
                    onChanged: (value) {
                      subject = value;
                    },
                    decoration: InputDecoration(
                      hintText: "Môn học",
                      hintStyle: TextStyle(
                        fontSize: CommonUtils.getUnitPx() * 14,
                        color: Colors.grey,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ),
                ),
                Container(
                  height: height * 0.2 / 5,
                  width: width * 1.5 / 7,
                  decoration: BoxDecoration(
                      color: Color(0xFFdcedf2),
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
                    onPressed: () async {
                      setState(() {
                        offers = _fetchLearningOffers(subject);
                      });
                    },
                    child: Text(
                      "Tìm kiếm",
                      style: TextStyle(
                          fontSize: CommonUtils.getUnitPx() * 13,
                          color: Color(0xFF404a4d),
                          fontFamily: "Roboto",
                          fontStyle: FontStyle.italic),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: height * 3.35 / 5,
            child: JobsListViewOffer(),
          ),
          WidgetUtils.mainButton(context, 0, userType),
        ],
      ),
    );
  }
}

class JobsListViewOffer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Offer>>(
        future: offers,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<Offer>? data = snapshot.data;
            return _jobsListView(data);
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }
          return _jobsListView(mockOffers());
        });
  }
}

ListView _jobsListView(data) {
  return ListView.builder(
      scrollDirection: Axis.vertical,
      itemCount: data.length,
      itemBuilder: (context, index) {
        return _jobsShowOffer(
            data[index].subject,
            data[index].salary,
            data[index].formatLearning,
            data[index].level,
            data[index].profileAuthor,
            data[index].id,
            data[index].memberClassList,
            data[index].courseStatus,
            context);
      });
}

Widget _jobsShowOffer(
    String subject,
    String salary,
    String formatLearning,
    String level,
    UserProfile profileAuthor,
    String courseId,
    List<UserProfile> listMemClass,
    List<CourseStatus> courseStatusList,
    BuildContext context) {
  Image? profileImageInternal =
      WidgetUtils.getImageFromUserProfile(profileAuthor);

  return Container(
    height: height * 1.8 / 5,
    width: width * 1.6 / 2,
    margin: EdgeInsets.only(
      bottom: height * 0.02 / 5,
      top: height * 0.1 / 5,
      right: width * 0.2 / 2,
      left: width * 0.2 / 2,
    ),
    decoration: BoxDecoration(
        color: Colors.lightBlue[50],
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
    child: Column(
      // crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
            height: height * 0.35 / 5,
            width: width * 1.6 / 2,
            decoration: BoxDecoration(
              color: Color(0xFF6dbfbe),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(17),
                topRight: Radius.circular(17),
                bottomRight: Radius.circular(25),
              ),
            ),
            child: Align(
              child: Text(
                'Gia su - ' + subject,
                // 'Gia su - ' + subject + ' - ' + level,
                style: TextStyle(
                    fontSize: CommonUtils.getUnitPx() * 18,
                    color: Colors.white),
              ),
            )),
        Container(
          child: Row(
            children: <Widget>[
              Container(
                height: height * 0.7 / 5,
                width: width * 1.1 / 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(
                        // top: height * 0.05 / 5,
                        left: width * 0.02 / 2,
                      ),
                      child: RichText(
                        text: TextSpan(children: <TextSpan>[
                          TextSpan(
                            text: "Môn học: ",
                            style: TextStyle(
                                fontSize: CommonUtils.getUnitPx() * 15,
                                fontStyle: FontStyle.italic,
                                color: Colors.black,
                                fontWeight: FontWeight.w400),
                          ),
                          TextSpan(
                              text: CommonUtils.catchCaseStringNull(subject),
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
                        left: width * 0.02 / 2,
                      ),
                      child: RichText(
                        text: TextSpan(children: <TextSpan>[
                          TextSpan(
                            text: "Hình thức học: ",
                            style: TextStyle(
                                fontSize: CommonUtils.getUnitPx() * 15,
                                fontStyle: FontStyle.italic,
                                color: Colors.black,
                                fontWeight: FontWeight.w400),
                          ),
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
                        left: width * 0.02 / 2,
                      ),
                      child: RichText(
                        text: TextSpan(children: <TextSpan>[
                          TextSpan(
                            text: "Mức lương: ",
                            style: TextStyle(
                                fontSize: CommonUtils.getUnitPx() * 15,
                                fontStyle: FontStyle.italic,
                                color: Colors.black,
                                fontWeight: FontWeight.w400),
                          ),
                          TextSpan(
                              text: CommonUtils.catchCaseStringNull(salary),
                              style: TextStyle(
                                fontSize: CommonUtils.getUnitPx() * 14,
                                fontStyle: FontStyle.normal,
                                color: Colors.black,
                              ))
                        ]),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                  width: width * 0.5 / 2,
                  height: height / 5,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Container(
                        height: height * 0.65 / 5,
                        width: width * 0.35 / 2,
                        margin: EdgeInsets.only(
                          top: height * 0.02 / 5,
                          right: width * 0.02 / 2,
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
                                  ? profileImageInternal.image
                                  : NetworkImage(
                                      'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg'),
                            )),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                          top: height * 0.05 / 5,
                          left: width * 0.02 / 2,
                        ),
                        child: Text(
                          CommonUtils.catchCaseStringNull(
                                  profileAuthor.fullName) +
                              ' ',
                          style: TextStyle(
                            fontSize: CommonUtils.getUnitPx() * 14,
                            fontFamily: "Roboto",
                            fontStyle: FontStyle.normal,
                          ),
                        ),
                      ),
                      WidgetUtils.showRatingStarsMinor(
                          profileAuthor.rate, stars),
                    ],
                  )),
            ],
          ),
        ),
        Container(
          height: height * 0.3 / 5,
          child: TextButton(
            onPressed: () {
              // if this course of current user then it will go to screen manage course.
              // Should have condition check if user parent register this course or not?
              List<UserProfile> listUserRegisterCourse =
                  getListUserRegisterCourse(courseStatusList);
              if (checkCourseBelongUser(profileAuthor, userIdGlobal) ||
                  checkUserRegisterCourse(listMemClass, userIdGlobal) ||
                  checkUserRegisterCourse(
                      listUserRegisterCourse, userIdGlobal)) {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ManageDetailOpeningClassTandPPage(
                            courseId,
                            checkCourseBelongUser(profileAuthor, userIdGlobal),
                            '')));
              } else {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            DetailInformationOpeningAndNotOfferClassTandPPage(
                                checkCourseBelongUser(
                                    profileAuthor, userIdGlobal),
                                FromScreen.fromScreenHomePage,
                                courseId)));
              }
            },
            child: Text(
              'Chi tiết >>>',
              style: TextStyle(
                fontSize: CommonUtils.getUnitPx() * 16,
                color: Colors.black,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        )
      ],
    ),
  );
}

Future<List<Offer>> _fetchLearningOffers(String subject) async {
  List<Offer> offers = <Offer>[];
  APIOfferClient apiOfferClient =
      APIOfferClient(Dio(BaseOptions(contentType: "application/json")));
  if (subject == null) {
    subject = 'Toan';
  }
  ResponseEntity responseEntity = await apiOfferClient
      .getOffersByOfferTypeAndSubject(OfferType.TEACHER, subject);
  if (responseEntity.getStatus == HttpStatus.ok) {
    List listDecoded = responseEntity.data;
    Offer offerResponse = Offer.fromJson(responseEntity.data[0]);
    print('Subject: ' + offerResponse.subject.toString());
    return listDecoded.map((offer) => new Offer.fromJson(offer)).toList();
  } else {
    print('Error: ' + responseEntity.getException.toString());
  }
  return offers;
}

List<UserProfile> getListUserRegisterCourse(
    List<CourseStatus> courseStatusList) {
  List<UserProfile> listUser = <UserProfile>[];
  if (courseStatusList != null && courseStatusList.length > 0) {
    for (CourseStatus courseStatus in courseStatusList) {
      if (courseStatus.userProfile != null) {
        listUser.add(courseStatus.userProfile ?? new UserProfile());
      }
    }
  }
  return listUser;
}

bool checkCourseBelongUser(UserProfile authorProfile, String userId) {
  if (userId == null || authorProfile == null) return false;
  if (userId == authorProfile.id) return true;
  return false;
}

bool checkUserRegisterCourse(List<UserProfile> listMemClass, String userId) {
  if (listMemClass == null || listMemClass.length == 0 || userId == null)
    return false;
  for (UserProfile userProfile in listMemClass) {
    if (userId == userProfile.id) return true;
  }
  return false;
}

List<Offer> mockOffers() {
  List<Offer>? mockOffers = <Offer>[];
  Offer offer = new Offer();
  mockOffers.add(offer);

  return mockOffers;
}