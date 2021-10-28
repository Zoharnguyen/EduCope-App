import 'dart:io';

import 'package:dio/dio.dart';
import 'package:edu_cope/constant/move-to-screen.dart';
import 'package:edu_cope/dto/notification-element.dart';
import 'package:edu_cope/dto/response-entity.dart';
import 'package:edu_cope/service/api-notification.dart';
import 'package:edu_cope/view/ui/common/widget-utils.dart';
import 'package:edu_cope/view/ui/manage-course/manage-detail-openning-class-T-and-P.dart';
import 'package:edu_cope/view/ui/manage-course/manage-register-course-opening-class-T.dart';
import 'package:edu_cope/view/utils/common-utils.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

double width = CommonUtils.width;
double height = CommonUtils.height;
String userId = CommonUtils.currentUserId;

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ShowAllNotification(),
    );
  }
}

class ShowAllNotification extends StatefulWidget {
  ShowAllNotification();

  @override
  _ShowAllNotificationState createState() => _ShowAllNotificationState();
}

class _ShowAllNotificationState extends State<ShowAllNotification> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(WidgetUtils.valueColorAppBar),
        title: Container(
          margin: EdgeInsets.only(
            right: width * 0.2 / 2,
          ),
          child: Align(
            child: Text(
              'Thông báo',
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
      body: Container(
        margin: EdgeInsets.only(
          top: height * 0.05 / 5,
        ),
        height: height * 4.25 / 5,
        child: showNotifications(),
      ),
    );
  }
}

class showNotifications extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<NotificationElement>>(
        future: _fetchNotifications(userId),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<NotificationElement>? data = snapshot.data;
            return _notificationListView(data);
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }
          return Text("${snapshot.error}");
        });
  }
}

ListView _notificationListView(data) {
  return ListView.builder(
      scrollDirection: Axis.vertical,
      itemCount: data.length,
      itemBuilder: (context, index) {
        return _notificationShow(data[index], context);
      });
}

Widget _notificationShow(
    NotificationElement notificationElement, BuildContext context) {
  return Container(
    height: height * 0.65 / 5,
    width: width * 1.4 / 2,
    margin: EdgeInsets.only(
      top: height * 0.05 / 5,
      right: width * 0.1 / 2,
      left: width * 0.1 / 2,
    ),
    decoration: BoxDecoration(
      color: Colors.grey[100],
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(8),
        topRight: Radius.circular(8),
        bottomLeft: Radius.circular(8),
        bottomRight: Radius.circular(8),
      ),
    ),
    child: TextButton(
      onPressed: () {
        moveToScreenWithNotification(notificationElement.screenName,
            notificationElement.screenVariables, context);
      },
      child: Row(
        children: <Widget>[
          Container(
              margin: EdgeInsets.only(
                right: width * 0.05 / 2,
              ),
              height: height * 0.3 / 5,
              child: CircleAvatar(
                radius: height * 0.19 / 5,
                backgroundColor: Color(0xFFe1f5f2),
                child: CircleAvatar(
                  radius: height * 0.18 / 5,
                  backgroundImage:
                      AssetImage('asset/image/profile-image-1.jpeg'),
                ),
              )),
          Container(
            margin: EdgeInsets.only(
              top: height * 0.05 / 5,
            ),
            width: width * 1.33 / 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  child: RichText(
                    text: TextSpan(children: <TextSpan>[
                      TextSpan(
                        text: CommonUtils.catchCaseStringNull(
                                notificationElement.sender) +
                            ' ',
                        style: TextStyle(
                          fontSize: CommonUtils.getUnitPx() * 18,
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Open Sans',
                        ),
                      ),
                      TextSpan(
                          text: CommonUtils.catchCaseStringNull(
                              notificationElement.content),
                          style: TextStyle(
                            fontSize: CommonUtils.getUnitPx() * 18,
                            color: Colors.black54,
                          ))
                    ]),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                    top: height * 0.02 / 5,
                  ),
                  child: Text(
                    CommonUtils.catchCaseStringNull(
                        notificationElement.timeCreated),
                    style: TextStyle(
                        fontSize: CommonUtils.getUnitPx() * 14,
                        color: Colors.black54),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    ),
  );
}

Future<List<NotificationElement>> _fetchNotifications(String userId) async {
  List<NotificationElement> notifications = <NotificationElement>[];
  APINotificationClient apiNotificationClient =
      APINotificationClient(Dio(BaseOptions(contentType: "application/json")));
  ResponseEntity responseEntity =
      await apiNotificationClient.getNotificationsByUserId(userId);
  if (responseEntity.getStatus == HttpStatus.ok) {
    List listDecoded = responseEntity.data;
    NotificationElement response =
        NotificationElement.fromJson(responseEntity.data[0]);
    print('Id: ' + response.notificationId.toString());
    return listDecoded
        .map((notification) => new NotificationElement.fromJson(notification))
        .toList();
  } else {
    print('Error: ' + responseEntity.getException.toString());
  }
  return notifications;
}

void moveToScreenWithNotification(
    String? screenName, List<String>? screenVariables, BuildContext context) {
  if (screenName != null) {
    if (MoveToScreen.moveToManageOpenCourseAndDecideRegisterCourse ==
        screenName) {
      String courseId = '';
      if (screenVariables != null && !screenVariables.isEmpty) {
        courseId = screenVariables.first;
      }
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ManageRegisterCourseOpeningClassTPage(
                  courseId, true)));
    } else if (MoveToScreen.moveToManageOpeningCourse == screenName) {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ManageDetailOpeningClassTandPPage(
                  screenVariables!.first, false, '')));
    }
  }
}
