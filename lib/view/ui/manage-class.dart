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
      body: Column(
        children: <Widget>[
          Container(
            height: height * 4.4 / 5,
            child: DefaultTabController(
              length: 3,
              child: Scaffold(
                  appBar: PreferredSize(
                    preferredSize: Size(width * 0.9, height * 0.6 / 5),
                    child: AppBar(
                      leading: Container(
                        margin: EdgeInsets.only(
                          top: height*0.2/5,
                          left: width*0.05/2,
                        ),
                        child: Text('Back',
                        style: TextStyle(
                          fontSize: 16,
                        ),),
                      ),
                      centerTitle: true,
                      title: Text(
                        'Manage Class',
                        style: TextStyle(
                          fontSize: 24,
                        ),
                      ),
                      bottom: TabBar(
                        tabs: <Widget>[
                          Text(
                            'Learning',
                            style: TextStyle(fontSize: 20),
                          ),
                          Text(
                            'Offering',
                            style: TextStyle(fontSize: 20),
                          ),
                          Text(
                            'End',
                            style: TextStyle(fontSize: 20),
                          ),
                        ],
                      ),
                    ),
                  ),
                  body: TabBarView(children: <Widget>[
                    Container(
                      height: height * 2 / 5,
                      width: width * 1.5 / 2,
                      child: ListView(
                        children: <Widget>[
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
                    Text("Test 1"),
                    Text("Test 2"),
                  ])),
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
