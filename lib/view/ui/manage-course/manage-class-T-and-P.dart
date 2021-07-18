import 'package:edu_cope/dto/offer.dart';
import 'package:edu_cope/dto/user-profile.dart';
import 'package:edu_cope/view/ui/basic-operate-course/create-offer-class-T.dart';
import 'package:edu_cope/view/ui/manage-course/manage-detail-learning-class-T-and-P.dart';
import 'package:edu_cope/view/ui/manage-profile/manage-profile-T-and-P.dart';
import 'package:edu_cope/view/utils/common-utils.dart';
import 'package:flutter/material.dart';

import '../homepage-T.dart';
import 'manage-detail-openning-class-T-and-P.dart';

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
      home: ManageClassTandPPage(),
    );
  }
}

class ManageClassTandPPage extends StatefulWidget {
  ManageClassTandPPage();

  @override
  _ManageClassTandPPageState createState() => _ManageClassTandPPageState();
}

class _ManageClassTandPPageState extends State<ManageClassTandPPage> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            height: height * 4.55 / 5,
            child: DefaultTabController(
              length: 3,
              child: Scaffold(
                  appBar: PreferredSize(
                    preferredSize: Size(width * 0.9, height * 0.6 / 5),
                    child: AppBar(
                      leading: Container(
                        margin: EdgeInsets.only(
                          top: height * 0.04 / 5,
                        ),
                        child: IconButton(
                          icon: Icon(Icons.arrow_back_ios),
                          // iconSize: 20,
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HomePageT()));
                          },
                        ),
                      ),
                      centerTitle: true,
                      title: Text(
                        'Quản Lý Lớp Hoc',
                        style: TextStyle(
                          fontSize: 24,
                        ),
                      ),
                      bottom: TabBar(
                        tabs: <Widget>[
                          Text(
                            'Đang học',
                            style: TextStyle(fontSize: 20),
                          ),
                          Text(
                            'Đang mở',
                            style: TextStyle(fontSize: 20),
                          ),
                          Text(
                            'Đã kết thúc',
                            style: TextStyle(fontSize: 20),
                          ),
                        ],
                      ),
                    ),
                  ),
                  body: TabBarView(children: <Widget>[
                    JobsListViewLearningOffer(),
                    JobsListViewOpeningOffer(),
                    JobsListViewOpeningOffer(),
                  ])),
            ),
          ),
          Container(
            color: Colors.grey[100],
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
                          MaterialPageRoute(builder: (context) => HomePageT()));
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
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => ManageProfileTandPPage()));
                      },
                      child: new Image.asset('asset/image/personal_blue.png'),
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Tab listview for opening class
class JobsListViewOpeningOffer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Offer>>(
        future: _fetchOpeningOffers(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<Offer>? data = snapshot.data;
            return Container(
                margin: EdgeInsets.only(
                  top: height * 0.1 / 5,
                ),
                child: _jobsOpeningClassListView(data));
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }
          return Text("${snapshot.error}");
        });
  }
}

Future<List<Offer>> _fetchOpeningOffers() async {
  // APIOfferClient apiOfferClient =
  // APIOfferClient(Dio(BaseOptions(contentType: "application/json")));
  // ResponseEntity responseEntity =
  // await apiOfferClient.getOffersByOfferType(OfferType.TEACHER);
  List<Offer> offers = <Offer>[];
  Offer offer = new Offer();
  UserProfile userProfile = new UserProfile();
  userProfile.rate = '5';
  userProfile.phoneNumber = '0123456789';
  offer.profileAuthor = userProfile;
  offer.subject = 'Toan';
  offer.salary = '500k/1b';
  offer.formatLearning = 'Hoc tai nha';
  offer.level = 'Trung hoc';
  offers.add(offer);
  offers.add(offer);
  offers.add(offer);
  offers.add(offer);
  offers.add(offer);
  // if (responseEntity.getStatus == HttpStatus.ok) {
  //   List listDecoded = responseEntity.data;
  //   Offer offerResponse = Offer.fromJson(responseEntity.data[0]);
  //   print('Subject: ' + offerResponse.subject);
  //   return listDecoded.map((offer) => new Offer.fromJson(offer)).toList();
  //   // Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
  // } else {
  //   // Show pop up notification about fail reason.
  //   print('Error: ' + responseEntity.getException.toString());
  // }
  return offers;
}

ListView _jobsOpeningClassListView(data) {
  return ListView.builder(
      scrollDirection: Axis.vertical,
      itemCount: data.length,
      itemBuilder: (context, index) {
        return _jobsShowOpeningOffer(
            data[index].subject,
            data[index].salary,
            data[index].formatLearning,
            data[index].level,
            data[index].profileAuthor,
            context);
      });
}

Widget _jobsShowOpeningOffer(
    String subject,
    String salary,
    String formatLearning,
    String level,
    UserProfile profileAuthor,
    BuildContext context) {
  return Container(
    height: height * 2 / 5,
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
                        'Mon hoc: ' + subject,
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
                        'Hinh thuc hoc: ' + formatLearning,
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
                      builder: (context) => ManageDetailOpeningClassTandPPage()));
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

// Tab list view for learning class
class JobsListViewLearningOffer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Offer>>(
        future: _fetchLearningOffers(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<Offer>? data = snapshot.data;
            return Container(
                margin: EdgeInsets.only(
                  top: height * 0.1 / 5,
                ),
                child: _jobsLearningClassListView(data));
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }
          return Text("${snapshot.error}");
        });
  }
}

Future<List<Offer>> _fetchLearningOffers() async {
  // APIOfferClient apiOfferClient =
  // APIOfferClient(Dio(BaseOptions(contentType: "application/json")));
  // ResponseEntity responseEntity =
  // await apiOfferClient.getOffersByOfferType(OfferType.TEACHER);
  List<Offer> offers = <Offer>[];
  Offer offer = new Offer();
  UserProfile userProfile = new UserProfile();
  userProfile.rate = '5';
  userProfile.phoneNumber = '0123456789';
  offer.profileAuthor = userProfile;
  offer.subject = 'Toan';
  offer.salary = '500k/1b';
  offer.formatLearning = 'Hoc tai nha';
  offer.level = 'Trung hoc';
  offers.add(offer);
  offers.add(offer);
  offers.add(offer);
  offers.add(offer);
  offers.add(offer);
  // if (responseEntity.getStatus == HttpStatus.ok) {
  //   List listDecoded = responseEntity.data;
  //   Offer offerResponse = Offer.fromJson(responseEntity.data[0]);
  //   print('Subject: ' + offerResponse.subject);
  //   return listDecoded.map((offer) => new Offer.fromJson(offer)).toList();
  //   // Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
  // } else {
  //   // Show pop up notification about fail reason.
  //   print('Error: ' + responseEntity.getException.toString());
  // }
  return offers;
}

ListView _jobsLearningClassListView(data) {
  return ListView.builder(
      scrollDirection: Axis.vertical,
      itemCount: data.length,
      itemBuilder: (context, index) {
        return _jobsShowLearningClass(
            data[index].subject,
            data[index].salary,
            data[index].formatLearning,
            data[index].level,
            data[index].profileAuthor,
            context);
      });
}

Widget _jobsShowLearningClass(
    String subject,
    String salary,
    String formatLearning,
    String level,
    UserProfile profileAuthor,
    BuildContext context) {
  return Container(
    height: height * 2 / 5,
    width: width * 1.6 / 2,
    margin: EdgeInsets.only(
      bottom: height * 0.02 / 5,
      top: height * 0.1 / 5,
      right: width * 0.2 / 2,
      left: width * 0.2 / 2,
    ),
    decoration: BoxDecoration(
        color: Colors.green[50],
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
              color: Colors.green[400],
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(17),
                topRight: Radius.circular(17),
              ),
            ),
            child: Align(
              child: Text(
                'Gia su - ' + subject,
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
                        'Mon hoc: ' + subject,
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
                        'Hinh thuc hoc: ' + formatLearning,
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
                      builder: (context) => ManageDetailLearningClassTandPPage()));
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
