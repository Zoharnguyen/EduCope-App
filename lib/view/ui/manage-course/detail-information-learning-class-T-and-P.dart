import 'dart:io';

import 'package:dio/dio.dart';
import 'package:edu_cope/dto/offer.dart';
import 'package:edu_cope/dto/response-entity.dart';
import 'package:edu_cope/dto/schedule-offer.dart';
import 'package:edu_cope/dto/user-profile.dart';
import 'package:edu_cope/service/api-offer.dart';
import 'package:edu_cope/view/ui/manage-course/manage-detail-learning-class-T-and-P.dart';
import 'package:edu_cope/view/utils/common-utils.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

double width = 411.4285;
double height = 683.4285;
String courseId = '60e394825ded485c37a643f1';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DetailInformationLearingClassTandPPage(),
    );
  }
}

class DetailInformationLearingClassTandPPage extends StatefulWidget {
  DetailInformationLearingClassTandPPage();

  @override
  _DetailInformationLearingClassTandPPageState createState() =>
      _DetailInformationLearingClassTandPPageState();
}

class _DetailInformationLearingClassTandPPageState
    extends State<DetailInformationLearingClassTandPPage> {
  Offer _offer = _initializeOffer();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
        body: FutureBuilder<Offer>(
      future: getOfferById(courseId),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          _offer = snapshot.data!;
          return DefaultTabController(
              length: 2,
              child: Scaffold(
                appBar: PreferredSize(
                  preferredSize: Size(width * 0.9, height * 0.6 / 5),
                  child: AppBar(
                    backgroundColor: Colors.lightBlue,
                    centerTitle: true,
                    title: Container(
                      child: Text(
                        'Thông tin lớp học',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontFamily: "Roboto",
                          fontStyle: FontStyle.normal,
                        ),
                      ),
                    ),
                    leading: Container(
                      child: IconButton(
                        icon: Icon(Icons.arrow_back_ios),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      ManageDetailLearningClassTandPPage()));
                        },
                      ),
                    ),
                    bottom: TabBar(
                      tabs: <Widget>[
                        Text(
                          'Thông tin chung',
                          style: TextStyle(fontSize: 20),
                        ),
                        Text(
                          'Thành viên',
                          style: TextStyle(fontSize: 20),
                        ),
                      ],
                    ),
                  ),
                ),
                body: TabBarView(children: <Widget>[
                  generalInformationClass(_offer),
                  membersClass(_offer.memberClassList),
                ]),
              ));
        } else
          return Container();
      },
    ));
  }
}

ListView membersClass(data) {
  return ListView.builder(
      scrollDirection: Axis.vertical,
      itemCount: data.length,
      itemBuilder: (context, index) {
        return _showMemberClass(data[index]);
      });
}

Widget _showMemberClass(UserProfile userProfile) {
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
                          CommonUtils.catchCaseStringNull(userProfile.fullName),
                          style: TextStyle(fontSize: 16, color: Colors.black87),
                        ),
                      ),
                      Container(
                        width: width * 0.5 / 2,
                        margin: EdgeInsets.only(
                          top: height * 0.05 / 5,
                        ),
                        child: Text(
                          CommonUtils.catchCaseStringNull(userProfile.rate),
                          style: TextStyle(fontSize: 16, color: Colors.black87),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Container(
          // width: width * 1 / 2,
          margin: EdgeInsets.only(
            bottom: height * 0.1 / 5,
            left: width * 0.2 / 2,
          ),
          child: Align(
            child: Text(
              CommonUtils.mappingRoleWithUserTypeInClass(
                  CommonUtils.catchCaseStringNull(userProfile.userType.toString())),
              style: TextStyle(fontSize: 16, color: Colors.lightBlue),
            ),
          ),
        ),
      ],
    ),
  );
}

Widget generalInformationClass(Offer offer) {
  return SingleChildScrollView(
      reverse: false,
      // padding: EdgeInsets.only(
      //   bottom: bottomKeyboard * 0.1,
      // ),
      child: Column(
        // Make list containers in Column start with left screen
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          titleForItems('Môn học'),
          inputShortContentItem(CommonUtils.catchCaseStringNull(offer.subject.toString())),
          titleForItems('Hình thức học'),
          inputShortContentItem(CommonUtils.catchCaseStringNull(offer.formatLearning.toString())),
          titleForItems('Cấp học'),
          inputShortContentItem(CommonUtils.catchCaseStringNull(offer.level.toString())),
          titleForItems('Ngày học trong tuần'),
          inputShortContentItem(
              CommonUtils.catchCaseStringNull(offer.scheduleOffer!.overview.toString())),
          titleForItems('Thời gian học'),
          inputShortContentItem(
              CommonUtils.catchCaseStringNull(offer.scheduleOffer!.detail.toString())),
          titleForItems('Địa điểm'),
          inputLongContentItem(CommonUtils.catchCaseStringNull(offer.preferAddress.toString())),
          titleForItems('Lưu ý'),
          inputLongContentItem(CommonUtils.catchCaseStringNull(offer.note.toString())),
          Container(
            margin: EdgeInsets.only(
              bottom: height * 0.5 / 5,
            ),
          )
        ],
      ));
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
      color: Colors.lightBlue[50],
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
      margin: EdgeInsets.only(top: height * 0.07 / 5, left: width * 0.02 / 2),
      child: Text(
        CommonUtils.catchCaseStringNull(value),
        style: TextStyle(
          fontSize: 16,
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
      color: Colors.lightBlue[50],
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
      margin: EdgeInsets.only(top: height * 0.07 / 5, left: width * 0.02 / 2),
      child: Text(
        CommonUtils.catchCaseStringNull(value),
        style: TextStyle(
          fontSize: 16,
        ),
      ),
    ),
  );
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
                fontSize: 20,
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
      color: Colors.lightBlue[50],
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
        style: TextStyle(fontSize: 16),
      ),
    ),
  );
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
    // Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
  } else {
    // Show pop up notification about fail reason.
    print('Error: ' + responseEntity.getException.toString());
  }
  return offer;
}

Offer mockOffer() {
  //Mock data
  Offer offer = new Offer();
  // UserProfile userProfile = new UserProfile();
  // userProfile.rate = '5';
  // userProfile.phoneNumber = '0123456789';
  // offer.profileAuthor = userProfile;
  // offer.subject = 'Toan';
  // offer.salary = '500k/1b';
  // offer.formatLearning = 'Hoc tai nha';
  // offer.level = 'Trung hoc';
  return offer;
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
