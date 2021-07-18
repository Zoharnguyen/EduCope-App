import 'dart:io';

import 'package:dio/dio.dart';
import 'package:edu_cope/dto/response-entity.dart';
import 'package:edu_cope/dto/user-profile.dart';
import 'package:edu_cope/service/api-account.dart';
import 'package:edu_cope/view/ui/common/developing-feature-screen-T-and-P.dart';
import 'package:edu_cope/view/ui/common/widget-utils.dart';
import 'package:edu_cope/view/ui/manage-profile/profile-basic-information-T-and-P.dart';
import 'package:edu_cope/view/ui/manage-profile/show-adjust-account-T-and-P.dart';
import 'package:edu_cope/view/utils/common-utils.dart';
import 'package:flutter/material.dart';

import '../homepage-T.dart';

void main() {
  runApp(MyApp());
}

double width = 411.4285;
double height = 683.4285;
String userId = '607a8b832ea23669aaea68e3';
final stars = [
  'asset/image/rating-star.png',
  'asset/image/rating-star.png',
  'asset/image/rating-star.png',
];

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // title: 'Edu Cope',
      // theme: ThemeData(
      //   primarySwatch: Colors.blue,
      // ),
      home: ManageProfileTandPPage(),
    );
  }
}

class ManageProfileTandPPage extends StatefulWidget {
  ManageProfileTandPPage();

  @override
  _ManageProfileTandPPageState createState() => _ManageProfileTandPPageState();
}

class _ManageProfileTandPPageState extends State<ManageProfileTandPPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        leading: Container(
          margin: EdgeInsets.only(
            top: height * 0.04 / 5,
          ),
          child: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            // iconSize: 20,
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => HomePageT()));
            },
          ),
        ),
        centerTitle: true,
        title: Text(
          'Hồ sơ',
          style: TextStyle(
            fontSize: 24,
          ),
        ),
      ),
      body: Column(
        children: <Widget>[
          UserProfileOverview(),
          showButtonPerson(
              'Thông tin cá nhân', 'asset/image/personal.png', context),
          showButtonPerson('Đánh giá', 'asset/image/comment.png', context),
          showButtonPerson('Cài đặt', 'asset/image/setting.png', context),
          showButtonPerson('Đăng xuất', 'asset/image/sign-out.png', context),
          WidgetUtils.mainButton(context, height * 0.4 / 5),
        ],
      ),
    );
  }
}

Container showButtonPerson(
    String nameButton, String uriImage, BuildContext context) {
  return Container(
    height: height * 0.35 / 5,
    margin: EdgeInsets.only(
      top: height * 0.03 / 5,
      bottom: height * 0.02 / 5,
    ),
    child: Row(
      children: <Widget>[
        Container(
          width: width * 0.2 / 2,
          margin: EdgeInsets.only(
            left: width * 0.35 / 2,
          ),
          child: new Image.asset(uriImage),
        ),
        Container(
            width: width * 1.2 / 2,
            margin: EdgeInsets.only(
              left: width * 0.1 / 2,
            ),
            child: TextButton(
                onPressed: () {
                  if (nameButton == 'Thông tin cá nhân') {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ProfileBasicInformationTandPPage()));
                  } else if (nameButton == 'Đánh giá') {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ShowAdjustAccountTandPPage()));
                  } else {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DevelopingFeatureScreenTandPPage()));
                  }
                },
                child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      nameButton,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                      ),
                    )))),
      ],
    ),
  );
}

class UserProfileOverview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<UserProfile>(
        future: getUserProfileById(userId),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            UserProfile? data = snapshot.data;
            return Column(
              children: <Widget>[
                Container(
                  height: height / 5,
                  margin: EdgeInsets.only(
                    top: height * 0.1 / 5,
                  ),
                  // decoration: BoxDecoration(
                  //   border: Border.all(
                  //     color: Colors.green,
                  //     width: 2,
                  //   )
                  // ),
                  child: Row(
                    children: <Widget>[
                      Container(
                        width: width / 2,
                        height: height / 5,
                        margin: EdgeInsets.only(
                          left: width * 0.9 / 4,
                        ),
                        child: new Image.asset(
                          'asset/image/blank-account.jpg',
                        ),
                      ),
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.only(
                            top: height * 0.7 / 5,
                          ),
                          child: new ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: stars.length,
                              itemBuilder: (BuildContext context, int index) {
                                return Container(
                                  margin: EdgeInsets.only(
                                    left: width * 0.01 / 2,
                                  ),
                                  width: width * 0.1 / 2,
                                  // decoration: BoxDecoration(
                                  //     border: Border.all(
                                  //   color: Colors.green,
                                  //   width: 1,
                                  // )),
                                  child: new Image.asset(
                                    stars[index],
                                    fit: BoxFit.fitWidth,
                                  ),
                                );
                              }),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: height * 0.2 / 5,
                  child: Text(
                    CommonUtils.catchCaseStringNull(data!.fullName),
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 20,
                    ),
                  ),
                ),
                Container(
                  height: height * 0.4 / 5,
                  width: width * 1.3 / 2,
                  margin: EdgeInsets.only(
                    top: height * 0.08 / 5,
                    bottom: height * 0.18 / 5,
                  ),
                  child: Text(
                    CommonUtils.catchCaseStringNull(data.introduction),
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: 20,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            );
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }
          return Text("${snapshot.error}");
        });
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
    // Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
  } else {
    // Show pop up notification about fail reason.
    print('Error: ' + responseEntity.getException.toString());
  }
  return userProfile;
}
