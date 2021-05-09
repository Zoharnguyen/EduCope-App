import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // title: 'Edu Cope',
      // theme: ThemeData(
      //   primarySwatch: Colors.blue,
      // ),
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
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(
              top: height*0.12/5
            ),
            height: height/5,
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
                  width: width*1.4/2,
                  padding: EdgeInsets.only(
                    left: width*0.2/2,
                    right: width*0.2/2,
                  ),
                  child: TextField(
                    autofocus: false,
                    cursorWidth: 2,
                    cursorHeight: 25,
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
                  height: height*0.2/5,
                  width: width*1.5/7,
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
                          color: Colors.grey[400],
                          offset: Offset(0,4),
                        ),
                      ]
                  ),
                  child: FlatButton(
                    onPressed: () async {
                    },
                    child: Text(
                      "Tìm kiếm",
                      style: TextStyle(
                          fontSize: 13,
                          color: Colors.white,
                          fontFamily: "Roboto",
                          fontStyle: FontStyle.normal
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: height * 3.2 / 5,
            child: ListView(
              children: <Widget>[
                Container(
                  height: height / 5,
                  width: width * 1.4 / 2,
                  margin: EdgeInsets.only(
                    right: width * 0.1 / 2,
                    left: width * 0.2 / 2,
                  ),
                  decoration: BoxDecoration(
                      color: Colors.lightBlue[50],
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
                          color: Colors.grey[400],
                          offset: Offset(0, 4),
                        ),
                      ]),
                  child: Column(
                    children: <Widget>[
                      Container(
                        child: Text(
                          'Tìm gia sư',
                          style: TextStyle(
                            fontSize: 24,
                            fontFamily: "Roboto",
                            fontStyle: FontStyle.normal,
                          ),
                        ),
                      ),
                      Container(
                        child: Text(
                          'Tìm gia sư',
                          style: TextStyle(
                            fontSize: 24,
                            fontFamily: "Roboto",
                            fontStyle: FontStyle.normal,
                          ),
                        ),
                      ),
                      Container(
                        child: Text(
                          'Tìm gia sư',
                          style: TextStyle(
                            fontSize: 24,
                            fontFamily: "Roboto",
                            fontStyle: FontStyle.normal,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: height / 5,
                  width: width * 1.4 / 2,
                  margin: EdgeInsets.only(
                    top: height * 0.3 / 5,
                    right: width * 0.1 / 2,
                    left: width * 0.2 / 2,
                  ),
                  decoration: BoxDecoration(
                      color: Colors.lightBlue[50],
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
                          color: Colors.grey[400],
                          offset: Offset(0, 4),
                        ),
                      ]),
                  child: Column(
                    children: <Widget>[
                      Container(
                        child: Text(
                          'Tìm gia sư',
                          style: TextStyle(
                            fontSize: 24,
                            fontFamily: "Roboto",
                            fontStyle: FontStyle.normal,
                          ),
                        ),
                      ),
                      Container(
                        child: Text(
                          'Tìm gia sư',
                          style: TextStyle(
                            fontSize: 24,
                            fontFamily: "Roboto",
                            fontStyle: FontStyle.normal,
                          ),
                        ),
                      ),
                      Container(
                        child: Text(
                          'Tìm gia sư',
                          style: TextStyle(
                            fontSize: 24,
                            fontFamily: "Roboto",
                            fontStyle: FontStyle.normal,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: height / 5,
                  width: width * 1.4 / 2,
                  margin: EdgeInsets.only(
                    top: height * 0.3 / 5,
                    right: width * 0.1 / 2,
                    left: width * 0.2 / 2,
                  ),
                  decoration: BoxDecoration(
                      color: Colors.lightBlue[50],
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
                          color: Colors.grey[400],
                          offset: Offset(0, 4),
                        ),
                      ]),
                  child: Column(
                    children: <Widget>[
                      Container(
                        child: Text(
                          'Tìm gia sư',
                          style: TextStyle(
                            fontSize: 24,
                            fontFamily: "Roboto",
                            fontStyle: FontStyle.normal,
                          ),
                        ),
                      ),
                      Container(
                        child: Text(
                          'Tìm gia sư',
                          style: TextStyle(
                            fontSize: 24,
                            fontFamily: "Roboto",
                            fontStyle: FontStyle.normal,
                          ),
                        ),
                      ),
                      Container(
                        child: Text(
                          'Tìm gia sư',
                          style: TextStyle(
                            fontSize: 24,
                            fontFamily: "Roboto",
                            fontStyle: FontStyle.normal,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: height / 5,
                  width: width * 1.4 / 2,
                  margin: EdgeInsets.only(
                    top: height * 0.3 / 5,
                    right: width * 0.1 / 2,
                    left: width * 0.2 / 2,
                  ),
                  decoration: BoxDecoration(
                      color: Colors.lightBlue[50],
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
                          color: Colors.grey[400],
                          offset: Offset(0, 4),
                        ),
                      ]),
                  child: Column(
                    children: <Widget>[
                      Container(
                        child: Text(
                          'Tìm gia sư',
                          style: TextStyle(
                            fontSize: 24,
                            fontFamily: "Roboto",
                            fontStyle: FontStyle.normal,
                          ),
                        ),
                      ),
                      Container(
                        child: Text(
                          'Tìm gia sư',
                          style: TextStyle(
                            fontSize: 24,
                            fontFamily: "Roboto",
                            fontStyle: FontStyle.normal,
                          ),
                        ),
                      ),
                      Container(
                        child: Text(
                          'Tìm gia sư',
                          style: TextStyle(
                            fontSize: 24,
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
            margin: EdgeInsets.only(
              top: height * 0.2 / 5,
            ),
            child: Row(
              children: <Widget>[
                Container(
                  height: height * 0.3 / 5,
                  margin: EdgeInsets.only(
                    left: width * 0.1 / 2,
                  ),
                  child: FlatButton(
                    child: new Image.asset('asset/image/homepage.png'),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                    left: width * 0.335 / 2,
                  ),
                  height: height * 0.4 / 5,
                  child: new Image.asset('asset/image/add.png'),
                ),
                Container(
                  margin: EdgeInsets.only(
                    left: width * 0.4 / 2,
                  ),
                  height: height * 0.4 / 5,
                  child: new Image.asset('asset/image/blank-account.jpg'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
