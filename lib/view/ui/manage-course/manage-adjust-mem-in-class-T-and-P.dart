import 'dart:io';

import 'package:dio/dio.dart';
import 'package:edu_cope/dto/adjust-user-profile.dart';
import 'package:edu_cope/dto/offer.dart';
import 'package:edu_cope/dto/response-entity.dart';
import 'package:edu_cope/dto/schedule-offer.dart';
import 'package:edu_cope/dto/user-profile.dart';
import 'package:edu_cope/service/api-account.dart';
import 'package:edu_cope/service/api-offer.dart';
import 'package:edu_cope/view/ui/common/widget-utils.dart';
import 'package:edu_cope/view/ui/homepage-T-and-P.dart';
import 'package:edu_cope/view/ui/manage-course/manage-detail-learning-class-T-and-P.dart';
import 'package:edu_cope/view/ui/manage-profile/show-adjust-account-T-and-P.dart';
import 'package:edu_cope/view/utils/common-utils.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

final double width = CommonUtils.width;
final double height = CommonUtils.height;
String courseIdGlobal = '';
String userIdGlobal = CommonUtils.currentUserId;
UserProfile userProfileCurrentGlobal = new UserProfile();

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ManageAdjustMemInClassTandPPage(courseIdGlobal),
    );
  }
}

class ManageAdjustMemInClassTandPPage extends StatefulWidget {
  ManageAdjustMemInClassTandPPage(String courseId) {
    courseIdGlobal = courseId;
  }

  @override
  _ManageAdjustMemInClassTandPPageState createState() =>
      _ManageAdjustMemInClassTandPPageState();
}

class _ManageAdjustMemInClassTandPPageState
    extends State<ManageAdjustMemInClassTandPPage> {
  Offer _offer = new Offer.withScheduleAndUserProfile(
      new ScheduleOffer(), new UserProfile());

  @override
  initState() {
    super.initState();
    getUserProfileById(userIdGlobal).then((value) {
      if (value != null) userProfileGlobal = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder<Offer>(
      future: getOfferById(courseIdGlobal),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          _offer = snapshot.data!;
          return DefaultTabController(
              length: 2,
              child: Scaffold(
                appBar: PreferredSize(
                  preferredSize: Size(width * 0.9, height * 0.6 / 5),
                  child: AppBar(
                    backgroundColor: Color(WidgetUtils.valueColorAppBar),
                    centerTitle: true,
                    title: Container(
                      child: Text(
                        'Đánh giá',
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
                    bottom: TabBar(
                      tabs: <Widget>[
                        Text(
                          'Đã đánh giá',
                          style: TextStyle(fontSize: CommonUtils.getUnitPx() * 20, fontStyle: FontStyle.italic),
                        ),
                        Text(
                          'Chưa đánh giá',
                          style: TextStyle(fontSize: CommonUtils.getUnitPx() * 20, fontStyle: FontStyle.italic),
                        ),
                      ],
                    ),
                  ),
                ),
                body: TabBarView(children: <Widget>[
                  membersClass(
                      getMemByAdjustStatus(
                          _offer.memberClassList ?? <UserProfile>[], 'true')),
                  membersClass(
                      getMemByAdjustStatus(
                          _offer.memberClassList ?? <UserProfile>[], 'false')),
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
        return _showMemberClass(data[index], context);
      });
}

Widget _showMemberClass(UserProfile userProfile, BuildContext context) {
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
    child: Row(
      children: <Widget>[
        Container(
          width: width * 1.5 / 2,
          margin: EdgeInsets.only(
            left: width * 0.1 / 2,
          ),
          child: TextButton(
            onPressed: () {
              if ('false' ==
                  CommonUtils.catchCaseStringNull(userProfile.adjustStatus)) {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AdjustMember(userProfile);
                    });
              } else {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ShowAdjustAccountTandPPage(
                            CommonUtils.catchCaseStringNull(userProfile.id))));
              }
            },
            child: Row(
              children: <Widget>[
                Container(
                  height: height * 0.4 / 5,
                  child: CircleAvatar(
                    radius: height * 0.19 / 5,
                    backgroundColor: Color(0xFFe1f5f2),
                    child: CircleAvatar(
                      radius: height * 0.18 / 5,
                      backgroundImage:
                      AssetImage('asset/image/profile-image-1.jpeg'),
                    ),
                  ),
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
                          style: TextStyle(fontSize: CommonUtils.getUnitPx() * 16, color: Colors.black87),
                        ),
                      ),
                      Container(
                        width: width * 0.5 / 2,
                        margin: EdgeInsets.only(
                          top: height * 0.05 / 5,
                        ),
                        child: Text(
                          CommonUtils.catchCaseStringNull(userProfile.rate),
                          style: TextStyle(fontSize: CommonUtils.getUnitPx() * 16, color: Colors.black87),
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
  } else {
    print('Error: ' + responseEntity.getException.toString());
  }
  return offer;
}

class AdjustMember extends StatelessWidget {
  UserProfile userProfileAdjusted = new UserProfile();

  AdjustMember(UserProfile userProfile) {
    userProfileAdjusted = userProfile;
  }

  @override
  Widget build(BuildContext context) {
    return userProfileAdjusted != null
        ? Dialog(
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
                              userProfileAdjusted.fullName)),
                          titleForItems('Số sao'),
                          inputContentItem(
                              '5', 'rate', adjustUserProfile, height * 0.4 / 5),
                          titleForItems('Nội dung'),
                          inputContentItem(
                              'Làm việc hiệu quả, hỗ trợ nhiệt tình',
                              'content',
                              adjustUserProfile,
                              height * 0.8 / 5),
                          Container(
                            child: RaisedButton(
                              onPressed: () {
                                adjustUserProfile.userBeAdjustedId =
                                    userProfileAdjusted.id;
                                adjustMember(adjustUserProfile);
                                // Remove some unnecessary screens out stack
                                Navigator.pop(context);
                                Navigator.pop(context);

                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            ManageAdjustMemInClassTandPPage(
                                                courseIdGlobal)));
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
            ))
        : new Container();
  }
}

List<UserProfile> getMemByAdjustStatus(
    List<UserProfile> userProfiles, String adjustStatus) {
  List<UserProfile> result = <UserProfile>[];
  for (UserProfile userProfile in userProfiles) {
    if (adjustStatus == userProfile.adjustStatus &&
        userIdGlobal != userProfile.id) result.add(userProfile);
  }
  return result;
}

Future<Widget> adjustMember(AdjustUserProfile adjustUserProfile) async {
  adjustUserProfile.courseId = courseIdGlobal;
  adjustUserProfile.userAdjust = userProfileGlobal;
  APIAcountClient apiAcountClient =
      APIAcountClient(Dio(BaseOptions(contentType: "application/json")));
  ResponseEntity responseEntity =
      await apiAcountClient.adjustUser(adjustUserProfile);
  if (responseEntity.getStatus == HttpStatus.ok) {
    UserProfile response = UserProfile.fromJson(responseEntity.data);
    print('Id: ' + response.id.toString());
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
