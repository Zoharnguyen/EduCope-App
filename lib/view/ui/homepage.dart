import 'dart:io';

import 'package:dio/dio.dart';
import 'package:edu_cope/constant/offer-type.dart';
import 'package:edu_cope/dto/offer.dart';
import 'package:edu_cope/dto/response-entity.dart';
import 'package:edu_cope/dto/user-profile.dart';
import 'package:edu_cope/service/api-offer.dart';
import 'package:edu_cope/view/ui/manage-class.dart';
import 'package:edu_cope/view/ui/manage-detail-openning-class.dart';
import 'package:edu_cope/view/ui/manage-profile.dart';
import 'package:edu_cope/view/ui/show-all-notification.dart';
import 'package:edu_cope/view/ui/show-all-offer-openning-course.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

import 'create-offer-class.dart';

void main() async {
  // Initialize Firebase
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

double width = 411.4285;
double height = 683.4285;
var counter = 1;

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // title: 'Edu Cope',
      // theme: ThemeData(
      //   primarySwatch: Colors.blue,
      // ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage();

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late FirebaseMessaging messaging;

  @override
  void initState() {
    super.initState();
    messaging = FirebaseMessaging.instance;
    messaging.getToken().then((value) {
      print(value);
    });
    FirebaseMessaging.onMessage.listen((RemoteMessage event) {
      print("message recieved");
      print(event.notification!.body);
      setState(() {
        counter++;
      });
    });
    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      print('Message clicked!');
    });
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    print(width);
    height = MediaQuery.of(context).size.height;
    print(height);
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.lightBlue,
          title: Container(
            child: Text(
              'Hello \nYou aren\'t sign in',
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontFamily: "Roboto",
                fontStyle: FontStyle.normal,
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
              onPressed: () {},
              icon: new Image.asset('asset/image/blank-account.jpg'),
            ),
          ),
          actions: <Widget>[
            Container(
              width: width * 0.5 / 5,
              margin: EdgeInsets.only(
                top: width * 0.02 / 2,
              ),
              child: new Stack(
                children: <Widget>[
                  new IconButton(
                      icon: Icon(Icons.message),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ShowAllNotification()));
                      }),
                  counter != 0
                      ? new Positioned(
                          right: 5,
                          top: 8,
                          child: new Container(
                            padding: EdgeInsets.all(2),
                            decoration: new BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(6),
                            ),
                            constraints: BoxConstraints(
                              minWidth: 14,
                              minHeight: 14,
                            ),
                            child: Text(
                              '$counter',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 8,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        )
                      : new Container()
                ],
              ),
            ),
            Container(
              width: width * 0.5 / 5,
              margin: EdgeInsets.only(
                right: width * 0.07 / 2,
                top: width * 0.02 / 2,
              ),
              child: new Stack(
                children: <Widget>[
                  new IconButton(
                      icon: Icon(Icons.notifications),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ShowAllNotification()));
                      }),
                  counter != 0
                      ? new Positioned(
                          right: 11,
                          top: 8,
                          child: new Container(
                            padding: EdgeInsets.all(2),
                            decoration: new BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(6),
                            ),
                            constraints: BoxConstraints(
                              minWidth: 14,
                              minHeight: 14,
                            ),
                            child: Text(
                              '$counter',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 8,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        )
                      : new Container()
                ],
              ),
            ),
          ]),
      body: Column(
        children: <Widget>[
          Container(
            height: height * 0.8 / 5,
            margin: EdgeInsets.only(
              top: height * 0.4 / 5,
              bottom: height * 0.4 / 5,
            ),
            child: Row(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(
                    left: width * 0.1 / 2,
                    top: height * 0.05 / 5,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(8),
                      topRight: Radius.circular(8),
                      bottomLeft: Radius.circular(8),
                      bottomRight: Radius.circular(8),
                    ),
                  ),
                  child: Column(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(
                          top: height * 0.05 / 5,
                        ),
                        width: width * 0.5 / 2,
                        child: FlatButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ManageClass()));
                          },
                          child: new Image.asset('asset/image/class.png'),
                        ),
                      ),
                      Container(
                        width: width * 0.35 / 2,
                        margin: EdgeInsets.only(
                          top: height * 0.02 / 5,
                        ),
                        child: Align(
                          child: Text(
                            'Lớp học',
                            style: TextStyle(
                              color: Colors.blue,
                              fontSize: 16,
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
                    top: height * 0.05 / 5,
                    left: width * 0.15 / 2,
                  ),
                  width: width * 0.5 / 2,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(8),
                      topRight: Radius.circular(8),
                      bottomLeft: Radius.circular(8),
                      bottomRight: Radius.circular(8),
                    ),
                  ),
                  child: Column(
                    children: <Widget>[
                      Container(
                        width: width * 0.35 / 2,
                        child: new Image.asset('asset/image/map.png'),
                      ),
                      Container(
                        width: width * 0.35 / 2,
                        margin: EdgeInsets.only(
                          top: height * 0.06 / 5,
                        ),
                        child: Align(
                          child: Text(
                            'Bản đồ',
                            style: TextStyle(
                              color: Colors.blue,
                              fontSize: 16,
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
                    top: height * 0.05 / 5,
                  ),
                  width: width * 0.5 / 2,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(8),
                      topRight: Radius.circular(8),
                      bottomLeft: Radius.circular(8),
                      bottomRight: Radius.circular(8),
                    ),
                  ),
                  child: Column(
                    children: <Widget>[
                      Container(
                        width: width * 0.35 / 2,
                        child: new Image.asset('asset/image/payment.png'),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                          top: height * 0.08 / 5,
                        ),
                        width: width * 0.4 / 2,
                        child: Align(
                          child: Text(
                            'Thanh toán',
                            style: TextStyle(
                              color: Colors.blue,
                              fontSize: 16,
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
              ],
            ),
          ),
          Container(
            height: height * 0.3 / 5,
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(
                  width: 1,
                  color: Colors.lightBlue,
                ),
              ),
            ),
            child: Row(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(
                    left: width * 0.1 / 2,
                  ),
                  child: Text(
                    'Danh sach tim gia su',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                    left: width * 0.45 / 2,
                  ),
                  child: FlatButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  ShowAllOfferOpenningCourse()));
                    },
                    child: Text(
                      'Xem tat ca >>>',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
            height: height * 1.97 / 5,
            child: JobsListViewOffer(),
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
        ],
      ),
    );
  }
}

class JobsListViewOffer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Offer>>(
        future: _fetchOffers(),
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

Future<List<Offer>> _fetchOffers() async {
  // List<Offer> offers = List<Offer>();
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
  ResponseEntity responseEntity =
      await apiOfferClient.getOffersByOfferType(OfferType.TEACHER);
  var offers = <Offer>[];
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

ListView _jobsListView(data) {
  return ListView.builder(
      scrollDirection: Axis.horizontal,
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
    height: height / 5,
    width: width * 1.4 / 2,
    margin: EdgeInsets.only(
      bottom: height * 0.02 / 5,
      top: height * 0.1 / 5,
      right: width * 0.1 / 2,
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
            width: width * 1.4 / 2,
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
                width: width * 0.9 / 2,
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
                        'Muc Luong: ' + _catchCaseStringNull(salary),
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
                        height: height * 0.4 / 5,
                        child: new Image.asset('asset/image/blank-account.jpg'),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                          top: height * 0.05 / 5,
                          left: width * 0.02 / 2,
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
                          left: width * 0.02 / 2,
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
                      builder: (context) =>
                          ManageDetailOpeningClass()));
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