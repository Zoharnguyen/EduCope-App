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
      // appBar: AppBar(
      //   title: Text(widget.title),
      // ),
      body: Column(
        children: <Widget>[
          Container(
            height: height * 0.4 / 5,
            decoration: BoxDecoration(
                // border: Border.all(
                //   color: Colors.green,
                //   width: 2,
                // )
                ),
            margin: EdgeInsets.only(top: height * 0.3 / 5),
            child: Row(
              children: <Widget>[
                Container(
                  width: width * 0.4 / 2,
                  // decoration: BoxDecoration(
                  //   border: Border.all(
                  //     color: Colors.green,
                  //     width: 2,
                  //   )
                  // ),
                  child: FlatButton(
                    onPressed: () {},
                    child: new Image.asset('asset/image/blank-account.jpg'),
                  ),
                ),
                Container(
                  child: Text(
                    'Hello \nYou aren\'t sign in',
                    style: TextStyle(
                      color: Colors.blue[200],
                      fontSize: 14,
                      fontFamily: "Roboto",
                      fontStyle: FontStyle.normal,
                    ),
                  ),
                ),
                Container(
                  width: width * 0.3 / 5,
                  margin: EdgeInsets.only(
                    left: width * 0.7 / 2,
                  ),
                  child: new Image.asset('asset/image/message.png'),
                ),
                Container(
                  width: width * 0.3 / 5,
                  margin: EdgeInsets.only(
                    left: width * 0.04 / 2,
                  ),
                  child: new Image.asset('asset/image/notification.png'),
                ),
              ],
            ),
          ),
          Container(
            height: height * 1 / 5,
            // decoration: BoxDecoration(
            //     border: Border.all(
            //   color: Colors.green,
            //   width: 2,
            // )),
            margin: EdgeInsets.only(
              top: height * 0.7 / 5,
            ),
            child: Row(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(
                    left: width * 0.1 / 2,
                    top: height * 0.05 / 5,
                  ),
                  child: Column(
                    children: <Widget>[
                      Container(
                        width: width * 0.5 / 2,
                        child: FlatButton(
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
                            'Class',
                            style: TextStyle(
                              color: Colors.purple[200],
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
                    left: width * 0.15 / 2,
                  ),
                  child: Column(
                    children: <Widget>[
                      Container(
                        width: width * 0.4 / 2,
                        child: new Image.asset('asset/image/map.png'),
                      ),
                      Container(
                        width: width * 0.35 / 2,
                        child: Align(
                          child: Text(
                            'Map',
                            style: TextStyle(
                              color: Colors.purple[200],
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
                    left: width * 0.15 / 2,
                  ),
                  child: Column(
                    children: <Widget>[
                      Container(
                        width: width * 0.4 / 2,
                        child: new Image.asset('asset/image/payment.png'),
                      ),
                      Container(
                        width: width * 0.4 / 2,
                        child: Align(
                          child: Text(
                            'Payment',
                            style: TextStyle(
                              color: Colors.purple[200],
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
              ],
            ),
          ),
          Container(
            child: Row(children: <Widget>[
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
                margin: EdgeInsets.only(
                  top: height * 0.3 / 5,
                ),
                width: width * 0.2 / 2,
                child: new Image.asset('asset/image/next.png'),
              ),
            ]),
          ),
          Container(
            margin: EdgeInsets.only(
              top: height * 0.85 / 5,
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
