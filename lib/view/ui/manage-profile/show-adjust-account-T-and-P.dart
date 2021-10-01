import 'dart:io';

import 'package:dio/dio.dart';
import 'package:edu_cope/constant/user-type.dart';
import 'package:edu_cope/dto/adjust-user-profile.dart';
import 'package:edu_cope/dto/response-entity.dart';
import 'package:edu_cope/dto/user-profile.dart';
import 'package:edu_cope/service/api-account.dart';
import 'package:edu_cope/view/ui/common/widget-utils.dart';
import 'package:edu_cope/view/utils/common-utils.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ShowAdjustAccountTandPPage(userIdGlobal),
    );
  }
}

final double height = CommonUtils.height;
final double width = CommonUtils.width;
var stars = [];
String userIdGlobal = CommonUtils.currentUserId;
UserType userType = CommonUtils.currentUserType;
Image? profileImage = null;

class ShowAdjustAccountTandPPage extends StatefulWidget {
  ShowAdjustAccountTandPPage(String userId) {
    userIdGlobal = userId;
  }

  @override
  _ShowAdjustAccountTandPPageState createState() =>
      _ShowAdjustAccountTandPPageState();
}

class _ShowAdjustAccountTandPPageState
    extends State<ShowAdjustAccountTandPPage> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<UserProfile>(
        future: getUserProfile(userIdGlobal),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            UserProfile? userProfile = snapshot.data;
            return Scaffold(
              appBar: PreferredSize(
                  preferredSize: Size.fromHeight(height * 0.41 / 5),
                  child: AppBar(
                    backgroundColor: Color(WidgetUtils.valueColorAppBar),
                    leading: Container(
                        child: IconButton(
                      icon: Icon(Icons.arrow_back_ios),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    )),
                    centerTitle: true,
                    title: Container(
                      child: Text(
                        'Đánh giá',
                        style: TextStyle(
                          fontSize: CommonUtils.getUnitPx() * 20,
                        ),
                      ),
                    ),
                  )),
              body: Column(
                children: <Widget>[
                  Container(
                    height: height * 0.7 / 5,
                    decoration: BoxDecoration(
                        color: Color(0xFFf0f5f5),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(17),
                          bottomRight: Radius.circular(17),
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
                          height: height * 0.6 / 5,
                          width: width * 0.35 / 2,
                          margin: EdgeInsets.only(
                            left: width * 0.8 / 4,
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
                                  image: profileImage != null
                                      ? profileImage!.image
                                      : NetworkImage(
                                          'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg'))),
                        ),
                        Container(
                          width: width * 0.8 / 2,
                          height: height * 0.6 / 5,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.only(
                                  top: height * 0.15 / 5,
                                  left: width * 0.05 / 2,
                                ),
                                child: Text(
                                  CommonUtils.catchCaseStringNull(
                                      userProfile!.fullName),
                                  style: TextStyle(
                                    color: Color(0xFF1298e0),
                                    fontSize: CommonUtils.getUnitPx() * 20,
                                  ),
                                ),
                              ),
                              showRating(userProfile.rate, width * 0.8 / 2,
                                  width * 0.05 / 2),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: height * 3.15 / 5,
                    margin: EdgeInsets.only(
                      top: height * 0.05 / 5,
                    ),
                    child: (userProfile.adjustUserProfileList != null)
                        ? ListView.builder(
                            itemCount:
                                userProfile.adjustUserProfileList!.length,
                            itemBuilder: (context, index) {
                              return showOverviewAdjustment(
                                  userProfile.adjustUserProfileList![index]);
                            })
                        : Container(
                            child: Text(
                              'Hiện bạn chưa nhận được đánh giá nào',
                              style: TextStyle(
                                  fontSize: CommonUtils.getUnitPx() * 18,
                                  color: Colors.grey),
                            ),
                          ),
                  ),
                  WidgetUtils.mainButton(context, 0, userType),
                ],
              ),
            );
          }
          return Container();
        });
  }
}

Container showOverviewAdjustment(AdjustUserProfile adjustUserProfile) {

  Image? profileImageInternal = null;
  // Convert base64 to image
  if (adjustUserProfile != null &&
      adjustUserProfile.userAdjust != null &&
      adjustUserProfile.userAdjust!.urlImageProfile != null &&
      adjustUserProfile.userAdjust!.urlImageProfile != ' ') {
    profileImageInternal = new Image.memory(WidgetUtils.dataFromBase64String(
        adjustUserProfile.userAdjust!.urlImageProfile.toString()));
  }

  return Container(
    height: height / 5,
    width: width * 1.4 / 2,
    margin: EdgeInsets.only(
      top: height * 0.1 / 5,
      right: width * 0.1 / 2,
      left: width * 0.2 / 2,
    ),
    decoration: BoxDecoration(
        color: Color(0xFFe9f0ef),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(17),
          topLeft: Radius.circular(27),
          bottomRight: Radius.circular(17),
          topRight: Radius.circular(27),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            offset: Offset(0, 4),
          ),
        ]),
    child: TextButton(
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
                    child: CircleAvatar(
                      radius: height * 0.19 / 5,
                      backgroundColor: Color(0xFFe1f5f2),
                      child: CircleAvatar(
                        radius: height * 0.18 / 5,
                        backgroundImage: profileImageInternal != null
                            ? profileImageInternal.image
                            : NetworkImage(
                                'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg'),
                      ),
                    )),
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
                                    adjustUserProfile.userAdjust!.fullName),
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: CommonUtils.getUnitPx() * 20,
                                ),
                              ))),
                      Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            CommonUtils.getDayMonthYearFromDateString(
                                adjustUserProfile.dateAdjust.toString()),
                            style: TextStyle(
                              color: Colors.black54,
                              fontSize: CommonUtils.getUnitPx() * 14,
                            ),
                          ))
                    ],
                  ),
                ),
                showRating(
                    adjustUserProfile.rate, width * 0.3 / 2, width * 0.06 / 2),
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
                  fontSize: CommonUtils.getUnitPx() * 18,
                  fontStyle: FontStyle.italic),
            ),
          ),
        ],
      ),
    ),
  );
}

Widget showRating(String? rate, double widthSize, double starSize) {
  if (rate != null) {
    stars = CommonUtils.mapNumStarsToListStars(rate);
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
  } else
    return Container();
}

Future<UserProfile> getUserProfile(String userId) async {
  UserProfile userProfile = new UserProfile();
  APIAcountClient apiAcountClient =
      APIAcountClient(Dio(BaseOptions(contentType: "application/json")));
  ResponseEntity responseEntity =
      await apiAcountClient.getUserProfileById(userId);
  if (responseEntity.getStatus == HttpStatus.ok) {
    UserProfile response = UserProfile.fromJson(responseEntity.data);
    print('Id: ' + response.id.toString());

    // Get image from profileAuthor
    profileImage = WidgetUtils.getImageFromUserProfile(response);

    return response;
  } else {
    print('Error: ' + responseEntity.getException.toString());
  }
  return userProfile;
}
