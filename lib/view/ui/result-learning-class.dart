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
        title: Container(
          margin: EdgeInsets.only(
            left: width * 0.2 / 2,
          ),
          child: Text(
            'Mon Toan',
            style: TextStyle(
              fontSize: 22,
              color: Colors.black,
            ),
          ),
        ),
      ),
      body: Column(
        children: <Widget>[
          Container(
            height: height * 4 / 5,
            child: ListView(
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
                      'Ket qua kiem tra',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                      ),
                    )),
                Container(
                  child: Row(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(
                          left: width * 0.3 / 2,
                          right: width * 0.1 / 2,
                        ),
                        child: Column(
                          children: <Widget>[
                            Container(
                              width: width * 0.4 / 2,
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
                          left: width * 0.15 / 2,
                          right: width * 0.1 / 2,
                        ),
                        child: Column(
                          children: <Widget>[
                            Container(
                              width: width * 0.4 / 2,
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
                        margin: EdgeInsets.only(bottom: height * 0.07 / 5),
                        width: width * 0.2 / 2,
                        child: new Image.asset('asset/image/next.png'),
                      ),
                    ],
                  ),
                ),
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
                      'Nhan xet hoc sinh',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                      ),
                    )),
                Container(
                    height: height * 0.4 / 5,
                    width: width * 1 / 2,
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
                    child: Container(
                      child: Row(
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(
                              left: width*0.2/2,
                            ),
                            child: Text(
                              'Nguyen Van A',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(
                              bottom: height * 0.07 / 5,
                              left: width*0.5/2,
                            ),
                            // height: height * 0.2 / 5,
                            width: width * 0.2 / 2,
                            child: IconButton(
                              onPressed: (){},
                              icon: new Image.asset('asset/image/adjust.png'),
                            )
                          ),
                        ],
                      ),
                    )),
                Container(
                  height: height * 0.4 / 5,
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
                  child: Container(
                    child: Row(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(
                            left: width*0.2/2,
                          ),
                          child: Text(
                            'Nguyen Van B',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                            ),
                          ),
                        ),
                        Container(
                            margin: EdgeInsets.only(
                              bottom: height * 0.07 / 5,
                              left: width*0.5/2,
                            ),
                            // height: height * 0.2 / 5,
                            width: width * 0.2 / 2,
                            child: IconButton(
                              onPressed: (){},
                              icon: new Image.asset('asset/image/adjust.png'),
                            )
                        ),
                      ],
                    ),
                  )
                ),
              ],
            ),
          ),
          Container(
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
          )
        ],
      ),
    );
  }
}
