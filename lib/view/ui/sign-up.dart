import 'dart:io';

import 'package:dio/dio.dart';
import 'package:edu_cope/constant/common-constant.dart';
import 'package:edu_cope/constant/user-type.dart';
import 'package:edu_cope/dto/response-entity.dart';
import 'package:edu_cope/dto/user-basic.dart';
import 'package:edu_cope/service/api-account.dart';
import 'package:edu_cope/view/ui/homepage.dart';
import 'package:edu_cope/view/utils/common-utils.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SignUpPage(),
    );
  }
}

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {

  UserBasic userBasic = new UserBasic();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    final bottom = MediaQuery.of(context).viewInsets.bottom;
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(widget.title),
      // ),
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        reverse: true,
        padding: EdgeInsets.only(bottom: bottom),
        child: Column(
          children: <Widget>[
            Container(
              height: height*0.4/5,
              decoration: BoxDecoration(
                // border: Border.all(
                //   color: Colors.green,
                //   width: 2,
                // )
              ),
            ),
            Container(
              height: height*1.5/5,
              decoration: BoxDecoration(
                // border: Border.all(
                //   color: Colors.green,
                //   width: 2,
                // )
              ),
              child: new Image.asset('asset/image/logo-1.jpeg'),
            ),
            Container(
              height: height*0.3/5,
              decoration: BoxDecoration(
                // border: Border.all(
                //   color: Colors.green,
                //   width: 2,
                // )
              ),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  padding: EdgeInsets.only(
                    left: width*0.1/2,
                  ),
                  child: Text(
                    "Create Account",
                    style: TextStyle(
                      color: Colors.cyan[800],
                      fontSize: 28,
                      fontFamily: "Roboto",
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
            Container(
              height: height*0.15/5,
              decoration: BoxDecoration(
                // border: Border.all(
                //   color: Colors.green,
                //   width: 2,
                // )
              ),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  padding: EdgeInsets.only(
                    left: width*0.1/2,
                  ),
                  child: Text(
                    "Create an account to continue",
                    style: TextStyle(
                      color: Colors.grey[400],
                      fontSize: 12,
                      fontFamily: "Roboto",
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
            Container(
              height: height*0.45/5,
              decoration: BoxDecoration(
                // border: Border.all(
                //   color: Colors.green,
                //   width: 2,
                // ),
              ),
              padding: EdgeInsets.only(
                left: width*0.11/2,
                right: width*0.2/2,
              ),
              child: TextField(
                autofocus: false,
                cursorWidth: 2,
                cursorHeight: 25,
                onChanged: (value) => userBasic.gmail = value,
                decoration: InputDecoration(
                  hintText: "Email",
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
            ),
            Container(
              height: height*0.45/5,
              decoration: BoxDecoration(
                // border: Border.all(
                //   color: Colors.green,
                //   width: 2,
                // ),
              ),
              padding: EdgeInsets.only(
                left: width*0.11/2,
                right: width*0.2/2,
              ),
              child: TextField(
                autofocus: false,
                cursorWidth: 2,
                cursorHeight: 25,
                obscureText: true,
                onChanged: (value) => userBasic.password = value,
                decoration: InputDecoration(
                  hintText: "Password",
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
            ),
            Container(
              height: height*0.3/5,
              width: width*4/7,
              margin: EdgeInsets.only(
                top: height*0.3/5
              ),
              decoration: BoxDecoration(
                  color: Colors.blue[300],
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
                      offset: Offset(0,4),
                    ),
                  ]
              ),
              child: FlatButton(
                onPressed: () async {
                    String userTypeValue = await CommonUtils.getValue(describeEnum(CommonConstant.USER_TYPE).toString());
                    userBasic.userType  = UserType.TEACHER;
                    APIAcountClient apiAccountClient = APIAcountClient(Dio(BaseOptions(contentType: "application/json")));
                    ResponseEntity responseEntity = await apiAccountClient.login(userBasic);
                    if(responseEntity.getStatus == HttpStatus.ok) {
                      UserBasic userBasicCheck = UserBasic.fromJson(responseEntity.data);
                      print('Gmail: ' + userBasicCheck.gmail);
                      print('Password: ' + userBasicCheck.password);
                      print('Type: ' + userBasicCheck.userType.toString());
                      Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
                    } else {
                      // Show pop up notification about fail reason.
                      print('Error: ' + responseEntity.getException.toString());
                    }
                },
                child: Text(
                  "Create Account",
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontFamily: "Roboto",
                      fontStyle: FontStyle.normal
                  ),
                ),
              ),
            ),
            Container(
              height: height*0.4/5,
              decoration: BoxDecoration(
                // border: Border.all(
                //   color: Colors.green,
                //   width: 2,
                // ),
              ),
              child: Container(
                padding: EdgeInsets.only(
                  bottom: height*0.07/5,
                ),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: RichText(
                    text: TextSpan(
                        children: <TextSpan>[
                          TextSpan(
                            text: "Already have an count? ",
                            style: TextStyle(
                              fontSize: 13,
                              color: Colors.grey,
                            ),
                          ),
                          TextSpan(
                              text: "Sign in",
                              style: TextStyle(
                                fontSize: 13,
                                color: Colors.blue[300],
                              )
                          )
                        ]
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
