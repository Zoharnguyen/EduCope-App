import 'dart:io';

import 'package:dio/dio.dart';
import 'package:edu_cope/constant/offer-type.dart';
import 'package:edu_cope/constant/user-type.dart';
import 'package:edu_cope/dto/offer.dart';
import 'package:edu_cope/dto/response-entity.dart';
import 'package:edu_cope/dto/user-profile.dart';
import 'package:edu_cope/service/api-offer.dart';
import 'package:edu_cope/view/ui/basic-operate-course/detail-information-opening-and-not-offer-class-T-and-P.dart';
import 'package:edu_cope/view/ui/basic-operate-course/show-all-offer-openning-course-T-and-P.dart';
import 'package:edu_cope/view/ui/common/widget-utils.dart';
import 'package:edu_cope/view/ui/manage-course/manage-class-T-and-P.dart';
import 'package:edu_cope/view/ui/manage-course/manage-detail-openning-class-T-and-P.dart';
import 'package:edu_cope/view/ui/notification/show-all-notification.dart';
import 'package:edu_cope/view/utils/common-utils.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

void main() async {
  // Initialize Firebase
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

final double height = CommonUtils.height;
final double width = CommonUtils.width;
var counter = 0;
UserType userType = UserType.STUDENTPARENT;

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // title: 'Edu Cope',
      // theme: ThemeData(
      //   primarySwatch: Colors.blue,
      // ),
      home: HomePageTandP(),
    );
  }
}

class HomePageTandP extends StatefulWidget {
  HomePageTandP();

  @override
  _HomePageTandPState createState() => _HomePageTandPState();
}

class _HomePageTandPState extends State<HomePageTandP> {
  late FirebaseMessaging messaging;

  // Set up for Notification with FCM
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
                        setState(() {
                          counter = 0;
                        });
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
                        setState(() {
                          counter = 0;
                        });
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
                                    builder: (context) =>
                                        ManageClassTandPPage()));
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
                                  ShowAllOfferOpenningCourseTandPPage()));
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
            height: height * 2.01 / 5,
            child: JobsListViewOffer(),
          ),
          WidgetUtils.mainButton(context, height*0.05/5, userType)
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
    print('Subject: ' + offerResponse.subject.toString());
    List<Offer> offers =
        listDecoded.map((offer) => new Offer.fromJson(offer)).toList();
    print('length: ' + offers.length.toString());
    return offers;
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
            CommonUtils.catchCaseStringNull(data[index].subject),
            CommonUtils.catchCaseStringNull(data[index].salary),
            CommonUtils.catchCaseStringNull(data[index].formatLearning),
            CommonUtils.catchCaseStringNull(data[index].level),
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
                        'Mon hoc: ' + CommonUtils.catchCaseStringNull(subject),
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
                        'Hinh thuc hoc: ' +
                            CommonUtils.catchCaseStringNull(formatLearning),
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
                        'Muc Luong: ' + CommonUtils.catchCaseStringNull(salary),
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
                          CommonUtils.catchCaseStringNull(profileAuthor.rate.toString()),
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
                          CommonUtils.catchCaseStringNull(profileAuthor.phoneNumber),
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
                          DetailInformationOpeningAndNotOfferClassTandPPage()));
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