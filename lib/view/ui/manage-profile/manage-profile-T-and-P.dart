import 'dart:io';

import 'package:dio/dio.dart';
import 'package:edu_cope/constant/user-type.dart';
import 'package:edu_cope/dto/chat-overview-dto.dart';
import 'package:edu_cope/dto/response-entity.dart';
import 'package:edu_cope/dto/user-profile.dart';
import 'package:edu_cope/service/api-account.dart';
import 'package:edu_cope/view/ui/chat/detail-chat.dart';
import 'package:edu_cope/view/ui/common/developing-feature-screen-T-and-P.dart';
import 'package:edu_cope/view/ui/common/widget-utils.dart';
import 'package:edu_cope/view/ui/manage-profile/profile-basic-information-T-and-P.dart';
import 'package:edu_cope/view/ui/manage-profile/show-adjust-account-T-and-P.dart';
import 'package:edu_cope/view/utils/common-utils.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

double width = CommonUtils.width;
double height = CommonUtils.height;
String userIdGlobal = CommonUtils.currentUserId;
String userCurrentIdGlobal = CommonUtils.currentUserId;
var stars = [];
UserType userType = CommonUtils.currentUserType;
String chatIdGlobal = '';
String? imageId = "";
Image? profileImage = null;

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ManageProfileTandPPage(userIdGlobal),
    );
  }
}

class ManageProfileTandPPage extends StatefulWidget {
  ManageProfileTandPPage(String userId) {
    userIdGlobal = userId;
  }

  @override
  _ManageProfileTandPPageState createState() => _ManageProfileTandPPageState();
}

class _ManageProfileTandPPageState extends State<ManageProfileTandPPage> {
  @override
  void initState() {
    super.initState();
    getListChat(userCurrentIdGlobal).then((value) {
      if (value != null && value.length > 0) {
        setValueForChatIdGlobal(value, userIdGlobal);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(height * 0.41 / 5),
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
                  Navigator.pop(context);
                },
              ),
            ),
            centerTitle: true,
            title: Text(
              'Hồ sơ',
              style: TextStyle(
                fontSize: CommonUtils.getUnitPx() * 20,
              ),
            ),
          )),
      body: Column(
        children: <Widget>[
          UserProfileOverview(),
          showButtonPerson(
              'Thông tin cá nhân', 'asset/image/personal.png', context),
          showButtonPerson('Đánh giá', 'asset/image/comment.png', context),
          showButtonPerson('Cài đặt', 'asset/image/setting.png', context),
          userCurrentIdGlobal == userIdGlobal
              ? showButtonPerson(
                  'Đăng xuất', 'asset/image/sign-out.png', context)
              : showButtonPerson(
                  'Báo cáo', 'asset/image/sign-out.png', context),
          WidgetUtils.mainButton(context, height * 0.31 / 5, userType),
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
                            builder: (context) =>
                                ProfileBasicInformationTandPPage(
                                    userIdGlobal, '')));
                  } else if (nameButton == 'Đánh giá') {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                ShowAdjustAccountTandPPage(userIdGlobal)));
                  } else {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                DevelopingFeatureScreenTandPPage()));
                  }
                },
                child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      nameButton,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: CommonUtils.getUnitPx() * 20,
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
        future: getUserProfileById(userIdGlobal),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            UserProfile? data = snapshot.data;
            return Column(
              children: <Widget>[
                Container(
                  height: height / 5,
                  width: width,
                  margin: EdgeInsets.only(
                    top: height * 0.1 / 5,
                    bottom: height * 0.04 / 5,
                  ),
                  child: Row(
                    children: <Widget>[
                      Container(
                          width: width / 2,
                          height: height / 5,
                          margin: EdgeInsets.only(
                            left: width * 0.9 / 4,
                          ),
                          child: CircleAvatar(
                            radius: height * 0.5 / 5,
                            backgroundColor: Color(0xFFe1f5f2),
                            child: CircleAvatar(
                              radius: height * 0.48 / 5,
                              backgroundImage: profileImage != null
                                  ? profileImage!.image
                                  : NetworkImage(
                                      'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg'),
                            ),
                          )),
                      Container(
                        height: height / 5,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            showRatingStars(data!.rate, stars),
                            userCurrentIdGlobal != userIdGlobal
                                ? Container(
                                    child: IconButton(
                                    icon: const Icon(Icons.mark_chat_unread),
                                    color: Color(0xFF94bd62),
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => DetailChat(
                                                  '',
                                                  chatIdGlobal,
                                                  CommonUtils
                                                      .catchCaseStringNull(
                                                          data.fullName),
                                                  CommonUtils
                                                      .catchCaseStringNull(
                                                          data.id),
                                                  profileImage)));
                                    },
                                  ))
                                : new Container(),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: height * 0.2 / 5,
                  margin: EdgeInsets.only(
                    right: width * 0.08 / 2,
                  ),
                  child: Text(
                    CommonUtils.catchCaseStringNull(data.fullName),
                    style: TextStyle(
                      color: Color(0xFF1298e0),
                      fontSize: CommonUtils.getUnitPx() * 20,
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
                      fontSize: CommonUtils.getUnitPx() * 20,
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

void setValueForChatIdGlobal(
    List<ChatOverviewDto> chatOverviewDtos, String partnerId) {
  if (partnerId != null && partnerId != '') {
    for (ChatOverviewDto chatOverviewDto in chatOverviewDtos) {
      if (partnerId == chatOverviewDto.partnerId) {
        chatIdGlobal = chatOverviewDto.chatId!;
        return;
      }
    }
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
    // Get image from userProfile
    profileImage = WidgetUtils.getImageFromUserProfile(response);
    return response;
  } else {
    print('Error: ' + responseEntity.getException.toString());
  }
  return userProfile;
}

Future<List<ChatOverviewDto>> getListChat(String userId) async {
  APIAcountClient apiAcountClient =
      APIAcountClient(Dio(BaseOptions(contentType: "application/json")));
  ResponseEntity responseEntity = await apiAcountClient.getListChat(userId);
  if (responseEntity.getStatus == HttpStatus.ok) {
    List listDecoded = responseEntity.data;
    ChatOverviewDto response = ChatOverviewDto.fromJson(responseEntity.data[0]);
    print('Id: ' + response.chatId.toString());
    return listDecoded
        .map((chatOverviewDto) => new ChatOverviewDto.fromJson(chatOverviewDto))
        .toList();
  } else {
    print('Error: ' + responseEntity.getException.toString());
  }
  return <ChatOverviewDto>[];
}

Expanded showRatingStars(String? rate, List stars) {
  if (rate != null) {
    stars = CommonUtils.mapNumStarsToListStars(rate);
    return Expanded(
      child: Container(
        width: width * 0.5 / 2,
        height: height * 0.3 / 5,
        margin: EdgeInsets.only(
          top: height * 0.3 / 5,
        ),
        child: new ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: stars.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                margin: EdgeInsets.only(
                  left: width * 0.01 / 2,
                ),
                width: width * 0.09 / 2,
                child: new Image.asset(
                  stars[index],
                  fit: BoxFit.fitWidth,
                ),
              );
            }),
      ),
    );
  } else
    return Expanded(
      child: Container(),
    );
}
