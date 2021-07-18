import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

double width = 411.4285;
double height = 683.4285;

String courseId = '60e394825ded485c37a643f1';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // title: 'Edu Cope',
      // theme: ThemeData(
      //   primarySwatch: Colors.blue,
      // ),
      home: DevelopingFeatureScreen(),
    );
  }
}

class DevelopingFeatureScreen extends StatefulWidget {
  DevelopingFeatureScreen();

  @override
  _DevelopingFeatureScreenState createState() =>
      _DevelopingFeatureScreenState();
}

class _DevelopingFeatureScreenState extends State<DevelopingFeatureScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Container(
            margin: EdgeInsets.only(
              right: width * 0.3 / 2,
            ),
            child: Align(
              child: Text(
                'Tính năng đang phát triển',
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
        body: Container(
            alignment: Alignment.center,
            child: Text(
              'Tính năng đang được phát triển.',
              style: TextStyle(color: Colors.blue, fontSize: 18),
            )));
  }
}
