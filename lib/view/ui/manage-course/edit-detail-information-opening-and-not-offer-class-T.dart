import 'dart:io';

import 'package:dio/dio.dart';
import 'package:edu_cope/constant/from-screen.dart';
import 'package:edu_cope/dto/offer.dart';
import 'package:edu_cope/dto/response-entity.dart';
import 'package:edu_cope/dto/schedule-offer.dart';
import 'package:edu_cope/dto/user-profile.dart';
import 'package:edu_cope/service/api-offer.dart';
import 'package:edu_cope/view/ui/basic-operate-course/detail-information-opening-and-not-offer-class-T-and-P.dart';
import 'package:edu_cope/view/ui/common/widget-utils.dart';
import 'package:edu_cope/view/utils/common-utils.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

double width = CommonUtils.width;
double height = CommonUtils.height;
String courseIdGlobal = '';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: EditDetailInformationOpeningAndNotOfferClassTPage(''),
    );
  }
}

class EditDetailInformationOpeningAndNotOfferClassTPage extends StatefulWidget {
  EditDetailInformationOpeningAndNotOfferClassTPage(String courseId) {
    courseIdGlobal = courseId;
  }

  @override
  _EditDetailInformationOpeningAndNotOfferClassEditState createState() =>
      _EditDetailInformationOpeningAndNotOfferClassEditState();
}

class _EditDetailInformationOpeningAndNotOfferClassEditState
    extends State<EditDetailInformationOpeningAndNotOfferClassTPage> {
  String _subjectName = 'Tieu hoc';
  String _formatLearning = 'Hoc tai nha';
  Offer _offer =
      Offer.withScheduleAndUserProfile(new ScheduleOffer(), new UserProfile());

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
              'Thông tin lớp học',
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
            _offer = snapshot.data!;
            return SingleChildScrollView(
              reverse: false,
              child: Column(
                // Make list containers in Column start with left screen
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  titleForItems('Môn học'),
                  inputShortContentItem(
                      CommonUtils.catchCaseStringNull(_offer.subject),
                      'subject',
                      _offer),
                  titleForItems('Cap hoc'),
                  Container(
                    margin: EdgeInsets.only(
                      left: width * 0.35 / 2,
                    ),
                    child: DropdownButton<String>(
                      value: _subjectName,
                      //elevation: 5,
                      style: TextStyle(color: Colors.black),
                      items: <String>[
                        'Tieu hoc',
                        'Trung hoc co so',
                        'Trung hoc pho thong',
                        'Dai hoc',
                      ].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          _subjectName = value!;
                          _offer.subject = _subjectName;
                          // After selected drop down then cursor don't focus any text field
                          FocusScope.of(context).requestFocus(new FocusNode());
                        });
                      },
                    ),
                  ),
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
                      onChanged: (value) {
                        setState(() {
                          _formatLearning = value!;
                          _offer.formatLearning = _formatLearning;
                          // After selected drop down then cursor don't focus any text field
                          FocusScope.of(context).requestFocus(new FocusNode());
                        });
                      },
                    ),
                  ),
                  titleForItems('Hoc phi'),
                  inputShortContentItem(
                      CommonUtils.catchCaseStringNull(_offer.salary),
                      'salary',
                      _offer),
                  titleForItems('Ngay hoc trong tuan'),
                  inputShortContentItem(
                      CommonUtils.catchCaseStringNull(
                          _offer.scheduleOffer!.overview),
                      'scheduleOffer.overview',
                      _offer),
                  titleForItems('Thoi gian hoc'),
                  inputShortContentItem(
                      CommonUtils.catchCaseStringNull(
                          _offer.scheduleOffer!.detail),
                      'scheduleOffer.detail',
                      _offer),
                  titleForItems('Dia diem(Neu chon hoc tai nha)'),
                  inputShortContentItem(
                      CommonUtils.catchCaseStringNull(_offer.preferAddress),
                      'preferAddress',
                      _offer),
                  titleForItems('Luu y'),
                  inputLongContentItem(
                      CommonUtils.catchCaseStringNull(_offer.note)),
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
                        "Cập nhật",
                        style: TextStyle(
                            fontSize: CommonUtils.getUnitPx() * 18,
                            color: Colors.white,
                            fontFamily: "Roboto",
                            fontStyle: FontStyle.normal),
                      ),
                      onPressed: () {
                        _updateOffer(_offer);
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
          } else
            return Container();
        },
      ),
    );
  }
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
                      'Khóa học đã được cập nhật',
                      style: TextStyle(fontSize: CommonUtils.getUnitPx() * 14),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    RaisedButton(
                      onPressed: () {
                        // Remove some unnecessary screens out stack Navigator.
                        Navigator.pop(context);
                        Navigator.pop(context);
                        Navigator.pop(context);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    DetailInformationOpeningAndNotOfferClassTandPPage(
                                        true,
                                        FromScreen.fromScreenManageOpeningClass,
                                        courseIdGlobal)));
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

Container inputShortContentItem(
    String contentInitialValue, String fieldName, Offer offer) {
  setValueForOffer(contentInitialValue, fieldName, offer);
  return Container(
    height: height * 0.4 / 5,
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
        setValueForOffer(text, fieldName, offer);
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

void setValueForOffer(String value, String fieldName, Offer offer) {
  switch (fieldName) {
    case 'subject':
      offer.subject = value;
      break;
    case 'scheduleOffer.overview':
      offer.scheduleOffer!.overview = value;
      break;
    case 'scheduleOffer.detail':
      offer.scheduleOffer!.detail = value;
      break;
    case 'level':
      offer.level = value;
      break;
    case 'formatLearning':
      offer.formatLearning = value;
      break;
    case 'salary':
      offer.salary = value;
      break;
    case 'preferAddress':
      offer.preferAddress = value;
      break;
    case 'preferAddress':
      offer.preferAddress = value;
      break;
    case 'note':
      offer.note = value;
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

Container inputLongContentItem(String initialValueItem) {
  return Container(
    width: width * 1.3 / 2,
    // height: height * 1.5 / 5,
    margin: EdgeInsets.only(
      right: width * 0.2 / 2,
      left: width * 0.3 / 2,
    ),
    child: TextFormField(
      autofocus: false,
      maxLines: 2,
      cursorWidth: 2,
      cursorHeight: 25,
      initialValue: initialValueItem,
      onChanged: (text) {},
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

Future<Widget> _updateOffer(Offer offer) async {
  offer.id = courseIdGlobal;
  APIOfferClient apiOfferClient =
      APIOfferClient(Dio(BaseOptions(contentType: "application/json")));
  ResponseEntity responseEntity = await apiOfferClient.updateOffer(offer);
  if (responseEntity.getStatus == HttpStatus.ok) {
    Offer offerResponse = Offer.fromJson(responseEntity.data);
    print('Subject: ' + offerResponse.subject.toString());
    print('Id: ' + offerResponse.id.toString());
    return Text('Success!');
  } else {
    print('Error: ' + responseEntity.getException.toString());
    return Text('Failed!');
  }
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
  } else {
    print('Error: ' + responseEntity.getException.toString());
  }
  return offer;
}
