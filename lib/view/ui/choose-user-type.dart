import 'package:edu_cope/constant/common-constant.dart';
import 'package:edu_cope/constant/user-type.dart';
import 'package:edu_cope/view/ui/sign-up.dart';
import 'package:edu_cope/view/utils/common-utils.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'homepage.dart';

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
      home: ChooseUserTypePage(),
    );
  }
}

class ChooseUserTypePage extends StatefulWidget {
  ChooseUserTypePage();

  @override
  _ChooseUserTypePageState createState() => _ChooseUserTypePageState();
}

class _ChooseUserTypePageState extends State<ChooseUserTypePage> {
  CommonUtils commonUtils = new CommonUtils();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(widget.title),
      // ),
      body: Column(
        children: <Widget>[
          Container(
            height: height * 2 / 5,
            // decoration: BoxDecoration(
            //   border: Border.all(
            //     color: Colors.green,
            //     width: 2,
            //   )
            // ),
            padding: EdgeInsets.only(
              top: height * 0.5 / 5,
            ),
            child: new Image.asset('asset/image/logo-1.jpeg'),
          ),
          Container(
            height: height * 0.5 / 5,
            // decoration: BoxDecoration(
            //   border: Border.all(
            //     color: Colors.green,
            //     width: 2,
            //   )
            // ),
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
                    color: Colors.purple[200],
                    fontSize: 18,
                    fontFamily: "Roboto",
                    fontStyle: FontStyle.italic,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
          Container(
            height: height * 2 / 5,
            padding: EdgeInsets.only(left: width * 0.4 / 5),
            // decoration: BoxDecoration(
            //     border: Border.all(
            //       color: Colors.green,
            //       width: 2,
            //     )
            // ),
            child: Row(
              children: <Widget>[
                Container(
                  height: height * 1.2 / 5,
                  decoration: BoxDecoration(
                      // border: Border.all(
                      //   color: Colors.green,
                      //   width: 2,
                      // ),
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
                    right: width * 0.1 / 2,
                    bottom: height * 0.4 / 5,
                  ),
                  child: FlatButton(
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
                                builder: (context) => SignUpPage()));
                      } else {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomePage()));
                      }
                    },
                    child: Column(
                      children: <Widget>[
                        Container(
                          child: Text('Gia Sư'),
                        ),
                        Container(
                          child: new Image.asset('asset/image/teacher.png'),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  height: height * 1.2 / 5,
                  margin: EdgeInsets.only(
                    bottom: height * 0.4 / 5,
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
                                builder: (context) => SignUpPage()));
                      } else {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomePage()));
                      }
                    },
                    child: Column(
                      children: <Widget>[
                        Container(
                          child: Text('Phụ Huynh'),
                        ),
                        Container(
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
              top: height * 0.3 / 5,
            ),
            child: Text(
              'Copyrigh by TrungNQ',
              style: TextStyle(
                color: Colors.grey[400],
                fontSize: 18,
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
