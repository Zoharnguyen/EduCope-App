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
      ),
      body: Column(
        children: <Widget>[
          Container(
            height: height * 3.7 / 5,
            child: ListView(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(
                    top: height * 0.3 / 5,
                    left: width * 0.3 / 2,
                  ),
                  child: Row(
                    children: <Widget>[
                      Container(
                        width: width * 0.2 / 2,
                        margin: EdgeInsets.only(
                          right: width * 0.1 / 2,
                        ),
                        child: new Image.asset('asset/image/file.png'),
                      ),
                      Container(
                        width: width * 0.4 / 2,
                        child: Align(
                          child: Text(
                            'File_1.txt',
                            style: TextStyle(
                              color: Colors.green,
                              fontSize: 18,
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
                    top: height * 0.1 / 5,
                    left: width * 0.3 / 2,
                  ),
                  child: Row(
                    children: <Widget>[
                      Container(
                        width: width * 0.2 / 2,
                        margin: EdgeInsets.only(
                          right: width * 0.1 / 2,
                        ),
                        child: new Image.asset('asset/image/file.png'),
                      ),
                      Container(
                        width: width * 0.4 / 2,
                        child: Align(
                          child: Text(
                            'File_2.txt',
                            style: TextStyle(
                              color: Colors.green,
                              fontSize: 18,
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
                    top: height * 0.1 / 5,
                    left: width * 0.3 / 2,
                  ),
                  child: Row(
                    children: <Widget>[
                      Container(
                        width: width * 0.2 / 2,
                        margin: EdgeInsets.only(
                          right: width * 0.1 / 2,
                        ),
                        child: new Image.asset('asset/image/file.png'),
                      ),
                      Container(
                        width: width * 0.4 / 2,
                        child: Align(
                          child: Text(
                            'File_3.txt',
                            style: TextStyle(
                              color: Colors.green,
                              fontSize: 18,
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
                    top: height * 0.1 / 5,
                    left: width * 0.3 / 2,
                  ),
                  child: Row(
                    children: <Widget>[
                      Container(
                        width: width * 0.2 / 2,
                        margin: EdgeInsets.only(
                          right: width * 0.1 / 2,
                        ),
                        child: new Image.asset('asset/image/file.png'),
                      ),
                      Container(
                        width: width * 0.4 / 2,
                        child: Align(
                          child: Text(
                            'File_4.txt',
                            style: TextStyle(
                              color: Colors.green,
                              fontSize: 18,
                              fontFamily: "Roboto",
                              fontStyle: FontStyle.normal,
                            ),
                          ),
                          alignment: Alignment.center,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              left: width * 1.2 / 2,
            ),
            height: height * 0.4 / 5,
            child: new Image.asset('asset/image/add.png'),
          ),
        ],
      ),
    );
  }
}
