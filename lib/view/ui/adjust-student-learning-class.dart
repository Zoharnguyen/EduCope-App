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
            child: Text(
              'Nguyen Van A',
              style: TextStyle(
                fontSize: 24,
                fontFamily: "Roboto",
                fontStyle: FontStyle.normal,
              ),
            ),
          ),
          Container(
            height: height * 3.6 / 5,
            child: ListView(
              children: <Widget>[
                Container(
                  height: height *1.2 / 5,
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
                          'Ngay: 01/01/2021',
                          style: TextStyle(
                            fontSize: 24,
                            fontFamily: "Roboto",
                            fontStyle: FontStyle.normal,
                          ),
                        ),
                      ),
                      Container(
                        child: Text(
                          'Noi Dung: Ket qua cua hoc sinh da tien bo rat nhieu so voi 1 thang truoc, the hien ro o ket qua kiem tra lan nay.',
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
                  height: height *1.2 / 5,
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
                          'Ngay: 01/01/2021',
                          style: TextStyle(
                            fontSize: 24,
                            fontFamily: "Roboto",
                            fontStyle: FontStyle.normal,
                          ),
                        ),
                      ),
                      Container(
                        child: Text(
                          'Noi Dung: Ket qua cua hoc sinh da tien bo rat nhieu so voi 1 thang truoc, the hien ro o ket qua kiem tra lan nay.',
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
                  height: height *1.2 / 5,
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
                          'Ngay: 01/01/2021',
                          style: TextStyle(
                            fontSize: 24,
                            fontFamily: "Roboto",
                            fontStyle: FontStyle.normal,
                          ),
                        ),
                      ),
                      Container(
                        child: Text(
                          'Noi Dung: Ket qua cua hoc sinh da tien bo rat nhieu so voi 1 thang truoc, the hien ro o ket qua kiem tra lan nay.',
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
