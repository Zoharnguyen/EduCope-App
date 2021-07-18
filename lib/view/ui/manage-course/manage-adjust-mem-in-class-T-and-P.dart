import 'dart:io';

import 'package:dio/dio.dart';
import 'package:edu_cope/dto/adjust-user-profile.dart';
import 'package:edu_cope/dto/offer.dart';
import 'package:edu_cope/dto/response-entity.dart';
import 'package:edu_cope/dto/schedule-offer.dart';
import 'package:edu_cope/dto/user-profile.dart';
import 'package:edu_cope/service/api-account.dart';
import 'package:edu_cope/service/api-offer.dart';
import 'package:edu_cope/view/ui/manage-course/manage-detail-learning-class-T-and-P.dart';
import 'package:edu_cope/view/ui/manage-profile/show-adjust-account-T-and-P.dart';
import 'package:edu_cope/view/utils/common-utils.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

final double width = CommonUtils.width;
final double height = CommonUtils.height;
String courseId = '60e394825ded485c37a643f1';
String userBeAdjustedId = "607a8b832ea23669aaea68e3";

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ManageAdjustMemInClassTandPPage(),
    );
  }
}

class ManageAdjustMemInClassTandPPage extends StatefulWidget {
  ManageAdjustMemInClassTandPPage();

  @override
  _ManageAdjustMemInClassTandPPageState createState() => _ManageAdjustMemInClassTandPPageState();
}

class _ManageAdjustMemInClassTandPPageState extends State<ManageAdjustMemInClassTandPPage> {
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
                        'Đánh giá',
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
                          'Đã đánh giá',
                          style: TextStyle(fontSize: 20),
                        ),
                        Text(
                          'Chưa đánh giá',
                          style: TextStyle(fontSize: 20),
                        ),
                      ],
                    ),
                  ),
                ),
                body: TabBarView(children: <Widget>[
                  membersClass(
                      getMemByAdjustStatus(_offer.memberClassList!.toList(), 'true'),
                      'true'),
                  membersClass(
                      getMemByAdjustStatus(_offer.memberClassList!.toList(), 'false'),
                      'false'),
                ]),
              ));
        } else
          return Container();
      },
    ));
  }
}

ListView membersClass(data, String adjustStatus) {
  return ListView.builder(
      scrollDirection: Axis.vertical,
      itemCount: data.length,
      itemBuilder: (context, index) {
        return _showMemberClass(data[index], context, adjustStatus);
      });
}

Widget _showMemberClass(
    UserProfile userProfile, BuildContext context, String adjustStatus) {
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
          width: width * 1.5 / 2,
          margin: EdgeInsets.only(
            left: width * 0.1 / 2,
          ),
          child: TextButton(
            onPressed: () {
              if ('false' == adjustStatus) {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AdjustMember();
                    });
              } else {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ShowAdjustAccountTandPPage()));
              }
            },
            child: Row(
              children: <Widget>[
                Container(
                  height: height * 0.4 / 5,
                  child: new Image.asset('asset/image/personal.png'),
                ),
                Container(
                  margin: EdgeInsets.only(
                    left: width * 0.1 / 2,
                  ),
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
      ],
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

class AdjustMember extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Offer>(
        future: getOfferById(courseId),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            Offer? _offer = snapshot.data;
            List<UserProfile> memberClass = getMemberClass(_offer!);
            return Dialog(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4.0)),
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
                              titleForItemAjust(CommonUtils.catchCaseStringNull(
                                  memberClass[0].fullName)),
                              titleForItems('Số sao'),
                              inputContentItem('5', 'rate',
                                  adjustUserProfile, height * 0.4 / 5),
                              titleForItems('Nội dung'),
                              inputContentItem(
                                  'Làm việc hiệu quả, hỗ trợ nhiệt tình',
                                  'content',
                                  adjustUserProfile,
                                  height * 0.8 / 5),
                              Container(
                                child: RaisedButton(
                                  onPressed: () {
                                    adjustMember(adjustUserProfile);
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                ManageAdjustMemInClassTandPPage()));
                                  },
                                  color: Colors.lightBlue,
                                  child: Text(
                                    'Đánh giá',
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
                        top: -40,
                        child: CircleAvatar(
                          backgroundColor: Colors.lightBlue,
                          radius: 50,
                          child: Icon(
                            Icons.add_comment_outlined,
                            color: Colors.white,
                            size: 40,
                          ),
                        )),
                  ],
                ));
          }
          return Container();
        });
  }
}

List<UserProfile> getMemByAdjustStatus(
    List<UserProfile> userProfiles, String adjustStatus) {
  List<UserProfile> result = <UserProfile>[];
  for (UserProfile userProfile in userProfiles) {
    if (adjustStatus == userProfile.adjustStatus) result.add(userProfile);
  }
  return result;
}

Future<Widget> adjustMember(AdjustUserProfile adjustUserProfile) async {
  adjustUserProfile.courseId = courseId;
  adjustUserProfile.userBeAdjustedId = userBeAdjustedId;
  adjustUserProfile.userAdjust!.fullName = 'Nguyen V AAA';
  APIAcountClient apiAcountClient =
      APIAcountClient(Dio(BaseOptions(contentType: "application/json")));
  ResponseEntity responseEntity =
      await apiAcountClient.adjustUser(adjustUserProfile);
  if (responseEntity.getStatus == HttpStatus.ok) {
    UserProfile response = UserProfile.fromJson(responseEntity.data);
    print('Id: ' + response.id.toString());
    return Text('Success!');
    // Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
  } else {
    // Show pop up notification about fail reason.
    print('Error: ' + responseEntity.getException.toString());
    return Text('Failed!');
  }
}
