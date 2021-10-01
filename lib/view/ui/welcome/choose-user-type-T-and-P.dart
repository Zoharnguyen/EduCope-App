import 'package:edu_cope/constant/common-constant.dart';
import 'package:edu_cope/constant/user-type.dart';
import 'package:edu_cope/view/ui/welcome/sign-up-T-and-P.dart';
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
      home: ChooseUserTypeTandPPage(),
    );
  }
}

class ChooseUserTypeTandPPage extends StatefulWidget {
  ChooseUserTypeTandPPage();

  @override
  _ChooseUserTypeTandPPageState createState() =>
      _ChooseUserTypeTandPPageState();
}

class _ChooseUserTypeTandPPageState extends State<ChooseUserTypeTandPPage> {
  CommonUtils commonUtils = new CommonUtils();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            height: height * 1.5 / 5,
            width: width * 0.8 / 2,
            padding: EdgeInsets.only(
              top: height * 0.5 / 5,
            ),
            child: new Image.asset('asset/image/logo-edu-3.png'),
          ),
          Container(
            height: height * 0.5 / 5,
            margin: EdgeInsets.only(
              top: height * 0.2/5,
            ),
            padding: EdgeInsets.only(
              bottom: height * 0.8 / 14,
            ),
            child: Align(
              alignment: Alignment.center,
              child: Container(
                width: width * 5 / 7,
                child: Text(
                  "Ứng dụng kết nối gia sư và phụ huynh",
                  style: TextStyle(
                    fontSize: CommonUtils.getUnitPx() * 18,
                    fontStyle: FontStyle.italic,
                    color: Colors.cyanAccent[250],
                    fontWeight: FontWeight.w300,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
          Container(
            height: height * 2 / 5,
            padding: EdgeInsets.only(left: width * 0.4 / 5),
            child: Row(
              children: <Widget>[
                Container(
                  height: height * 1.25 / 5,
                  width: width * 0.6 / 2,
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
                          color: Colors.grey.shade400,
                          offset: Offset(0, 4),
                        ),
                      ]),
                  margin: EdgeInsets.only(
                    left: width * 0.12 / 2,
                  ),
                  child: TextButton(
                    onPressed: () async {
                      CommonUtils.saveValue(
                          describeEnum(CommonConstant.USER_TYPE).toString(),
                          UserType.TEACHER.toString());
                      String moveToCreateAccountScreen =
                          await CommonUtils.getValue(describeEnum(
                                  CommonConstant.MOVE_TO_CREATE_ACCOUNT_SCREEN)
                              .toString());
                      if (moveToCreateAccountScreen == "true") {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SignUpTandPPage()));
                      } else {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    HomePageTandP(userIdGlobal)));
                      }
                    },
                    child: Column(
                      children: <Widget>[
                        Container(
                          child: Text('Gia Sư',
                              style: TextStyle(
                                  fontSize: CommonUtils.getUnitPx() * 12.5)),
                        ),
                        Container(
                          height: height * 1 / 5,
                          width: width * 0.5 / 2,
                          child: new Image.asset('asset/image/teacher.png'),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  height: height * 1.25 / 5,
                  width: width * 0.6 / 2,
                  margin: EdgeInsets.only(
                    left: width * 0.2 / 2,
                  ),
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
                          color: Colors.grey.shade400,
                          offset: Offset(0, 4),
                        ),
                      ]),
                  child: TextButton(
                    onPressed: () async {
                      CommonUtils.saveValue(
                          describeEnum(CommonConstant.USER_TYPE).toString(),
                          UserType.STUDENTPARENT.toString());
                      String moveToCreateAccountScreen =
                          await CommonUtils.getValue(describeEnum(
                                  CommonConstant.MOVE_TO_CREATE_ACCOUNT_SCREEN)
                              .toString());
                      if (moveToCreateAccountScreen == "true") {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SignUpTandPPage()));
                      } else {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    HomePageTandP(userIdGlobal)));
                      }
                    },
                    child: Column(
                      children: <Widget>[
                        Container(
                          child: Text(
                            'Phụ Huynh',
                            style: TextStyle(
                                fontSize: CommonUtils.getUnitPx() * 12.5),
                          ),
                        ),
                        Container(
                          height: height * 1 / 5,
                          width: width * 0.5 / 2,
                          child: new Image.asset('asset/image/parent.png'),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              top: height * 0.55 / 5,
            ),
            child: Text(
              'Bản quyền của TrungNQ',
              style: TextStyle(
                color: Colors.grey[400],
                fontSize: CommonUtils.getUnitPx() * 18,
                fontFamily: "Roboto",
                fontStyle: FontStyle.italic,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
