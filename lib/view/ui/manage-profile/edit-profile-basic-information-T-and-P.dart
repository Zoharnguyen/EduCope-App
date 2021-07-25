import 'dart:io';

import 'package:dio/dio.dart';
import 'package:edu_cope/dto/response-entity.dart';
import 'package:edu_cope/dto/user-information.dart';
import 'package:edu_cope/service/api-account.dart';
import 'package:edu_cope/view/ui/manage-profile/profile-basic-information-T-and-P.dart';
import 'package:edu_cope/view/utils/common-utils.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

final double height = CommonUtils.height;
final double width = CommonUtils.width;
final String userId = '607a8b832ea23669aaea68e3';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // title: 'Edu Cope',
      // theme: ThemeData(
      //   primarySwatch: Colors.blue,
      // ),
      home: EditProfileBasicInformationTandPPage(),
    );
  }
}

class EditProfileBasicInformationTandPPage extends StatefulWidget {
  EditProfileBasicInformationTandPPage();

  @override
  _EditProfileBasicInformationTandPPageState createState() =>
      _EditProfileBasicInformationTandPPageState();
}

class _EditProfileBasicInformationTandPPageState
    extends State<EditProfileBasicInformationTandPPage> {
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
          'Cập nhật',
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
            return SingleChildScrollView(
              reverse: false,
              // padding: EdgeInsets.only(
              //   bottom: bottomKeyboard * 0.1,
              // ),
              child: Column(
                children: <Widget>[
                  Container(
                    width: width / 2,
                    height: height / 5,
                    child: new Image.asset(
                      'asset/image/blank-account.jpg',
                    ),
                  ),
                  titleForItems('Họ và tên'),
                  inputContentItem(
                      CommonUtils.catchCaseStringNull(userInformation.fullName),
                      1,
                      userInformation,
                      'fullName'),
                  titleForItems('Số điện thoại'),
                  inputContentItem(
                      CommonUtils.catchCaseStringNull(
                          userInformation.phoneNumber),
                      1,
                      userInformation,
                      'phoneNumber'),
                  titleForItems('Ngày sinh'),
                  inputContentItem(
                      CommonUtils.catchCaseStringNull(userInformation.doB),
                      1,
                      userInformation,
                      'doB'),
                  titleForItems('Giới thiệu'),
                  inputContentItem(
                      CommonUtils.catchCaseStringNull(
                          userInformation.introduction),
                      2,
                      userInformation,
                      'introduction'),
                  titleForItems('Kinh nghiệm'),
                  inputContentItem(
                      CommonUtils.catchCaseStringNull(
                          userInformation.experience),
                      2,
                      userInformation,
                      'experience'),
                  titleForItems('Địa chỉ'),
                  inputContentItem(
                      CommonUtils.catchCaseStringNull(userInformation.address),
                      2,
                      userInformation,
                      'address'),
                  Container(
                    height: height * 0.3 / 5,
                    width: width * 0.6 / 2,
                    margin: EdgeInsets.only(
                        top: height * 0.3 / 5, bottom: height * 0.2 / 5),
                    decoration: BoxDecoration(
                        color: Colors.blue[300],
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
                      child: Text(
                        "Cập nhật",
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontFamily: "Roboto",
                            fontStyle: FontStyle.normal),
                      ),
                      onPressed: () {
                        updateUserInformation(userInformation);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    ProfileBasicInformationTandPPage()));
                      },
                    ),
                  )
                ],
              ),
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

Container inputContentItem(String contentItem, int maxLine,
    UserInformation userInformation, String fieldName) {
  print("contentItem: " + contentItem);
  setValueFieldsForUserInformation(userInformation, fieldName, contentItem);
  return Container(
    margin: EdgeInsets.only(
      right: width * 0.2 / 2,
      left: width * 0.3 / 2,
    ),
    child: TextFormField(
      autofocus: false,
      maxLines: maxLine,
      cursorWidth: 2,
      cursorHeight: 25,
      initialValue: contentItem,
      onChanged: (text) {
        setValueFieldsForUserInformation(userInformation, fieldName, text);
      },
      decoration: InputDecoration(
        hintStyle: TextStyle(
          fontSize: 14,
          color: Colors.grey,
        ),
        // border: OutlineInputBorder(
        //   borderSide: BorderSide(
        //     width: 1,
        //   ),
        // ),
      ),
    ),
  );
}

void setValueFieldsForUserInformation(
    UserInformation userInformation, String fieldName, String value) {
  if ('fullName' == fieldName) userInformation.fullName = value;
  if ('phoneNumber' == fieldName) userInformation.phoneNumber = value;
  if ('doB' == fieldName) userInformation.doB = value;
  if ('introduction' == fieldName) userInformation.introduction = value;
  if ('experience' == fieldName) userInformation.experience = value;
  if ('address' == fieldName) userInformation.address = value;
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

void updateUserInformation(UserInformation userInformation) async {
  APIAcountClient apiAcountClient =
      APIAcountClient(Dio(BaseOptions(contentType: "application/json")));
  ResponseEntity responseEntity =
      await apiAcountClient.updateUserInformation(userInformation);
  if (responseEntity.getStatus == HttpStatus.ok) {
    UserInformation response = UserInformation.fromJson(responseEntity.data);
    print('Id: ' + response.id.toString());
    // Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
  } else {
    // Show pop up notification about fail reason.
    print('Error: ' + responseEntity.getException.toString());
  }
}
