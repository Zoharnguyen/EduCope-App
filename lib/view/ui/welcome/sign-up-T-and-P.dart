import 'dart:io';

import 'package:dio/dio.dart';
import 'package:edu_cope/constant/common-constant.dart';
import 'package:edu_cope/dto/response-entity.dart';
import 'package:edu_cope/dto/response-token.dart';
import 'package:edu_cope/dto/user-basic.dart';
import 'package:edu_cope/service/api-account.dart';
import 'package:edu_cope/view/ui/welcome/sign-in-T-and-P.dart';
import 'package:edu_cope/view/utils/common-utils.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../homepage-T-and-P.dart';

String userIdGlobal = CommonUtils.currentUserId;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SignUpTandPPage(),
    );
  }
}

class SignUpTandPPage extends StatefulWidget {
  @override
  _SignUpTandPPageState createState() => _SignUpTandPPageState();
}

class _SignUpTandPPageState extends State<SignUpTandPPage> {
  UserBasic userBasic = new UserBasic();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    final bottom = MediaQuery.of(context).viewInsets.bottom;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        reverse: true,
        padding: EdgeInsets.only(bottom: bottom),
        child: Column(
          children: <Widget>[
            Container(
              height: height * 0.4 / 5,
            ),
            Container(
              height: height * 1.5 / 5,
              child: new Image.asset('asset/image/logo-edu-3.png'),
            ),
            Container(
              height: height * 0.15 / 5,
              child: Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  padding: EdgeInsets.only(
                    left: width * 0.1 / 2,
                  ),
                  child: Text(
                    "Đăng ký để tiếp tục",
                    style: TextStyle(
                      color: Colors.grey[400],
                      fontSize: CommonUtils.getUnitPx() * 12,
                      fontFamily: "Roboto",
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
            Container(
              height: height * 0.45 / 5,
              padding: EdgeInsets.only(
                left: width * 0.11 / 2,
                right: width * 0.2 / 2,
              ),
              child: TextField(
                autofocus: false,
                cursorWidth: 2,
                cursorHeight: 25,
                onChanged: (value) => userBasic.gmail = value,
                decoration: InputDecoration(
                  hintText: "Tên tài khoản",
                  hintStyle: TextStyle(
                    fontSize: CommonUtils.getUnitPx() * 14,
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
            Container(
              height: height * 0.45 / 5,
              padding: EdgeInsets.only(
                left: width * 0.11 / 2,
                right: width * 0.2 / 2,
              ),
              child: TextField(
                autofocus: false,
                cursorWidth: 2,
                cursorHeight: 25,
                obscureText: true,
                onChanged: (value) => userBasic.password = value,
                decoration: InputDecoration(
                  hintText: "Mật khẩu",
                  hintStyle: TextStyle(
                    fontSize: CommonUtils.getUnitPx() * 14,
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
            Container(
              height: height * 0.3 / 5,
              width: width * 4 / 7,
              margin: EdgeInsets.only(top: height * 0.4 / 5),
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
                      color: Colors.grey.shade300,
                      offset: Offset(0, 4),
                    ),
                  ]),
              child: TextButton(
                onPressed: () async {
                  userBasic.userType = CommonUtils.currentUserType;
                  // Create new account
                  await createAccount(userBasic);
                  // Do login into app
                  await login(userBasic, context);
                },
                child: Text(
                  "Đăng ký",
                  style: TextStyle(
                      fontSize: CommonUtils.getUnitPx() * 18,
                      color: Colors.white,
                      fontFamily: "Roboto",
                      fontStyle: FontStyle.italic),
                ),
              ),
            ),
            Container(
              height: height * 0.4 / 5,
              child: Container(
                padding: EdgeInsets.only(
                  bottom: height * 0.07 / 5,
                ),
                margin: EdgeInsets.only(
                  top: height * 0.1/ 5,
                  left: width * 0.53/ 2,
                ),
                child: Row(
                  children: [
                    Text(
                      "Bạn đã có tài khoản? ",
                      style: TextStyle(
                        fontSize: CommonUtils.getUnitPx() * 13,
                        color: Colors.grey,
                      ),
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SignInTandPPage()));
                        },
                        child: Text("Đăng nhập",
                            style: TextStyle(
                              fontSize: CommonUtils.getUnitPx() * 13,
                              color: Colors.blue[300],
                            ))),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Future<Widget> createAccount(UserBasic userBasic) async {
  APIAcountClient apiAcountClient =
      APIAcountClient(Dio(BaseOptions(contentType: "application/json")));
  ResponseEntity responseEntity =
      await apiAcountClient.createAccount(userBasic);
  if (responseEntity.getStatus == HttpStatus.ok) {
    print('Create account success');
    return Text('Success!');
  } else {
    print('Error: ' + responseEntity.getException.toString());
    return Text('Failed!');
  }
}

Future<Widget> login(UserBasic userBasic, BuildContext context) async {
  APIAcountClient apiAccountClient =
  APIAcountClient(Dio(BaseOptions(contentType: "application/json")));
  ResponseEntity responseEntity = await apiAccountClient.login(userBasic);
  if (responseEntity.getStatus == HttpStatus.ok) {
    TokenResponse tokenResponse = TokenResponse.fromJson(responseEntity.data);
    print('Token: ' + tokenResponse.token);
    // Save token to reference-source and CommonUtils.userToken
    CommonUtils.saveValue(
        describeEnum(CommonConstant.TOKEN).toString(), tokenResponse.token);
    CommonUtils.userToken = tokenResponse.token;
    // Save userId to CommonUtils.currentUserId
    CommonUtils.currentUserId = tokenResponse.userId;
    // // Remove screen enter account
    Navigator.pop(context);
    // Move to homePage screen after login success
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => HomePageTandP(userIdGlobal)));
    return Text("Success");
  } else {
    print('Error: ' + responseEntity.getException.toString());
    return Text("Failed");
  }
}
