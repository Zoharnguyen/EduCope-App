import 'package:edu_cope/constant/user-type.dart';
import 'package:edu_cope/view/ui/basic-operate-course/detail-information-opening-and-not-offer-class-T-and-P.dart';
import 'package:edu_cope/view/ui/common/widget-utils.dart';
import 'package:edu_cope/view/ui/manage-course/create-course-contract-T.dart';
import 'package:edu_cope/view/ui/manage-course/manage-register-course-opening-class-T.dart';
import 'package:edu_cope/view/utils/common-utils.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

final double width = CommonUtils.width;
final double height = CommonUtils.height;

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // title: 'Edu Cope',
      // theme: ThemeData(
      //   primarySwatch: Colors.blue,
      // ),
      home: ManageDetailOpeningClassTandPPage(),
    );
  }
}

class ManageDetailOpeningClassTandPPage extends StatefulWidget {
  ManageDetailOpeningClassTandPPage();

  @override
  _ManageDetailOpeningClassTandPPageState createState() =>
      _ManageDetailOpeningClassTandPPageState();
}

class _ManageDetailOpeningClassTandPPageState
    extends State<ManageDetailOpeningClassTandPPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        title: Container(
          margin: EdgeInsets.only(
            right: width * 0.3 / 2,
          ),
          child: Align(
            child: Text(
              'Môn toán - Đang mở',
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontFamily: "Roboto",
                fontStyle: FontStyle.normal,
              ),
            ),
          ),
        ),
        leading: Container(
          child: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
      ),
      body: Column(
        children: <Widget>[
          Container(
            height: height * 3.86 / 5,
            child: Column(
              children: <Widget>[
                Container(
                  height: height * 0.35 / 5,
                  width: width * 1.4 / 2,
                  margin: EdgeInsets.only(
                    top: height * 0.5 / 5,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(8),
                      topRight: Radius.circular(8),
                      bottomLeft: Radius.circular(8),
                      bottomRight: Radius.circular(8),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        height: height * 0.3 / 5,
                        child: new Image.asset(
                            'asset/image/class_information.png'),
                      ),
                      Container(
                          margin: EdgeInsets.only(
                            left: width * 0.1 / 2,
                          ),
                          child: TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          DetailInformationOpeningAndNotOfferClassTandPPage()));
                            },
                            child: Text(
                              'Thông tin lớp học',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                              ),
                            ),
                          )),
                    ],
                  ),
                ),
                Container(
                  height: height * 0.35 / 5,
                  width: width * 1.4 / 2,
                  margin: EdgeInsets.only(
                    top: height * 0.3 / 5,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(8),
                      topRight: Radius.circular(8),
                      bottomLeft: Radius.circular(8),
                      bottomRight: Radius.circular(8),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        height: height * 0.3 / 5,
                        child: new Image.asset('asset/image/class_status.png'),
                      ),
                      Container(
                          margin: EdgeInsets.only(
                            left: width * 0.1 / 2,
                          ),
                          child: TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          ManageRegisterCourseOpeningClassTPage()));
                            },
                            child: Text(
                              'Trạng thái lớp học',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                              ),
                            ),
                          )),
                    ],
                  ),
                ),
                Container(
                  height: height * 0.35 / 5,
                  width: width * 1.4 / 2,
                  margin: EdgeInsets.only(
                    top: height * 0.3 / 5,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(8),
                      topRight: Radius.circular(8),
                      bottomLeft: Radius.circular(8),
                      bottomRight: Radius.circular(8),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        height: height * 0.3 / 5,
                        child: new Image.asset('asset/image/contract.png'),
                      ),
                      Container(
                          margin: EdgeInsets.only(
                            left: width * 0.1 / 2,
                          ),
                          child: TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          CreateCourseContractTPage()));
                            },
                            child: Text(
                              'Tạo hợp đồng',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                              ),
                            ),
                          )),
                    ],
                  ),
                ),
                Container(
                  height: height * 0.35 / 5,
                  width: width * 1.4 / 2,
                  margin: EdgeInsets.only(
                    top: height * 0.3 / 5,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(8),
                      topRight: Radius.circular(8),
                      bottomLeft: Radius.circular(8),
                      bottomRight: Radius.circular(8),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        height: height * 0.3 / 5,
                        child: new Image.asset('asset/image/cancel.png'),
                      ),
                      Container(
                          margin: EdgeInsets.only(
                            left: width * 0.1 / 2,
                          ),
                          child: TextButton(
                            onPressed: () {
                              // Navigator.push(context,
                              //     MaterialPageRoute(builder: (context) => ProfileBasicInformation())
                              // );
                            },
                            child: Text(
                              'Hủy bỏ lớp học',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                              ),
                            ),
                          )),
                    ],
                  ),
                )
              ],
            ),
          ),
          WidgetUtils.mainButton(context, height * 0.1 / 5, UserType.TEACHER)
        ],
      ),
    );
  }
}
