import 'dart:ui';

import 'package:edu_cope/constant/common-constant.dart';
import 'package:edu_cope/constant/user-type.dart';
import 'package:edu_cope/view/ui/welcome/sign-in-T-and-P.dart';
import 'package:edu_cope/view/utils/common-utils.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../../constant/common-constant.dart';
import 'choose-user-type-T-and-P.dart';

var pixelRatio = window.devicePixelRatio;
//Size in physical pixels
var physicalScreenSize = window.physicalSize;

//Size in logical pixels
var logicalScreenSize = window.physicalSize / pixelRatio;
var logicalWidth = logicalScreenSize.width;
var logicalHeight = logicalScreenSize.height;

Future<void> main() async {
  // Initialize value of width and height of screen
  CommonUtils.width = logicalWidth;
  CommonUtils.height = logicalHeight;
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: WelcomeTandPPage(),
    );
  }
}

class WelcomeTandPPage extends StatefulWidget {
  WelcomeTandPPage();

  @override
  _WelcomeTandPPageState createState() => _WelcomeTandPPageState();
}

class _WelcomeTandPPageState extends State<WelcomeTandPPage> {
  @override
  void initState() {
    super.initState();
    // setValueForUserType();
    print("Current user: " + CommonUtils.currentUserType.toString());
  }

  setValueForUserType() async {
    // Depend on your type user which people choose then will set this value to CommonUtils.currentUserType
    await CommonUtils.saveValue(
        describeEnum(CommonConstant.USER_TYPE).toString(),
        UserType.STUDENTPARENT.toString());
    CommonUtils.getCurrentUserType().then((value) {
      CommonUtils.currentUserType = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            height: height * 0.4 / 5,
          ),
          Container(
            height: height * 1.2 / 5,
            width: width * 0.8 / 2,
            decoration: BoxDecoration(),
            child: new Image.asset('asset/image/logo-edu-3.png'),
          ),
          Container(
            height: height / 5,
            decoration: BoxDecoration(),
            padding: EdgeInsets.only(
              bottom: height / 14,
            ),
            child: Align(
              alignment: Alignment.center,
              child: Container(
                width: width * 5 / 7,
                child: Text(
                  "Nền tảng kết nối gia sư và phụ huynh học sinh",
                  style: TextStyle(
                      color: Colors.cyanAccent[250],
                      fontSize: CommonUtils.getUnitPx() * 18,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.w300),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
          Container(
            height: height * 0.3 / 5,
            width: width * 4 / 7,
            margin: EdgeInsets.only(
              top: height * 0.2/5,
            ),
            decoration: BoxDecoration(
                color: Colors.blue.shade300,
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
              onPressed: () {
                CommonUtils.saveValue(
                    describeEnum(CommonConstant.MOVE_TO_CREATE_ACCOUNT_SCREEN)
                        .toString(),
                    "false");
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SignInTandPPage()));
              },
              child: Text(
                "Đăng nhập",
                style: TextStyle(
                    fontSize: CommonUtils.getUnitPx() * 18,
                    color: Colors.white,
                    fontStyle: FontStyle.italic),
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  width: 2,
                  color: Colors.grey.shade500,
                ),
              ),
            ),
            margin: EdgeInsets.only(
              top: (height * 0.6 - height * 0.27 * CommonUtils.getUnitPx()) *
                  3 /
                  35,
              bottom: (height * 0.6 - height * 0.27 * CommonUtils.getUnitPx()) *
                  4 /
                  35,
            ),
            height: height * 0.27 * CommonUtils.getUnitPx() / 5,
            child: TextButton(
              onPressed: () {
                CommonUtils.saveValue(
                    describeEnum(CommonConstant.MOVE_TO_CREATE_ACCOUNT_SCREEN)
                        .toString(),
                    "false");
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ChooseUserTypeTandPPage()));
              },
              child: Text(
                "Xem ứng dụng",
                style: TextStyle(
                    fontSize: CommonUtils.getUnitPx() * 14,
                    fontStyle: FontStyle.italic,
                    color: Colors.grey,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Container(
            height: height * 0.3 / 5,
            width: width * 4 / 7,
            decoration: BoxDecoration(
                color: Colors.lightBlue[50],
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
              onPressed: () {
                CommonUtils.saveValue(
                    describeEnum(CommonConstant.MOVE_TO_CREATE_ACCOUNT_SCREEN)
                        .toString(),
                    "true");
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ChooseUserTypeTandPPage()));
              },
              child: Text(
                "Đăng ký",
                style: TextStyle(
                    fontSize: CommonUtils.getUnitPx() * 18,
                    color: Colors.blue[300],
                    fontStyle: FontStyle.italic),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
