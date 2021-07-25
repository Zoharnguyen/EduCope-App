import 'dart:io';

import 'package:dio/dio.dart';
import 'package:edu_cope/dto/course-contract-wrap.dart';
import 'package:edu_cope/dto/offer.dart';
import 'package:edu_cope/dto/response-entity.dart';
import 'package:edu_cope/dto/schedule-offer.dart';
import 'package:edu_cope/dto/user-profile.dart';
import 'package:edu_cope/service/api-offer.dart';
import 'package:edu_cope/view/ui/basic-operate-course/create-offer-class-T.dart';
import 'package:edu_cope/view/ui/homepage-T-and-P.dart';
import 'package:edu_cope/view/ui/manage-course/manage-detail-openning-class-T-and-P.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

double width = 411.4285;
double height = 683.4285;
String courseId = '60e394825ded485c37a643f1';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // title: 'Edu Cope',
      // theme: ThemeData(
      //   primarySwatch: Colors.blue,
      // ),
      home: CreateCourseContractTPage(),
    );
  }
}

class CreateCourseContractTPage extends StatefulWidget {
  CreateCourseContractTPage();

  @override
  _CreateCourseContractTPageState createState() => _CreateCourseContractTPageState();
}

class _CreateCourseContractTPageState extends State<CreateCourseContractTPage> {
  String _subjectName = 'toan';
  String _formatLearning = 'Hoc tai nha';
  Offer _offer =
      Offer.withScheduleAndUserProfile(new ScheduleOffer(), new UserProfile());
  CourseContractWrap _courseContractWrap = new CourseContractWrap();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    final bottomKeyboard = MediaQuery.of(context).viewInsets.bottom;
    return FutureBuilder<Offer>(
        future: getOfferById(courseId),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            _offer = snapshot.data!;
            return Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.lightBlue,
                title: Container(
                  margin: EdgeInsets.only(
                    right: width * 0.3 / 2,
                  ),
                  child: Align(
                    child: Text(
                      'Tạo hợp đồng',
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
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  ManageDetailOpeningClassTandPPage()));
                    },
                  ),
                ),
              ),
              body: SingleChildScrollView(
                reverse: false,
                // padding: EdgeInsets.only(
                //   bottom: bottomKeyboard * 0.1,
                // ),
                child: Column(
                  // Make list containers in Column start with left screen
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    titleForItems('Mon hoc'),
                    inputShortContentItem(
                        setValueIfStringNull(_offer.subject.toString()), 'subject', _courseContractWrap),
                    titleForItems('Hoc phi'),
                    inputShortContentItem(setValueIfStringNull(_offer.salary.toString()), 'salary', _courseContractWrap),
                    titleForItems('Thanh toán sau'),
                    inputShortContentItem(
                        '10 ngày', 'paymentDate', _courseContractWrap),
                    titleForItems('Hinh thuc hoc'),
                    Container(
                      margin: EdgeInsets.only(
                        left: width * 0.35 / 2,
                      ),
                      // decoration: BoxDecoration(
                      //     border: Border.all(
                      //       color: Colors.grey[400],
                      //       width: 1,
                      //     )
                      // ),
                      child: DropdownButton<String>(
                        value: _formatLearning,
                        //elevation: 5,
                        style: TextStyle(color: Colors.black),
                        items: <String>[
                          'Hoc truc tuyen',
                          'Hoc tai nha',
                        ].map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        hint: Text(
                          "Hoc tai nha",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            // fontWeight: FontWeight.w600
                          ),
                        ),
                        onChanged: (value) {
                          setState(() {
                            _formatLearning = value!;
                            _courseContractWrap.courseContract!.formatLearning = _formatLearning;
                            // After selected drop down then cursor don't focus any text field
                            FocusScope.of(context)
                                .requestFocus(new FocusNode());
                          });
                        },
                      ),
                    ),
                    titleForItems('Luu y'),
                    inputLongContentItem(
                        setValueIfStringNull(_offer.note.toString()), "note", _courseContractWrap),
                    Container(
                      height: height * 0.3 / 5,
                      width: width * 0.6 / 2,
                      margin: EdgeInsets.only(
                        top: height * 0.3 / 5,
                        left: width * 0.7 / 2,
                        bottom: height * 0.3 / 5,
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
                              offset: Offset(0, 4),
                            ),
                          ]),
                      child: FlatButton(
                        child: Text(
                          "Tạo",
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                              fontFamily: "Roboto",
                              fontStyle: FontStyle.normal),
                        ),
                        onPressed: () {
                          _createCourseContract(_courseContractWrap);
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AdvanceCustomAlert();
                              });
                        },
                      ),
                    )
                  ],
                ),
              ),
            );
          } else
            return Container();
        });
  }
}

String setValueIfStringNull(String value) {
  if(value == null) return '';
  else return value;
}

class AdvanceCustomAlert extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0)),
        child: Stack(
          overflow: Overflow.visible,
          alignment: Alignment.topCenter,
          children: [
            Container(
              height: 200,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 70, 10, 10),
                child: Column(
                  children: [
                    Text(
                      'Thành Công',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.blue),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Hợp đồng đã được tạo',
                      style: TextStyle(fontSize: 14),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    RaisedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ManageDetailOpeningClassTandPPage()));
                      },
                      color: Colors.lightBlue,
                      child: Text(
                        'Đóng',
                        style: TextStyle(color: Colors.white),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Positioned(
                top: -60,
                child: CircleAvatar(
                  backgroundColor: Colors.lightBlue,
                  radius: 60,
                  child: Icon(
                    Icons.save,
                    color: Colors.white,
                    size: 50,
                  ),
                )),
          ],
        ));
  }
}

Container inputLongContentItem(String contentInitialValue, String fieldName, CourseContractWrap courseContractWrap) {
  setValueForOffer(contentInitialValue, fieldName, courseContractWrap);
  return Container(
    // decoration: BoxDecoration(
    //     border: Border.all(
    //       color: Colors.grey[400],
    //       width: 1,
    //     )
    // ),
    width: width * 1.3 / 2,
    height: height * 1 / 5,
    margin: EdgeInsets.only(
      right: width * 0.2 / 2,
      left: width * 0.3 / 2,
    ),
    child: TextFormField(
      autofocus: false,
      maxLines: 4,
      cursorWidth: 2,
      cursorHeight: 25,
      initialValue: contentInitialValue,
      onChanged: (text) {
        setValueForOffer(text, fieldName, courseContractWrap);
      },
      decoration: InputDecoration(
        hintStyle: TextStyle(
          fontSize: 14,
          color: Colors.grey,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 1,
            color: Colors.grey.shade400,
          ),
        ),
        // When u click on textfield
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

Container inputShortContentItem(String contentInitialValue, String fieldName, CourseContractWrap courseContractWrap) {
  setValueForOffer(contentInitialValue, fieldName, courseContractWrap);
  return Container(
    height: height * 0.5 / 5,
    width: width * 1.3 / 2,
    margin: EdgeInsets.only(
      right: width * 0.2 / 2,
      left: width * 0.3 / 2,
    ),
    child: TextFormField(
      autofocus: false,
      maxLines: 1,
      cursorWidth: 2,
      cursorHeight: 25,
      // focusNode: FocusNode(canRequestFocus: false),
      initialValue: contentInitialValue,
      onChanged: (text) {
        setValueForOffer(text, fieldName, courseContractWrap);
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

void setValueForOffer(String value, String fieldName,
    CourseContractWrap courseContractWrap) {
  switch (fieldName) {
    case 'subject':
      courseContractWrap.courseContract!.subject = value;
      break;
    case 'formatLearning':
      courseContractWrap.courseContract!.formatLearning = value;
      break;
    case 'salary':
      courseContractWrap.courseContract!.salary = value;
      break;
    case 'note':
      courseContractWrap.courseContract!.note = value;
      break;
    case 'paymentDate':
      courseContractWrap.courseContract!.paymentDate = value;
      break;
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

Future<Widget> _createCourseContract(CourseContractWrap courseContractWrap) async {
  courseContractWrap.courseId = courseId;
  APIOfferClient apiOfferClient =
      APIOfferClient(Dio(BaseOptions(contentType: "application/json")));
  ResponseEntity responseEntity = await apiOfferClient.createCourseContract(courseContractWrap);
  if (responseEntity.getStatus == HttpStatus.ok) {
    CourseContractWrap response = CourseContractWrap.fromJson(responseEntity.data);
    print('Id: ' + response.courseId.toString());
    return Text('Success!');
  } else {
    // Show pop up notification about fail reason.
    print('Error: ' + responseEntity.getException.toString());
    return Text('Failed!');
  }
}

Future<Offer> getOfferById(String courseId) async {
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
  return new Offer();
}
