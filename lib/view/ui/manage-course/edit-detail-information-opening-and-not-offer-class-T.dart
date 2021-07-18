import 'dart:io';

import 'package:dio/dio.dart';
import 'package:edu_cope/dto/offer.dart';
import 'package:edu_cope/dto/response-entity.dart';
import 'package:edu_cope/dto/schedule-offer.dart';
import 'package:edu_cope/dto/user-profile.dart';
import 'package:edu_cope/service/api-offer.dart';
import 'package:edu_cope/view/ui/basic-operate-course/detail-information-opening-and-not-offer-class-T-and-P.dart';
import 'package:edu_cope/view/ui/homepage-T.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

double width = 411.4285;
double height = 683.4285;

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // title: 'Edu Cope',
      // theme: ThemeData(
      //   primarySwatch: Colors.blue,
      // ),
      home: EditDetailInformationOpeningAndNotOfferClassTPage(),
    );
  }
}

class EditDetailInformationOpeningAndNotOfferClassTPage extends StatefulWidget {
  EditDetailInformationOpeningAndNotOfferClassTPage();

  @override
  _etailInformationOpeningAndNotOfferClassEditState createState() => _etailInformationOpeningAndNotOfferClassEditState();
}

class _etailInformationOpeningAndNotOfferClassEditState extends State<EditDetailInformationOpeningAndNotOfferClassTPage> {
  String _subjectName = 'Tieu hoc';
  String _formatLearning = 'Hoc tai nha';
  Offer _offer =
  Offer.withScheduleAndUserProfile(new ScheduleOffer(), new UserProfile());

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    final bottomKeyboard = MediaQuery.of(context).viewInsets.bottom;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        title: Container(
          margin: EdgeInsets.only(
            right: width * 0.3 / 2,
          ),
          child: Align(
            child: Text(
              'Thông tin lớp học',
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
            inputShortContentItem('Toan', 'subject', _offer),
            titleForItems('Cap hoc'),
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
            inputShortContentItem('500k/1 buoi', 'salary', _offer),
            titleForItems('Ngay hoc trong tuan'),
            inputShortContentItem(
                'Thu 3,5,7', 'scheduleOffer.overview', _offer),
            titleForItems('Thoi gian hoc'),
            inputShortContentItem(
                'Buoi toi tu 20h-22h', 'scheduleOffer.detail', _offer),
            titleForItems('Dia diem(Neu chon hoc tai nha)'),
            inputShortContentItem(
                'Cac khu vuc noi thanh Ha Noi', 'note', _offer),
            titleForItems('Luu y'),
            inputLongContentItem(
                'Day tai nha hoc sinh, chi day cho hoc sinh nam'),
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
                  "Cập nhật",
                  style: TextStyle(
                      fontSize: 18,
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
      ),
    );
  }
}

class AdvanceCustomAlert extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Dialog(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4.0)
        ),
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
                    Text('Thành Công', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.blue),),
                    SizedBox(height: 5,),
                    Text('Khóa học đã được cập nhật', style: TextStyle(fontSize: 14),),
                    SizedBox(height: 20,),
                    RaisedButton(onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => DetailInformationOpeningAndNotOfferClassTandPPage()));
                    },
                      color: Colors.lightBlue,
                      child: Text('Đóng', style: TextStyle(color: Colors.white),),
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
                  child: Icon(Icons.save, color: Colors.white, size: 50,),
                )
            ),
          ],
        )
    );
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
    case 'note':
      offer.note = value;
      break;
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
                fontSize: 20,
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

Future<Widget> _updateOffer(Offer offer) async {
  offer.id = "60e394825ded485c37a643f1";
  offer.profileAuthor!.fullName = 'Nguyen AAA';
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