import 'dart:io';

import 'package:dio/dio.dart';
import 'package:edu_cope/constant/user-type.dart';
import 'package:edu_cope/dto/response-entity.dart';
import 'package:edu_cope/dto/user-information.dart';
import 'package:edu_cope/service/api-account.dart';
import 'package:edu_cope/view/ui/common/widget-utils.dart';
import 'package:edu_cope/view/ui/manage-profile/edit-profile-basic-information-T-and-P.dart';
import 'package:edu_cope/view/utils/common-utils.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

final double height = CommonUtils.height;
final double width = CommonUtils.width;
final String userId = '607a8b832ea23669aaea68e3';
UserType userType = UserType.TEACHER;

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // title: 'Edu Cope',
      // theme: ThemeData(
      //   primarySwatch: Colors.blue,
      // ),
      home: ProfileBasicInformationTandPPage(),
    );
  }
}

class ProfileBasicInformationTandPPage extends StatefulWidget {
  ProfileBasicInformationTandPPage();

  @override
  _ProfileBasicInformationTandPPageState createState() =>
      _ProfileBasicInformationTandPPageState();
}

class _ProfileBasicInformationTandPPageState
    extends State<ProfileBasicInformationTandPPage> {
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
              Navigator.pop(context);
            },
          ),
        ),
        centerTitle: true,
        title: Text(
          'Thông tin cá nhân',
          style: TextStyle(
            fontSize: 24,
          ),
        ),
      ),
      body: FutureBuilder<UserInformation>(
        future: getUserInformation(userId),
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
                          height: height / 5,
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
                              Container(
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
                              ),
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
                      ],
                    ),
                  ),
                ),
                WidgetUtils.mainButton(context, height * 0.05 / 5, userType),
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
                color: Colors.blue,
                fontSize: 20,
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

Future<UserInformation> getUserInformation(String userId) async {
  UserInformation userInformation = new UserInformation();
  APIAcountClient apiAcountClient =
      APIAcountClient(Dio(BaseOptions(contentType: "application/json")));
  ResponseEntity responseEntity =
      await apiAcountClient.getUserInformation(userId);
  if (responseEntity.getStatus == HttpStatus.ok) {
    UserInformation response = UserInformation.fromJson(responseEntity.data);
    print('Id: ' + response.id.toString());
    return response;
    // Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
  } else {
    // Show pop up notification about fail reason.
    print('Error: ' + responseEntity.getException.toString());
  }
  return userInformation;
}
