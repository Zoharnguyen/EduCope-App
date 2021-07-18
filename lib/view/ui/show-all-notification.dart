import 'package:edu_cope/view/ui/detail-information-opening-and-not-offer-class.dart';
import 'package:edu_cope/view/ui/homepage.dart';
import 'package:edu_cope/view/ui/manage-class.dart';
import 'package:edu_cope/view/ui/manage-profile.dart';
import 'package:flutter/material.dart';

import 'create-offer-class.dart';

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
      home: ShowAllNotification(),
    );
  }
}

class ShowAllNotification extends StatefulWidget {
  ShowAllNotification();

  @override
  _ShowAllNotificationState createState() => _ShowAllNotificationState();
}

class showNotifications extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<String>>(
        future: _fetchNotifications(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<String>? data = snapshot.data;
            return _notificationListView(data);
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }
          return Text("${snapshot.error}");
        });
  }
}

Future<List<String>> _fetchNotifications() async {
  List<String> notifications = <String>[];
  notifications.add("Day la thong bao khan cap nhe");
  notifications.add("Day la thong bao khan cap nhe");
  notifications.add("Day la thong bao khan cap nhe");
  notifications.add("Day la thong bao khan cap nhe");
  notifications.add("Day la thong bao khan cap nhe");
  notifications.add("Day la thong bao khan cap nhe");
  notifications.add("Day la thong bao khan cap nhe");
  notifications.add("Day la thong bao khan cap nhe");
  notifications.add("Day la thong bao khan cap nhe");
  return notifications;
}

ListView _notificationListView(data) {
  return ListView.builder(
      scrollDirection: Axis.vertical,
      itemCount: data.length,
      itemBuilder: (context, index) {
        return _notificationShow(data[index], context);
      });
}

Widget _notificationShow(String data, BuildContext context) {
  return Container(
    height: height * 0.5 / 5,
    width: width * 1.4 / 2,
    margin: EdgeInsets.only(
      top: height * 0.03 / 5,
      right: width * 0.1 / 2,
      left: width * 0.2 / 2,
    ),
    decoration: BoxDecoration(
      color: Colors.grey[200],
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(8),
        topRight: Radius.circular(8),
        bottomLeft: Radius.circular(8),
        bottomRight: Radius.circular(8),
      ),
    ),
    child: FlatButton(
      onPressed: () {},
      child: Column(
        children: <Widget>[
          Align(
            child: Text(
              data,
              style: TextStyle(
                fontSize: 16,
                fontFamily: "Roboto",
                fontStyle: FontStyle.normal,
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

class _ShowAllNotificationState extends State<ShowAllNotification> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        title: Container(
          margin: EdgeInsets.only(
            right: width * 0.2 / 2,
          ),
          child: Align(
            child: Text(
              'Thông báo',
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
      body: Column(
        children: <Widget>[
          Container(
            height: height * 3.95 / 5,
            // decoration: BoxDecoration(
            //     border: Border.all(
            //   color: Colors.green,
            //   width: 2,
            // )),
            child: showNotifications(),
          ),
          Container(
            color: Colors.grey[100],
            // margin: EdgeInsets.only(
            //   top: height * 0.05 / 5,
            // ),
            child: Row(
              children: <Widget>[
                Container(
                  height: height * 0.3 / 5,
                  margin: EdgeInsets.only(
                    left: width * 0.1 / 2,
                  ),
                  child: FlatButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => HomePage()));
                    },
                    child: new Image.asset('asset/image/homepage.png'),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                    left: width * 0.26 / 2,
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
                    height: height * 0.45 / 5,
                    child: FlatButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => ManageProfile()));
                      },
                      child: new Image.asset('asset/image/blank-account.jpg'),
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
