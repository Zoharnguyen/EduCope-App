import 'dart:io';

import 'package:dio/dio.dart';
import 'package:edu_cope/dto/adjust-user-profile.dart';
import 'package:edu_cope/dto/response-entity.dart';
import 'package:edu_cope/dto/user-profile.dart';
import 'package:edu_cope/service/api-account.dart';
import 'package:edu_cope/view/ui/widget-utils.dart';
import 'package:edu_cope/view/utils/common-utils.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // title: 'Edu Cope',
      // theme: ThemeData(
      //   primarySwatch: Colors.blue,
      // ),
      home: ShowAdjustAccount(),
    );
  }
}

final stars = [
  'asset/image/rating-star.png',
  'asset/image/rating-star.png',
  'asset/image/rating-star.png',
];

String userId = "607a8b832ea23669aaea68e3";

class ShowAdjustAccount extends StatefulWidget {
  ShowAdjustAccount();

  @override
  _ShowAdjustAccountState createState() => _ShowAdjustAccountState();
}

class _ShowAdjustAccountState extends State<ShowAdjustAccount> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return FutureBuilder<UserProfile>(
        future: getUserProfile(userId),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            UserProfile? userProfile = snapshot.data;
            return Scaffold(
              appBar: AppBar(
                leading: Container(
                    child: IconButton(
                  icon: Icon(Icons.arrow_back_ios),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                )),
                title: Container(
                  margin: EdgeInsets.only(
                    left: width * 0.4 / 2,
                  ),
                  child: Text(
                    'Đánh giá',
                    style: TextStyle(
                      fontSize: 22,
                    ),
                  ),
                ),
              ),
              body: Column(
                children: <Widget>[
                  Container(
                    height: height * 0.7 / 5,
                    child: Row(
                      children: <Widget>[
                        Container(
                          height: height * 0.6 / 5,
                          margin: EdgeInsets.only(
                            left: width * 0.8 / 4,
                          ),
                          child: new Image.asset(
                            'asset/image/blank-account.jpg',
                          ),
                        ),
                        Container(
                          width: width * 0.8 / 2,
                          height: height * 0.6 / 5,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.only(
                                  top: height * 0.1 / 5,
                                  left: width * 0.05 / 2,
                                ),
                                child: Text(
                                  CommonUtils.catchCaseStringNull(
                                      userProfile!.fullName),
                                  style: TextStyle(
                                    color: Colors.blue,
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                              showRating(
                                  stars, width * 0.8 / 2, width * 0.1 / 2),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: height * 3.2 / 5,
                    margin: EdgeInsets.only(
                      top: height * 0.05 / 5,
                    ),
                    child: ListView.builder(
                        itemCount: userProfile.adjustUserProfileList.length,
                        itemBuilder: (context, index) {
                          return showOverviewAdjustment(
                              userProfile.adjustUserProfileList[index]);
                        }),
                  ),
                  WidgetUtils.mainButton(context, 0),
                ],
              ),
            );
          }
          return Container();
        });
  }
}

Container showOverviewAdjustment(AdjustUserProfile adjustUserProfile) {
  return Container(
    height: height / 5,
    width: width * 1.4 / 2,
    margin: EdgeInsets.only(
      top: height * 0.05 / 5,
      right: width * 0.1 / 2,
      left: width * 0.2 / 2,
    ),
    decoration: BoxDecoration(
        color: Colors.lightBlue[50],
        // border: Border.all(
        //   color: Colors.green,
        //   width: 2,
        // ),
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
    child: FlatButton(
      onPressed: () {},
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            height: height * 0.4 / 5,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  width: width * 0.25 / 2,
                  margin: EdgeInsets.only(
                    left: width * 0.05 / 2,
                    right: width * 0.07 / 2,
                  ),
                  child: new Image.asset('asset/image/personal.png'),
                ),
                Container(
                  margin: EdgeInsets.only(
                    top: height * 0.05 / 5,
                    right: width * 0.05 / 2,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                CommonUtils.catchCaseStringNull(
                                    adjustUserProfile.userAdjust.fullName),
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                ),
                              ))),
                      Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            CommonUtils.getDayMonthYearFromDateString(
                                adjustUserProfile.dateAdjust),
                            style: TextStyle(
                              color: Colors.black54,
                              fontSize: 14,
                            ),
                          ))
                    ],
                  ),
                ),
                showRating(stars, width * 0.3 / 2, width * 0.06 / 2),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              top: height * 0.03 / 5,
              left: width * 0.05 / 2,
            ),
            child: Text(
              CommonUtils.catchCaseStringNull(adjustUserProfile.content),
              style: TextStyle(
                  color: Colors.black54,
                  fontSize: 18,
                  fontStyle: FontStyle.italic),
            ),
          ),
        ],
      ),
    ),
  );
}

Widget showRating(List<String> stars, double widthSize, double starSize) {
  return Expanded(
    child: Container(
      width: widthSize,
      margin: EdgeInsets.only(
        left: width * 0.05 / 2,
      ),
      child: new ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: stars.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              margin: EdgeInsets.only(
                left: width * 0.01 / 2,
              ),
              width: starSize,
              child: new Image.asset(
                stars[index],
                fit: BoxFit.fitWidth,
              ),
            );
          }),
    ),
  );
}

Future<UserProfile> getUserProfile(String userId) async {
  UserProfile userProfile = new UserProfile();
  APIAcountClient apiAcountClient =
      APIAcountClient(Dio(BaseOptions(contentType: "application/json")));
  ResponseEntity responseEntity =
      await apiAcountClient.getUserProfileById(userId);
  if (responseEntity.getStatus == HttpStatus.ok) {
    UserProfile response = UserProfile.fromJson(responseEntity.data);
    print('Id: ' + response.id);
    return response;
    // Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
  } else {
    // Show pop up notification about fail reason.
    print('Error: ' + responseEntity.getException.toString());
  }
  return userProfile;
}
