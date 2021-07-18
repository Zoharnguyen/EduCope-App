import 'dart:io';

import 'package:dio/dio.dart';
import 'package:edu_cope/constant/course-type.dart';
import 'package:edu_cope/constant/user-type.dart';
import 'package:edu_cope/dto/adjust-user-profile.dart';
import 'package:edu_cope/dto/offer.dart';
import 'package:edu_cope/dto/response-entity.dart';
import 'package:edu_cope/dto/user-profile.dart';
import 'package:edu_cope/service/api-offer.dart';
import 'package:edu_cope/view/ui/common/developing-feature-screen-T-and-P.dart';
import 'package:edu_cope/view/ui/homepage-T.dart';
import 'package:edu_cope/view/ui/manage-course/manage-adjust-mem-in-class-T-and-P.dart';
import 'package:edu_cope/view/ui/manage-course/manage-attendance-learning-class-T-and-P.dart';
import 'package:edu_cope/view/ui/manage-course/show-result-exam-learning-class-T-and-P.dart';
import 'package:edu_cope/view/ui/manage-profile/manage-profile-T-and-P.dart';
import 'package:edu_cope/view/utils/common-utils.dart';
import 'package:flutter/material.dart';

import '../basic-operate-course/create-offer-class-T.dart';
import 'detail-information-learning-class-T-and-P.dart';

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
      home: ManageDetailLearningClassTandPPage(),
    );
  }
}

String courseId = '60e394825ded485c37a643f1';
final double width = CommonUtils.width;
final double height = CommonUtils.height;
AdjustUserProfile adjustUserProfile = new AdjustUserProfile();
String currentUserId = '607a8b832ea23669aaea68e3';

class ManageDetailLearningClassTandPPage extends StatefulWidget {
  ManageDetailLearningClassTandPPage();

  @override
  _ManageDetailLearningClassTandPPageState createState() =>
      _ManageDetailLearningClassTandPPageState();
}

class _ManageDetailLearningClassTandPPageState extends State<ManageDetailLearningClassTandPPage> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        title: Container(
          margin: EdgeInsets.only(
            right: width * 0.3 / 2,
          ),
          child: Align(
            child: Text(
              'Môn toán - Đang học',
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
          // width: width * 0.29 / 2,
          // decoration: BoxDecoration(
          //   border: Border.all(
          //     color: Colors.green,
          //     width: 2,
          //   )
          // ),
          child: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
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
                            // decoration: BoxDecoration(
                            //     border: Border.all(
                            //       color: Colors.green,
                            //       width: 2,
                            //     )
                            // ),
                            child: TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            DetailInformationLearingClassTandPPage()));
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
                          child:
                              new Image.asset('asset/image/class_status.png'),
                        ),
                        Container(
                            margin: EdgeInsets.only(
                              left: width * 0.1 / 2,
                            ),
                            // decoration: BoxDecoration(
                            //     border: Border.all(
                            //       color: Colors.green,
                            //       width: 2,
                            //     )
                            // ),
                            child: TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            ShowResultExamLearningClassTandPPage()));
                              },
                              child: Text(
                                'Kết quả học tập',
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
                          height: height * 0.32 / 5,
                          child: new Image.asset('asset/image/attendance.png'),
                        ),
                        Container(
                            margin: EdgeInsets.only(
                              left: width * 0.1 / 2,
                            ),
                            // decoration: BoxDecoration(
                            //     border: Border.all(
                            //       color: Colors.green,
                            //       width: 2,
                            //     )
                            // ),
                            child: TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            ManageAttendanceLearningClassTandPPage()));
                              },
                              child: Text(
                                'Điểm danh',
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
                            // decoration: BoxDecoration(
                            //     border: Border.all(
                            //       color: Colors.green,
                            //       width: 2,
                            //     )
                            // ),
                            child: TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            DevelopingFeatureScreenTandPPage()));
                              },
                              child: Text(
                                'Hợp đồng',
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
                            // decoration: BoxDecoration(
                            //     border: Border.all(
                            //       color: Colors.green,
                            //       width: 2,
                            //     )
                            // ),
                            child: TextButton(
                              onPressed: () {
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return QuestionYesOrNo();
                                    });
                                // Navigator.push(context,
                                //     MaterialPageRoute(builder: (context) => ProfileBasicInformation())
                                // );
                              },
                              child: Text(
                                'Kết thúc lớp học',
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
            Container(
              color: Colors.grey[100],
              margin: EdgeInsets.only(
                top: height * 0.1 / 5,
              ),
              child: Row(
                children: <Widget>[
                  Container(
                    // height: height * 0.3 / 5,
                    width: width * 0.45 / 2,
                    margin: EdgeInsets.only(
                      left: width * 0.07 / 2,
                    ),
                    child: FlatButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomePageT()));
                      },
                      child: new Image.asset('asset/image/homepage_green.jpg'),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      left: width * 0.25 / 2,
                    ),
                    height: height * 0.4 / 5,
                    child: FlatButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CreateOfferClassTPage()));
                      },
                      child: new Image.asset('asset/image/add.png'),
                    ),
                  ),
                  Container(
                      margin: EdgeInsets.only(
                        left: width * 0.2 / 2,
                      ),
                      height: height * 0.4 / 5,
                      child: FlatButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ManageProfileTandPPage()));
                        },
                        child: new Image.asset('asset/image/personal_blue.png'),
                      )),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

Future<Widget> updateOffer() async {
  Offer offer = new Offer();
  offer.id = courseId;
  offer.courseType = CourseType.END;
  APIOfferClient apiOfferClient =
      APIOfferClient(Dio(BaseOptions(contentType: "application/json")));
  ResponseEntity responseEntity = await apiOfferClient.updateOffer(offer);
  if (responseEntity.getStatus == HttpStatus.ok) {
    Offer offerResponse = Offer.fromJson(responseEntity.data);
    print('Subject: ' + offerResponse.subject.toString());
    print('Id: ' + offerResponse.id.toString());
    return Text('Success!');
    // Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
  } else {
    // Show pop up notification about fail reason.
    print('Error: ' + responseEntity.getException.toString());
    return Text('Failed!');
  }
}

Container titleForItems(String initialValueTitle) {
  return Container(
    height: height * 0.35 / 5,
    // decoration: BoxDecoration(
    //     border: Border.all(
    //       color: Colors.green,
    //       width: 2,
    //     )
    // ),
    child: Row(
      children: <Widget>[
        Container(
            // width: width * 0.3 / 2,
            margin: EdgeInsets.only(
              left: width * 0.15 / 2,
            ),
            // decoration: BoxDecoration(
            //     border: Border.all(
            //       color: Colors.green,
            //       width: 2,
            //     )
            // ),
            child: Text(
              initialValueTitle,
              style: TextStyle(
                color: Colors.blue,
                fontSize: 18,
              ),
            )),
      ],
    ),
  );
}

Container titleForItemAjust(String nameUser) {
  return Container(
    height: height * 0.35 / 5,
    // decoration: BoxDecoration(
    //     border: Border.all(
    //       color: Colors.green,
    //       width: 2,
    //     )
    // ),
    // margin: EdgeInsets.only(
    //   left: width*0.05/2,
    // ),
    child: Align(
      child: Text(
        nameUser,
        style: TextStyle(
          color: Colors.blue,
          fontSize: 20,
        ),
      ),
    ),
  );
}

Container inputContentItem(String contentInitialValue, String fieldName,
    AdjustUserProfile adjustUserProfile, double heightInput) {
  setValueForAdjustMember(contentInitialValue, fieldName, adjustUserProfile);
  return Container(
    height: heightInput,
    width: width * 1.3 / 2,
    margin: EdgeInsets.only(
      right: width * 0.2 / 2,
      left: width * 0.3 / 2,
    ),
    child: TextFormField(
      autofocus: false,
      maxLines: 2,
      cursorWidth: 2,
      cursorHeight: 25,
      // focusNode: FocusNode(canRequestFocus: false),
      initialValue: contentInitialValue,
      onChanged: (text) {
        setValueForAdjustMember(text, fieldName, adjustUserProfile);
      },
      decoration: InputDecoration(
        hintStyle: TextStyle(
          fontSize: 14,
          color: Colors.lightBlue,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 1,
            color: Colors.grey.shade400,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 1,
            color: Colors.lightBlue,
          ),
        ),
      ),
    ),
  );
}

Future<Offer> getOfferById(String courseId) async {
  Offer offer = new Offer();
  APIOfferClient apiOfferClient =
      APIOfferClient(Dio(BaseOptions(contentType: "application/json")));
  ResponseEntity responseEntity = await apiOfferClient.getCourseById(courseId);
  if (responseEntity.getStatus == HttpStatus.ok) {
    Offer offerResponse = Offer.fromJson(responseEntity.data);
    print('Subject: ' + offerResponse.subject.toString());
    return offerResponse;
    // Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
  } else {
    // Show pop up notification about fail reason.
    print('Error: ' + responseEntity.getException.toString());
  }
  return offer;
}

void setValueForAdjustMember(
    String value, String fieldName, AdjustUserProfile adjustUserProfile) {
  switch (fieldName) {
    case 'rate':
      adjustUserProfile.rate = value;
      break;
    case 'content':
      adjustUserProfile.content = value;
      break;
  }
}

List<UserProfile> getMemberClass(Offer offer) {
  List<UserProfile> memberClass = <UserProfile>[];
  if (offer != null &&
      offer.memberClassList != null &&
      offer.memberClassList!.isNotEmpty) {
    for (UserProfile userProfile in offer.memberClassList!.toList()) {
      if (userProfile.userType == UserType.STUDENTPARENT)
        memberClass.add(userProfile);
    }
  }
  return memberClass;
}

class QuestionYesOrNo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0)),
        child: Stack(
          overflow: Overflow.visible,
          alignment: Alignment.topCenter,
          children: [
            Container(
              height: height * 1.5 / 5,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 70, 10, 10),
                child: Column(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(
                        bottom: height * 0.1 / 2,
                      ),
                      child: Align(
                        child: Text(
                          'Bạn sẽ kết thúc lớp học?',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.blue,
                          ),
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(
                            left: width * 0.22 / 2,
                          ),
                          child: RaisedButton(
                            onPressed: () {
                              updateOffer();
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          ManageAdjustMemInClassTandPPage()));
                            },
                            color: Colors.lightBlue,
                            child: Text(
                              'Đồng ý',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                            left: width * 0.2 / 2,
                          ),
                          child: RaisedButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          ManageDetailLearningClassTandPPage()));
                            },
                            color: Colors.lightBlue,
                            child: Text(
                              'Hủy bỏ',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            Positioned(
                top: -40,
                child: CircleAvatar(
                  backgroundColor: Colors.redAccent,
                  radius: 40,
                  child: Icon(
                    Icons.assignment_turned_in_outlined,
                    color: Colors.white,
                    size: 40,
                  ),
                )),
          ],
        ));
  }
}
