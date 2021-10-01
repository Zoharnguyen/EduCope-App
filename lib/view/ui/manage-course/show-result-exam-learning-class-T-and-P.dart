import 'package:edu_cope/constant/user-type.dart';
import 'package:edu_cope/view/ui/common/widget-utils.dart';
import 'package:edu_cope/view/ui/manage-course/file-result-exam-learning-class-T-and-P.dart';
import 'package:edu_cope/view/ui/manage-course/show-adjust-student-learning-class-T-and-P.dart';
import 'package:edu_cope/view/utils/common-utils.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

final double width = CommonUtils.width;
final double height = CommonUtils.height;
UserType userType = CommonUtils.currentUserType;

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ShowResultExamLearningClassTandPPage(),
    );
  }
}

class ShowResultExamLearningClassTandPPage extends StatefulWidget {
  ShowResultExamLearningClassTandPPage();

  @override
  _ShowResultExamLearningClassTandPPageState createState() =>
      _ShowResultExamLearningClassTandPPageState();
}

class _ShowResultExamLearningClassTandPPageState
    extends State<ShowResultExamLearningClassTandPPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(height*0.41/5),
        child: AppBar(
          leading: Container(
            child: IconButton(
              icon: Icon(Icons.arrow_back_ios),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          centerTitle: true,
          title: Container(
            child: Text(
              'Kết quả học tập',
              style: TextStyle(
                fontSize: CommonUtils.getUnitPx() * 20,
              ),
            ),
          ),
        )
      ),
      body: Column(
        children: <Widget>[
          Container(
            height: height * 3.9 / 5,
            child: ListView(
              children: <Widget>[
                Container(
                    height: height * 0.35 / 5,
                    // width: width * 0.3 / 2,
                    margin: EdgeInsets.only(
                      top: height * 0.1 / 5,
                      left: width * 0.15 / 2,
                    ),
                    child: Text(
                      'Kết quả kiểm tra',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: CommonUtils.getUnitPx() * 20,
                      ),
                    )),
                Container(
                  child: Row(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(
                          left: width * 0.3 / 2,
                          right: width * 0.1 / 2,
                        ),
                        child: Column(
                          children: <Widget>[
                            Container(
                              width: width * 0.4 / 2,
                              child: new Image.asset('asset/image/file.png'),
                            ),
                            Container(
                              width: width * 0.4 / 2,
                              child: Align(
                                child: Text(
                                  'File_1.txt',
                                  style: TextStyle(
                                    color: Colors.green,
                                    fontSize: CommonUtils.getUnitPx() * 18,
                                    fontFamily: "Roboto",
                                    fontStyle: FontStyle.normal,
                                  ),
                                ),
                                alignment: Alignment.center,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                          left: width * 0.15 / 2,
                          right: width * 0.1 / 2,
                        ),
                        child: Column(
                          children: <Widget>[
                            Container(
                              width: width * 0.4 / 2,
                              child: new Image.asset('asset/image/file.png'),
                            ),
                            Container(
                              width: width * 0.4 / 2,
                              child: Align(
                                child: Text(
                                  'File_2.txt',
                                  style: TextStyle(
                                    color: Colors.green,
                                    fontSize: CommonUtils.getUnitPx() * 18,
                                    fontFamily: "Roboto",
                                    fontStyle: FontStyle.normal,
                                  ),
                                ),
                                alignment: Alignment.center,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: height * 0.07 / 5),
                        width: width * 0.4 / 2,
                        child: TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        FileResultExamLearningClassTandPPage()));
                          },
                          child: new Image.asset('asset/image/next.png'),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                    height: height * 0.35 / 5,
                    // width: width * 0.3 / 2,
                    margin: EdgeInsets.only(
                      top: height * 0.1 / 5,
                      left: width * 0.15 / 2,
                    ),
                    child: Text(
                      'Nhận xét học sinh',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: CommonUtils.getUnitPx() * 20,
                      ),
                    )),
                Container(
                    height: height * 0.4 / 5,
                    width: width * 1 / 2,
                    margin: EdgeInsets.only(
                      top: height * 0.3 / 5,
                      right: width * 0.1 / 2,
                      left: width * 0.2 / 2,
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
                    child: Container(
                      child: Row(
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(
                              left: width * 0.2 / 2,
                            ),
                            child: Text(
                              'Nguyen Van A',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: CommonUtils.getUnitPx() * 20,
                              ),
                            ),
                          ),
                          Container(
                              margin: EdgeInsets.only(
                                bottom: height * 0.07 / 5,
                                left: width * 0.5 / 2,
                              ),
                              // height: height * 0.2 / 5,
                              width: width * 0.2 / 2,
                              child: IconButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              ShowAdjustStudentLearningClassTandPPage()));
                                },
                                icon: new Image.asset('asset/image/adjust.png'),
                              )),
                        ],
                      ),
                    )),
                Container(
                    height: height * 0.4 / 5,
                    width: width * 1.4 / 2,
                    margin: EdgeInsets.only(
                      top: height * 0.3 / 5,
                      right: width * 0.1 / 2,
                      left: width * 0.2 / 2,
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
                    child: Container(
                      child: Row(
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(
                              left: width * 0.2 / 2,
                            ),
                            child: Text(
                              'Nguyen Van B',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: CommonUtils.getUnitPx() * 20,
                              ),
                            ),
                          ),
                          Container(
                              margin: EdgeInsets.only(
                                bottom: height * 0.07 / 5,
                                left: width * 0.5 / 2,
                              ),
                              // height: height * 0.2 / 5,
                              width: width * 0.2 / 2,
                              child: IconButton(
                                onPressed: () {},
                                icon: new Image.asset('asset/image/adjust.png'),
                              )),
                        ],
                      ),
                    )),
              ],
            ),
          ),
          WidgetUtils.mainButton(context, 0, userType),
        ],
      ),
    );
  }
}
