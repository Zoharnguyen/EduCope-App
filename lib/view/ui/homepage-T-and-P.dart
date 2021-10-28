import 'dart:io';

import 'package:dio/dio.dart';
import 'package:edu_cope/constant/from-screen.dart';
import 'package:edu_cope/constant/offer-type.dart';
import 'package:edu_cope/dto/course-status.dart';
import 'package:edu_cope/dto/offer.dart';
import 'package:edu_cope/dto/response-entity.dart';
import 'package:edu_cope/dto/user-profile.dart';
import 'package:edu_cope/service/api-account.dart';
import 'package:edu_cope/service/api-offer.dart';
import 'package:edu_cope/view/ui/basic-operate-course/detail-information-opening-and-not-offer-class-T-and-P.dart';
import 'package:edu_cope/view/ui/basic-operate-course/show-all-offer-openning-course-T-and-P.dart';
import 'package:edu_cope/view/ui/chat/manage-chat.dart';
import 'package:edu_cope/view/ui/common/developing-feature-screen-T-and-P.dart';
import 'package:edu_cope/view/ui/common/widget-utils.dart';
import 'package:edu_cope/view/ui/manage-course/manage-class-T-and-P.dart';
import 'package:edu_cope/view/ui/notification/show-all-notification.dart';
import 'package:edu_cope/view/utils/common-utils.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

import 'manage-course/manage-detail-openning-class-T-and-P.dart';

void main() async {
  // Initialize Firebase
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

final double height = CommonUtils.height;
final double width = CommonUtils.width;
var counter = 0;
String userIdGlobal = CommonUtils.currentUserId;
UserProfile userProfileGlobal = new UserProfile();
var stars = [];
Image? profileImage = null;

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePageTandP(userIdGlobal),
    );
  }
}

class HomePageTandP extends StatefulWidget {
  HomePageTandP(String userId) {
    userIdGlobal = userId;
  }

  @override
  _HomePageTandPState createState() => _HomePageTandPState();
}

class _HomePageTandPState extends State<HomePageTandP> {
  late FirebaseMessaging messaging;

  // Set up for Notification with FCM
  @override
  initState() {
    super.initState();
    if (userIdGlobal != null && userIdGlobal != '') getUserProfile();
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

  getUserProfile() async {
    await getUserProfileById(userIdGlobal).then((value) {
      // SetState make it auto update information after it load done
      setState(() {
        userProfileGlobal = value;
        // Convert base64 to image
        profileImage = WidgetUtils.getImageFromUserProfile(userProfileGlobal);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(height * 0.41 / 5),
          child: AppBar(
              backgroundColor: Color(WidgetUtils.valueColorAppBar),
              title: Container(
                child: Text(
                  'Xin chào !!! \n' +
                      (userProfileGlobal.fullName != null
                          ? userProfileGlobal.fullName as String
                          : 'Bạn chưa đăng nhập'),
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: CommonUtils.getUnitPx() * 14,
                    fontFamily: "Roboto",
                    fontStyle: FontStyle.normal,
                  ),
                ),
              ),
              leading: CircleAvatar(
                radius: height * 0.19 / 5,
                backgroundColor: Color(0xFFe1f5f2),
                child: CircleAvatar(
                  radius: height * 0.18 / 5,
                  backgroundImage: profileImage != null
                      ? profileImage!.image
                      : NetworkImage(
                          'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg'),
                ),
              ),
              actions: <Widget>[
                Container(
                  width: width * 0.45 / 5,
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
                                    builder: (context) => ManageChat()));
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
                                    fontSize: CommonUtils.getUnitPx() * 8,
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
                  width: width * 0.45 / 5,
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
                                    builder: (context) =>
                                        ShowAllNotification()));
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
                                    fontSize: CommonUtils.getUnitPx() * 8,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            )
                          : new Container()
                    ],
                  ),
                ),
              ])),
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
                  height: height * 0.8 / 5,
                  margin: EdgeInsets.only(
                    left: width * 0.1 / 2,
                    top: height * 0.05 / 5,
                  ),
                  decoration: BoxDecoration(
                    color: Color(0xFFe4f2f0),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(8),
                      bottomLeft: Radius.circular(8),
                      bottomRight: Radius.circular(25),
                    ),
                  ),
                  child: Column(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(
                          top: height * 0.05 / 5,
                        ),
                        height: height * 0.2 / 2,
                        width: width * 0.5 / 2,
                        child: TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        ManageClassTandPPage(userIdGlobal)));
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
                              fontSize: CommonUtils.getUnitPx() * 16,
                              color: Colors.cyanAccent[250],
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.w400,
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
                    color: Color(0xFFe4f2f0),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(8),
                      bottomLeft: Radius.circular(8),
                      bottomRight: Radius.circular(25),
                    ),
                  ),
                  child: Column(
                    children: <Widget>[
                      Container(
                        height: height * 0.2 / 2,
                        width: width * 0.5 / 2,
                        margin: EdgeInsets.only(
                          top: height * 0.01 / 5,
                        ),
                        child: TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        DevelopingFeatureScreenTandPPage()));
                          },
                          child: new Image.asset('asset/image/forum.png'),
                        ),
                      ),
                      Container(
                        width: width * 0.35 / 2,
                        margin: EdgeInsets.only(
                          top: height * 0.06 / 5,
                        ),
                        child: Align(
                          child: Text(
                            'Diễn đàn',
                            style: TextStyle(
                              fontSize: CommonUtils.getUnitPx() * 16,
                              color: Colors.cyanAccent[250],
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.w400,
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
                    color: Color(0xFFe4f2f0),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(8),
                      bottomLeft: Radius.circular(8),
                      bottomRight: Radius.circular(25),
                    ),
                  ),
                  child: Column(
                    children: <Widget>[
                      Container(
                        height: height * 0.22 / 2,
                        width: width * 0.5 / 2,
                        child: TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        DevelopingFeatureScreenTandPPage()));
                          },
                          child: new Image.asset('asset/image/payment.png'),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                          top: height * 0.01 / 5,
                        ),
                        width: width * 0.4 / 2,
                        child: Align(
                          child: Text(
                            'Thanh toán',
                            style: TextStyle(
                              fontSize: CommonUtils.getUnitPx() * 16,
                              color: Colors.cyanAccent[250],
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.w400,
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
                  width: CommonUtils.getUnitPx() * 5,
                  color: Color(0xFFdae0de),
                ),
              ),
            ),
            child: Row(
              children: <Widget>[
                Container(
                  width: width * 1.2 / 2,
                  margin: EdgeInsets.only(
                    left: width * 0.1 / 2,
                  ),
                  child: Text(
                    'Danh sách khóa học đang mở',
                    style: TextStyle(
                      fontSize: CommonUtils.getUnitPx() * 16,
                    ),
                  ),
                ),
                Container(
                  width: width * 0.7 / 2,
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  ShowAllOfferOpenningCourseTandPPage()));
                    },
                    child: Text(
                      'Xem tất cả >>>',
                      style: TextStyle(
                          fontSize: CommonUtils.getUnitPx() * 16,
                          fontWeight: FontWeight.w400,
                          color: Colors.cyan.shade800),
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
            height: height * 2.01 / 5,
            child: new JobsListViewOffer(this),
          ),
          WidgetUtils.mainButton(context, 0, CommonUtils.currentUserType)
        ],
      ),
    );
  }
}

class JobsListViewOffer extends StatelessWidget {
  _HomePageTandPState parentClass = new _HomePageTandPState();

  JobsListViewOffer(_HomePageTandPState parentClass) {
    this.parentClass = parentClass;
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
              data[index].id,
              data[index].memberClassList,
              data[index].courseStatus,
              context);
        });
  }

  Widget _jobsShowOffer(
      String subject,
      String salary,
      String formatLearning,
      String level,
      UserProfile profileAuthor,
      String courseId,
      List<UserProfile> listMemClass,
      List<CourseStatus> courseStatusList,
      BuildContext context) {
    // Get image from profileAuthor
    Image? profileImageInternal =
        WidgetUtils.getImageFromUserProfile(profileAuthor);

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
                color: Color(0xFF6dbfbe),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(17),
                  topRight: Radius.circular(17),
                  bottomRight: Radius.circular(25),
                ),
              ),
              child: Align(
                child: Text(
                  'Môn học - ' + CommonUtils.catchCaseStringNull(subject),
                  style: TextStyle(
                      fontSize: CommonUtils.getUnitPx() * 18,
                      color: Colors.white),
                ),
              )),
          Container(
            child: Row(
              children: <Widget>[
                Container(
                  height: height * 0.7 / 5,
                  width: width * 0.9 / 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(
                          left: width * 0.02 / 2,
                        ),
                        child: RichText(
                          text: TextSpan(children: <TextSpan>[
                            TextSpan(
                              text: "Cấp học: ",
                              style: TextStyle(
                                  fontSize: CommonUtils.getUnitPx() * 15,
                                  fontStyle: FontStyle.italic,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400),
                            ),
                            TextSpan(
                                text: CommonUtils.catchCaseStringNull(level),
                                style: TextStyle(
                                  fontSize: CommonUtils.getUnitPx() * 14,
                                  fontStyle: FontStyle.normal,
                                  color: Colors.black,
                                ))
                          ]),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                          top: height * 0.05 / 5,
                          left: width * 0.02 / 2,
                        ),
                        child: RichText(
                          text: TextSpan(children: <TextSpan>[
                            TextSpan(
                              text: "Hình thức học: ",
                              style: TextStyle(
                                  fontSize: CommonUtils.getUnitPx() * 15,
                                  fontStyle: FontStyle.italic,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400),
                            ),
                            TextSpan(
                                text: CommonUtils.catchCaseStringNull(
                                    formatLearning),
                                style: TextStyle(
                                  fontSize: CommonUtils.getUnitPx() * 14,
                                  fontStyle: FontStyle.normal,
                                  color: Colors.black,
                                ))
                          ]),
                        ),
                      ),
                      Container(
                          margin: EdgeInsets.only(
                            top: height * 0.05 / 5,
                            left: width * 0.02 / 2,
                          ),
                          child: RichText(
                            text: TextSpan(children: <TextSpan>[
                              TextSpan(
                                text: "Mức lương: ",
                                style: TextStyle(
                                    fontSize: CommonUtils.getUnitPx() * 15,
                                    fontStyle: FontStyle.italic,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400),
                              ),
                              TextSpan(
                                  text: CommonUtils.catchCaseStringNull(salary),
                                  style: TextStyle(
                                    fontSize: CommonUtils.getUnitPx() * 14,
                                    fontStyle: FontStyle.normal,
                                    color: Colors.black,
                                  ))
                            ]),
                          )),
                    ],
                  ),
                ),
                Container(
                    width: width * 0.5 / 2,
                    height: height / 5,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        Container(
                          height: height * 0.65 / 5,
                          width: width * 0.35 / 2,
                          margin: EdgeInsets.only(
                            top: height * 0.02 / 5,
                            right: width * 0.02 / 2,
                          ),
                          decoration: BoxDecoration(
                              color: Color(0xFFe4f2f0),
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(17),
                                topRight: Radius.circular(17),
                                bottomLeft: Radius.circular(17),
                                bottomRight: Radius.circular(17),
                              ),
                              border: Border.all(
                                color: Color(0xFFe1f5f2),
                                width: 2,
                              ),
                              image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: profileImageInternal != null
                                      ? profileImageInternal.image
                                      : NetworkImage(
                                          'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg'))),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                            top: height * 0.02 / 5,
                            left: width * 0.02 / 2,
                          ),
                          child: Text(
                            CommonUtils.catchCaseStringNull(
                                    profileAuthor.fullName) +
                                ' ',
                            style: TextStyle(
                              fontSize: CommonUtils.getUnitPx() * 14,
                              fontFamily: "Roboto",
                              fontStyle: FontStyle.normal,
                            ),
                          ),
                        ),
                        WidgetUtils.showRatingStarsMinor(
                            profileAuthor.rate, stars),
                      ],
                    )),
              ],
            ),
          ),
          Container(
            height: height * 0.3 / 5,
            child: TextButton(
              onPressed: () {
                // Get list user who registered this course
                List<UserProfile> listUserRegisterCourse =
                    getListUserRegisterCourse(courseStatusList);
                if (checkCourseBelongUser(profileAuthor, userIdGlobal) ||
                    checkUserRegisterCourse(listMemClass, userIdGlobal) ||
                    checkUserRegisterCourse(
                        listUserRegisterCourse, userIdGlobal)) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              ManageDetailOpeningClassTandPPage(
                                  courseId,
                                  checkCourseBelongUser(
                                      profileAuthor, userIdGlobal),
                                  '')));
                } else {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              DetailInformationOpeningAndNotOfferClassTandPPage(
                                  checkCourseBelongUser(
                                      profileAuthor, userIdGlobal),
                                  FromScreen.fromScreenHomePage,
                                  courseId)));
                }
              },
              child: Text(
                'Chi tiết >>>',
                style: TextStyle(
                  fontSize: CommonUtils.getUnitPx() * 16,
                  color: Colors.black,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Offer>>(
        future: _fetchOffers(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<Offer>? data = snapshot.data;
            return _jobsListView(data);
          } else
            return _jobsListView(mockOffers());
        });
  }
}

List<UserProfile> getListUserRegisterCourse(
    List<CourseStatus> courseStatusList) {
  List<UserProfile> listUser = <UserProfile>[];
  if (courseStatusList != null && courseStatusList.length > 0) {
    for (CourseStatus courseStatus in courseStatusList) {
      if (courseStatus.userProfile != null) {
        listUser.add(courseStatus.userProfile ?? new UserProfile());
      }
    }
  }
  return listUser;
}

Future<List<Offer>> _fetchOffers() async {
  APIOfferClient apiOfferClient =
      APIOfferClient(Dio(BaseOptions(contentType: "application/json")));
  ResponseEntity responseEntity =
      await apiOfferClient.getOffersByOfferType(OfferType.TEACHER);
  var offers = <Offer>[];
  if (responseEntity.getStatus == HttpStatus.ok) {
    List listDecoded = responseEntity.data;
    List<Offer> offers =
        listDecoded.map((offer) => new Offer.fromJson(offer)).toList();
    print('length list offer: ' + offers.length.toString());
    return offers;
  } else {
    print('Error: ' + responseEntity.getException.toString());
  }
  return offers;
}

Future<UserProfile> getUserProfileById(String userId) async {
  UserProfile userProfile = new UserProfile();
  APIAcountClient apiAcountClient =
      APIAcountClient(Dio(BaseOptions(contentType: "application/json")));
  ResponseEntity responseEntity =
      await apiAcountClient.getUserProfileById(userId);
  if (responseEntity.getStatus == HttpStatus.ok) {
    UserProfile response = UserProfile.fromJson(responseEntity.data);
    print('Id: ' + response.id.toString());

    // Save current userType to global variable
    CommonUtils.currentUserType = response.userType!;

    return response;
  } else {
    print('Error: ' + responseEntity.getException.toString());
  }
  return userProfile;
}

bool checkCourseBelongUser(UserProfile authorProfile, String userId) {
  if (userId == null || authorProfile == null) return false;
  if (userId == authorProfile.id) return true;
  return false;
}

bool checkUserRegisterCourse(List<UserProfile> listMemClass, String userId) {
  if (listMemClass == null || listMemClass.length == 0 || userId == null)
    return false;
  for (UserProfile userProfile in listMemClass) {
    if (userId == userProfile.id) return true;
  }
  return false;
}

List<Offer> mockOffers() {
  List<Offer>? mockOffers = <Offer>[];
  Offer offer = new Offer();
  mockOffers.add(offer);

  return mockOffers;
}
