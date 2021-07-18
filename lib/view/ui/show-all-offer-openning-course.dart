import 'dart:io';

import 'package:dio/dio.dart';
import 'package:edu_cope/constant/offer-type.dart';
import 'package:edu_cope/dto/offer.dart';
import 'package:edu_cope/dto/response-entity.dart';
import 'package:edu_cope/dto/user-profile.dart';
import 'package:edu_cope/service/api-offer.dart';
import 'package:edu_cope/view/ui/detail-information-opening-and-not-offer-class.dart';
import 'package:edu_cope/view/ui/manage-profile.dart';
import 'package:flutter/material.dart';

import 'create-offer-class.dart';
import 'homepage.dart';

void main() {
  runApp(MyApp());
}

double width = 411.4285;
double height = 683.4285;
String subject = 'toan';
Future<List<Offer>> offers = _fetchLearningOffers(subject);

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // title: 'Edu Cope',
      // theme: ThemeData(
      //   primarySwatch: Colors.blue,
      // ),
      home: ShowAllOfferOpenningCourse(),
    );
  }
}

class ShowAllOfferOpenningCourse extends StatefulWidget {
  ShowAllOfferOpenningCourse();

  @override
  _ShowAllOfferOpenningCourseState createState() =>
      _ShowAllOfferOpenningCourseState();
}

class _ShowAllOfferOpenningCourseState
    extends State<ShowAllOfferOpenningCourse> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        title: Container(
          margin: EdgeInsets.only(
            right: width * 0.3 / 2,
          ),
          child: Align(
            child: Text(
              'Danh sách khóa học',
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
      body: Column(
        children: <Widget>[
          Container(
            color: Colors.grey[100],
            margin: EdgeInsets.only(top: height * 0.1 / 5),
            height: height*0.5 / 5,
            child: Row(
              children: <Widget>[
                Container(
                  // height: height*0.45/5,
                  // decoration: BoxDecoration(
                  //     border: Border.all(
                  //       width: 1,
                  //     ),
                  //     borderRadius: BorderRadius.only(
                  //       bottomLeft: Radius.circular(27),
                  //       topLeft: Radius.circular(27),
                  //       bottomRight: Radius.circular(27),
                  //       topRight: Radius.circular(27),
                  //     ),
                  // ),
                  width: width * 1.4 / 2,
                  padding: EdgeInsets.only(
                    left: width * 0.2 / 2,
                    right: width * 0.2 / 2,
                  ),
                  child: TextField(
                    autofocus: false,
                    cursorWidth: 2,
                    cursorHeight: 25,
                    onChanged: (value) {
                      subject = value;
                    },
                    decoration: InputDecoration(
                      hintText: "Môn học",
                      hintStyle: TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                      // border: OutlineInputBorder(
                      //   borderSide: BorderSide(
                      //     width: 1,
                      //   ),
                      // ),
                    ),
                  ),
                ),
                Container(
                  height: height * 0.2 / 5,
                  width: width * 1.5 / 7,
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
                    onPressed: () async {
                      setState(() {
                        offers = _fetchLearningOffers(subject);
                      });
                    },
                    child: Text(
                      "Tìm kiếm",
                      style: TextStyle(
                          fontSize: 13,
                          color: Colors.white,
                          fontFamily: "Roboto",
                          fontStyle: FontStyle.normal),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: height*3.35/5,
            child: JobsListViewOffer(),
          ),
          Container(
            color: Colors.grey[100],
            margin: EdgeInsets.only(
              top: height * 0.021 / 5,
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
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => HomePage()));
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
                              builder: (context) => CreateOfferClass()));
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
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => ManageProfile()));
                      },
                      child: new Image.asset('asset/image/personal_blue.png'),
                    )),
              ],
            ),
          )
,
        ],
      ),
    );
  }
}

Future<List<Offer>> _fetchLearningOffers(String subject) async {
  List<Offer> offers = <Offer>[];
  //Mock data
  // Offer offer = new Offer();
  // UserProfile userProfile = new UserProfile();
  // userProfile.rate = '5';
  // userProfile.phoneNumber = '0123456789';
  // offer.profileAuthor = userProfile;
  // offer.subject = 'Toan';
  // offer.salary = '500k/1b';
  // offer.formatLearning = 'Hoc tai nha';
  // offer.level = 'Trung hoc';
  // offers.add(offer);
  // offers.add(offer);
  // offers.add(offer);
  // offers.add(offer);
  // offers.add(offer);
  APIOfferClient apiOfferClient =
  APIOfferClient(Dio(BaseOptions(contentType: "application/json")));
  if(subject == null) {
    subject = 'Toan';
  }
  ResponseEntity responseEntity =
  await apiOfferClient.getOffersByOfferTypeAndSubject(OfferType.TEACHER, subject);
  if (responseEntity.getStatus == HttpStatus.ok) {
    List listDecoded = responseEntity.data;
    Offer offerResponse = Offer.fromJson(responseEntity.data[0]);
    print('Subject: ' + offerResponse.subject);
    return listDecoded.map((offer) => new Offer.fromJson(offer)).toList();
    // Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
  } else {
    // Show pop up notification about fail reason.
    print('Error: ' + responseEntity.getException.toString());
  }
  return offers;
}

class JobsListViewOffer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Offer>>(
        future: offers,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<Offer>? data = snapshot.data;
            return _jobsListView(data);
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }
          return Text("${snapshot.error}");
        });
  }
}

ListView _jobsListView(data) {
  return ListView.builder(
      scrollDirection: Axis.vertical,
      itemCount: data.length,
      itemBuilder: (context, index) {
        return _jobsShowOffer(
            data[index].subject,
            data[index].salary,
            data[index].formatLearning,
            data[index].level,
            data[index].profileAuthor,
            context);
      });
}

Widget _jobsShowOffer(String subject, String salary, String formatLearning,
    String level, UserProfile profileAuthor, BuildContext context) {
  return Container(
    height: height * 1.8 / 5,
    width: width * 1.6 / 2,
    margin: EdgeInsets.only(
      bottom: height * 0.02 / 5,
      top: height * 0.1 / 5,
      right: width * 0.2 / 2,
      left: width * 0.2 / 2,
    ),
    decoration: BoxDecoration(
        color: Colors.lightBlue[50],
        // border: Border.all(
        //   color: Colors.green,f
        //   width: 2,
        // ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(17),
          bottomRight: Radius.circular(17),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade400,
            offset: Offset(0, 4),
          ),
        ]),
    child: Column(
      // crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
            height: height * 0.35 / 5,
            width: width * 1.6 / 2,
            decoration: BoxDecoration(
              color: Colors.lightBlue,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(17),
                topRight: Radius.circular(17),
              ),
            ),
            child: Align(
              child: Text(
                'Gia su - ' + subject,
                // 'Gia su - ' + subject + ' - ' + level,
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            )),
        Container(
          child: Row(
            children: <Widget>[
              Container(
                height: height * 0.7 / 5,
                width: width * 1.1 / 2,
                // decoration: BoxDecoration(
                //   border: Border.all(
                //     color: Colors.green,
                //     width: 2,
                //   )
                // ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(
                        // top: height * 0.05 / 5,
                        left: width * 0.02 / 2,
                      ),
                      child: Text(
                        'Mon hoc: ' + _catchCaseStringNull(subject),
                        style: TextStyle(
                          fontSize: 14,
                          fontFamily: "Roboto",
                          fontStyle: FontStyle.normal,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        top: height * 0.05 / 5,
                        left: width * 0.02 / 2,
                      ),
                      child: Text(
                        'Hinh thuc hoc: ' + _catchCaseStringNull(formatLearning),
                        style: TextStyle(
                          fontSize: 14,
                          fontFamily: "Roboto",
                          fontStyle: FontStyle.normal,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        top: height * 0.05 / 5,
                        left: width * 0.02 / 2,
                      ),
                      child: Text(
                        'Muc Luong: ' + salary,
                        style: TextStyle(
                          fontSize: 14,
                          fontFamily: "Roboto",
                          fontStyle: FontStyle.normal,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                  width: width * 0.5 / 2,
                  // decoration: BoxDecoration(
                  //   border: Border.all(
                  //     color: Colors.green,
                  //     width: 2,
                  //   )
                  // ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(
                          top: height * 0.05 / 5,
                          right: width * 0.02 / 2,
                        ),
                        height: height * 0.4 / 5,
                        child: new Image.asset('asset/image/blank-account.jpg'),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                          top: height * 0.05 / 5,
                          right: width * 0.02 / 2,
                        ),
                        child: Text(
                          _catchCaseStringNull(profileAuthor.rate),
                          style: TextStyle(
                            fontSize: 14,
                            fontFamily: "Roboto",
                            fontStyle: FontStyle.normal,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                          top: height * 0.05 / 5,
                          right: width * 0.02 / 2,
                        ),
                        child: Text(
                          _catchCaseStringNull(profileAuthor.phoneNumber),
                          style: TextStyle(
                            fontSize: 14,
                            fontFamily: "Roboto",
                            fontStyle: FontStyle.normal,
                          ),
                        ),
                      )
                    ],
                  )),
            ],
          ),
        ),
        Container(
          height: height * 0.2 / 5,
          child: FlatButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => DetailInformationOpeningAndNotOfferClass()));
            },
            child: Text(
              'Chi tiet >>>',
              style: TextStyle(fontSize: 16, color: Colors.black),
            ),
          ),
        )
      ],
    ),
  );
}

String _catchCaseStringNull(String value) {
  if (value == null)
    return '';
  else
    return value;
}
