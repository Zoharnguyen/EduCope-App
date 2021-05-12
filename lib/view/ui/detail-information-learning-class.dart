import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(title: 'Edu Cope'),
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _subjectName;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        leading: Container(
          margin: EdgeInsets.only(
            top: height * 0.2 / 5,
            left: width * 0.05 / 2,
          ),
          child: Text(
            'Back',
            style: TextStyle(
              fontSize: 16,
            ),
          ),
        ),
        title: Container(
          margin: EdgeInsets.only(
            left: width * 0.2 / 2,
          ),
          child: Text(
            'Thong tin lop hoc',
            style: TextStyle(
              fontSize: 22,
              color: Colors.black,
            ),
          ),
        ),
      ),
      body: ListView(
        children: <Widget>[
          Container(
              height: height * 0.35 / 5,
              // width: width * 0.3 / 2,
              margin: EdgeInsets.only(
                top: height * 0.1 / 5,
                left: width * 0.15 / 2,
              ),
              // decoration: BoxDecoration(
              //     border: Border.all(
              //       color: Colors.green,
              //       width: 2,
              //     )
              // ),
              child: Text(
                'Mon hoc',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                ),
              )),
          Container(
              margin: EdgeInsets.only(
                right: width * 0.2 / 2,
                left: width * 0.3 / 2,
              ),
              child: Text(
                'Toan',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                ),
              )),
          Container(
              height: height * 0.35 / 5,
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
                'Lich hoc',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                ),
              )),
          Container(
              margin: EdgeInsets.only(
                right: width * 0.2 / 2,
                left: width * 0.3 / 2,
              ),
              child: Text(
                'Thu 2: 20h - 22h',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                ),
              )),
          Container(
              height: height * 0.35 / 5,
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
                'Hinh thuc hoc',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                ),
              )),
          Container(
              margin: EdgeInsets.only(
                right: width * 0.2 / 2,
                left: width * 0.3 / 2,
              ),
              child: Text(
                'Tai nha hoc sinh',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                ),
              )),
          Container(
              height: height * 0.35 / 5,
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
                'Hoc phi',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                ),
              )),
          Container(
              margin: EdgeInsets.only(
                right: width * 0.2 / 2,
                left: width * 0.3 / 2,
              ),
              child: Text(
                '500k/Buoi',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                ),
              )),
        ],
      ),
    );
  }
}
