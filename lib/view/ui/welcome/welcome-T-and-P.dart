
import 'package:edu_cope/view/ui/welcome/sign-in-T-and-P.dart';
import 'package:edu_cope/view/utils/common-utils.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'choose-user-type-T-and-P.dart';
import '../../../constant/common-constant.dart';

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
              height: height/5,
              decoration: BoxDecoration(
                // border: Border.all(
                //   color: Colors.green,
                //   width: 2,
                // )
              ),
              padding: EdgeInsets.only(
                bottom: height/14,
              ),
              child: Align(
                alignment: Alignment.center,
                child: Container(
                  width: width*5/7,
                  child: Text(
                    "We have more than 1 million tutor and student in our platform!",
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
              height: height*0.3/5,
              width: width*4/7,
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
                onPressed: () {
                  CommonUtils.saveValue(describeEnum(CommonConstant.MOVE_TO_CREATE_ACCOUNT_SCREEN).toString(), "false");
                  Navigator.push(context, MaterialPageRoute(builder: (context) => SignInTandPPage()));
                },
                child: Text(
                  "Sign In",
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
              height: height*0.6/5,
              decoration: BoxDecoration(
                  // border: Border.all(
                  //   color: Colors.green,
                  //   width: 2,
                  // )
              ),
              child: FlatButton(
                onPressed: () {
                  CommonUtils.saveValue(describeEnum(CommonConstant.MOVE_TO_CREATE_ACCOUNT_SCREEN).toString(), "false");
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ChooseUserTypeTandPPage()));
                },
                child: Text(
                  "View as a guest",
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: "Roboto",
                    fontStyle: FontStyle.normal,
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
            Container(
              height: height*0.3/5,
              width: width*4/7,
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
                      offset: Offset(0,4),
                    ),
                  ]
              ),
              child: FlatButton(
                onPressed: () {
                  CommonUtils.saveValue(describeEnum(CommonConstant.MOVE_TO_CREATE_ACCOUNT_SCREEN).toString(), "true");
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ChooseUserTypeTandPPage()));
                },
                child: Text(
                  "Create Account",
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.blue[300],
                      fontFamily: "Roboto",
                      fontStyle: FontStyle.normal
                  ),
                ),
              ),
            ),
          ],
        ),
    );
  }
}
