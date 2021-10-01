import 'dart:io';

import 'package:dio/dio.dart';
import 'package:edu_cope/constant/from-screen.dart';
import 'package:edu_cope/constant/user-type.dart';
import 'package:edu_cope/dto/response-entity.dart';
import 'package:edu_cope/dto/user-information.dart';
import 'package:edu_cope/service/api-account.dart';
import 'package:edu_cope/view/ui/common/widget-utils.dart';
import 'package:edu_cope/view/ui/manage-profile/edit-profile-basic-information-T-and-P.dart';
import 'package:edu_cope/view/ui/manage-profile/manage-profile-T-and-P.dart';
import 'package:edu_cope/view/utils/common-utils.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

final double height = CommonUtils.height;
final double width = CommonUtils.width;
String userIdGlobal = CommonUtils.currentUserId;
UserType userType = CommonUtils.currentUserType;
String previousScreenGlobal = '';
Image? profileImage = null;

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:
          ProfileBasicInformationTandPPage(userIdGlobal, previousScreenGlobal),
    );
  }
}

class ProfileBasicInformationTandPPage extends StatefulWidget {
  ProfileBasicInformationTandPPage(String userId, String previousScreen) {
    userIdGlobal = userId;
    previousScreenGlobal = previousScreen;
  }

  @override
  _ProfileBasicInformationTandPPageState createState() =>
      _ProfileBasicInformationTandPPageState();
}

class _ProfileBasicInformationTandPPageState
    extends State<ProfileBasicInformationTandPPage> {
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
                onPressed: () {
                  if (FromScreen.fromScreenEditBasicInformationProfile ==
                      previousScreenGlobal) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                ManageProfileTandPPage(userIdGlobal)));
                  } else
                    Navigator.pop(context);
                },
              ),
            ),
            centerTitle: true,
            title: Text(
              'Thông tin cá nhân',
              style: TextStyle(
                fontSize: CommonUtils.getUnitPx() * 20,
              ),
            ),
          )),
      body: FutureBuilder<UserInformation>(
        future: getUserInformation(userIdGlobal),
        builder: (context, snapshot) {
          UserInformation userInformation = new UserInformation();
          if (snapshot.hasData) {
            userInformation = snapshot.data!;
            return Column(
              children: <Widget>[
                Container(
                  height: height * 3.9 / 5,
                  child: SingleChildScrollView(
                    child: Column(
                      children: <Widget>[
                        Container(
                          height: height * 1.7 / 5,
                          margin: EdgeInsets.only(
                            top: height * 0.02 / 5,
                          ),
                          child: Row(
                            children: <Widget>[
                              Container(
                                width: width / 2,
                                height: height * 1.7 / 5,
                                margin: EdgeInsets.only(
                                  left: width * 0.9 / 4,
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
                              // Check if profile is currentUser
                              checkIfProfileIsCurrentUser(
                                      userIdGlobal, CommonUtils.currentUserId)
                                  ? Container(
                                      width: width * 0.4 * 0.7 / 2,
                                      height: height * 0.5 * 0.7 / 5,
                                      margin: EdgeInsets.only(
                                          bottom: height * 0.55 / 5,
                                          left: width * 0.2 / 2),
                                      child: IconButton(
                                        onPressed: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      EditProfileBasicInformationTandPPage()));
                                        },
                                        icon: new Image.asset(
                                          'asset/image/edit.png',
                                        ),
                                      ),
                                    )
                                  : Container(),
                            ],
                          ),
                        ),
                        titleForItems('Họ và tên'),
                        inputShortContentItem(
                            CommonUtils.catchCaseStringNull(
                                userInformation.fullName),
                            height * 0.3 / 5),
                        titleForItems('Số điện thoại'),
                        inputShortContentItem(
                            CommonUtils.catchCaseStringNull(
                                userInformation.phoneNumber),
                            height * 0.3 / 5),
                        titleForItems('Ngày sinh'),
                        inputShortContentItem(
                            CommonUtils.catchCaseStringNull(
                                userInformation.doB),
                            height * 0.3 / 5),
                        titleForItems('Giới thiệu'),
                        inputShortContentItem(
                            CommonUtils.catchCaseStringNull(
                                userInformation.introduction),
                            height * 0.6 / 5),
                        titleForItems('Kinh nghiệm'),
                        inputShortContentItem(
                            CommonUtils.catchCaseStringNull(
                                userInformation.experience),
                            height * 0.6 / 5),
                        titleForItems('Địa chỉ'),
                        inputShortContentItem(
                            CommonUtils.catchCaseStringNull(
                                userInformation.address),
                            height * 0.6 / 5),
                        Container(
                          margin: EdgeInsets.only(
                            top: height * 0.5 / 5,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                WidgetUtils.mainButton(context, height * 0 / 5, userType),
              ],
            );
          }
          return Container();
        },
      ),
    );
  }
}

Container titleForItems(String initialValueTitle) {
  return Container(
    height: height * 0.35 / 5,
    child: Row(
      children: <Widget>[
        Container(
            // width: width * 0.3 / 2,
            margin: EdgeInsets.only(
              left: width * 0.15 / 2,
            ),
            child: Text(
              initialValueTitle,
              style: TextStyle(
                color: Color(0xFF1298e0),
                fontSize: CommonUtils.getUnitPx() * 20,
                fontStyle: FontStyle.italic,
              ),
            )),
      ],
    ),
  );
}

Container inputShortContentItem(String value, double heightItem) {
  return Container(
    height: heightItem,
    width: width * 1.3 / 2,
    margin: EdgeInsets.only(
      right: width * 0.2 / 2,
      left: width * 0.3 / 2,
    ),
    decoration: BoxDecoration(
      color: Color(0xFFe9f0ef),
      border: Border.all(
        color: Colors.grey.shade400,
        width: 1,
      ),
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(25),
        topRight: Radius.circular(8),
        bottomLeft: Radius.circular(8),
        bottomRight: Radius.circular(25),
      ),
    ),
    child: Container(
      margin: EdgeInsets.only(top: height * 0.07 / 5, left: width * 0.02 / 2),
      child: Text(
        CommonUtils.catchCaseStringNull(value),
        style: TextStyle(
          fontSize: CommonUtils.getUnitPx() * 16,
        ),
      ),
    ),
  );
}

Future<UserInformation> getUserInformation(String userId) async {
  UserInformation userInformation = new UserInformation();
  APIAcountClient apiAcountClient =
      APIAcountClient(Dio(BaseOptions(contentType: "application/json")));
  ResponseEntity responseEntity =
      await apiAcountClient.getUserInformation(userId);
  if (responseEntity.getStatus == HttpStatus.ok) {
    UserInformation response = UserInformation.fromJson(responseEntity.data);

    // Get Image of user
    profileImage = WidgetUtils.getImageFromUserInformation(response);

    print('Id: ' + response.id.toString());
    return response;
  } else {
    print('Error: ' + responseEntity.getException.toString());
  }
  return userInformation;
}

bool checkIfProfileIsCurrentUser(String userProfileId, String currentUserId) {
  if (userProfileId == null || currentUserId == null) return false;
  if (userProfileId == currentUserId) return true;
  return false;
}
