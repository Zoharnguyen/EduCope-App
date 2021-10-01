import 'dart:io';

import 'package:dio/dio.dart';
import 'package:edu_cope/dto/course-contract-wrap.dart';
import 'package:edu_cope/dto/offer.dart';
import 'package:edu_cope/dto/response-entity.dart';
import 'package:edu_cope/dto/schedule-offer.dart';
import 'package:edu_cope/dto/user-profile.dart';
import 'package:edu_cope/service/api-offer.dart';
import 'package:edu_cope/view/ui/common/widget-utils.dart';
import 'package:edu_cope/view/ui/manage-course/manage-detail-openning-class-T-and-P.dart';
import 'package:edu_cope/view/utils/common-utils.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

double width = CommonUtils.width;
double height = CommonUtils.height;
String courseIdGlobal = '';
bool checkCourseBelongUserGlobal = false;
CourseContractWrap courseContractWrap = new CourseContractWrap();

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CreateCourseContractTPage('', checkCourseBelongUserGlobal),
    );
  }
}

class CreateCourseContractTPage extends StatefulWidget {
  CreateCourseContractTPage(String courseId, bool checkCourseBelongUser) {
    courseIdGlobal = courseId;
    checkCourseBelongUserGlobal = checkCourseBelongUser;
  }

  @override
  _CreateCourseContractTPageState createState() =>
      _CreateCourseContractTPageState();
}

class _CreateCourseContractTPageState extends State<CreateCourseContractTPage> {
  String _formatLearning = 'Hoc tai nha';
  Offer offer =
      Offer.withScheduleAndUserProfile(new ScheduleOffer(), new UserProfile());

  @override
  initState() {
    super.initState();
    offer.formatLearning = _formatLearning;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(WidgetUtils.valueColorAppBar),
          title: Container(
            margin: EdgeInsets.only(
              right: width * 0.3 / 2,
            ),
            child: Align(
              child: Text(
                'Tạo hợp đồng',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: CommonUtils.getUnitPx() * 20,
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
        body: FutureBuilder<Offer>(
            future: getOfferById(courseIdGlobal),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                offer = snapshot.data!;
                courseContractWrap.courseContract!
                    .formatLearning = offer.formatLearning;
                return SingleChildScrollView(
                  reverse: false,
                  child: Column(
                    // Make list containers in Column start with left screen
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      titleForItems('Môn học'),
                      inputShortContentItem(setValueIfStringNull(offer.subject),
                          'subject', courseContractWrap),
                      titleForItems('Hoc phi'),
                      inputShortContentItem(setValueIfStringNull(offer.salary),
                          'salary', courseContractWrap),
                      titleForItems('Thanh toán sau'),
                      inputShortContentItem(
                          '10 ngày', 'paymentDate', courseContractWrap),
                      titleForItems('Hình thức học'),
                      Container(
                        margin: EdgeInsets.only(
                          left: width * 0.35 / 2,
                        ),
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
                              fontSize: CommonUtils.getUnitPx() * 16,
                            ),
                          ),
                          onChanged: (value) {
                            setState(() {
                              _formatLearning = value!;
                              courseContractWrap.courseContract!
                                  .formatLearning = _formatLearning;
                              // After selected drop down then cursor don't focus any text field
                              FocusScope.of(context)
                                  .requestFocus(new FocusNode());
                            });
                          },
                        ),
                      ),
                      titleForItems('Luu y'),
                      inputLongContentItem(setValueIfStringNull(offer.note),
                          "note", courseContractWrap),
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
                          child: Text(
                            "Tạo",
                            style: TextStyle(
                                fontSize: CommonUtils.getUnitPx() * 18,
                                color: Colors.white,
                                fontFamily: "Roboto",
                                fontStyle: FontStyle.normal),
                          ),
                          onPressed: () {
                            _createCourseContract(courseContractWrap);
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
                );
              } else return new Container();
            }));
  }
}

String setValueIfStringNull(String? value) {
  if (value == null)
    return '';
  else
    return value.toString();
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
                          fontSize: CommonUtils.getUnitPx() * 20,
                          color: Colors.blue),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Hợp đồng đã được tạo',
                      style: TextStyle(fontSize: CommonUtils.getUnitPx() * 14),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    RaisedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    ManageDetailOpeningClassTandPPage(
                                        courseIdGlobal,
                                        checkCourseBelongUserGlobal,
                                        '')));
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

Container inputLongContentItem(String contentInitialValue, String fieldName,
    CourseContractWrap courseContractWrap) {
  setValueForOffer(contentInitialValue, fieldName, courseContractWrap);
  print(fieldName + " : " + contentInitialValue);
  return Container(
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
          fontSize: CommonUtils.getUnitPx() * 14,
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

Container inputShortContentItem(String contentInitialValue, String fieldName,
    CourseContractWrap courseContractWrap) {
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
          fontSize: CommonUtils.getUnitPx() * 14,
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

void setValueForOffer(
    String value, String fieldName, CourseContractWrap courseContractWrap) {
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
                color: Color(0xFF1298e0),
                fontSize: CommonUtils.getUnitPx() * 20,
                fontStyle: FontStyle.italic,
              ),
            )),
      ],
    ),
  );
}

Future<Widget> _createCourseContract(
    CourseContractWrap courseContractWrap) async {
  courseContractWrap.courseId = courseIdGlobal;
  APIOfferClient apiOfferClient =
      APIOfferClient(Dio(BaseOptions(contentType: "application/json")));
  ResponseEntity responseEntity =
      await apiOfferClient.createCourseContract(courseContractWrap);
  if (responseEntity.getStatus == HttpStatus.ok) {
    CourseContractWrap response =
        CourseContractWrap.fromJson(responseEntity.data);
    print('Id: ' + response.courseId.toString());
    return Text('Success!');
  } else {
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
    // Set user information into contract
    courseContractWrap.courseContract!.userProfileCreate =
        offerResponse.profileAuthor;
    if (offerResponse.memberClassList != null &&
        offerResponse.memberClassList!.length > 0) {
      courseContractWrap.courseContract!.userProfileRegistry =
          offerResponse.memberClassList!.first;
    }
    return offerResponse;
  } else {
    print('Error: ' + responseEntity.getException.toString());
  }
  return new Offer();
}
