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
      appBar: AppBar(
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
      ),
      body: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(
              top: height * 0.4 / 5,
              bottom: height*0.2/5,
            ),
            height: height * 0.3 / 5,
            // decoration: BoxDecoration(
            //   border: Border.all(
            //     color: Colors.green,
            //     width: 2,
            //   )
            // ),
            child: Text(
              'Mon Toan',
              style: TextStyle(
                fontSize: 22,
                color: Colors.black,
              ),
            ),
          ),
          Container(
            height: height*0.2/5,
            width: width/2,
            margin: EdgeInsets.only(
              top: height*0.2/5,
            ),
            decoration: BoxDecoration(
                color: Colors.grey[300],
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
                "Thong tin lop hoc",
                style: TextStyle(
                    fontSize: 13,
                    color: Colors.black,
                    fontFamily: "Roboto",
                    fontStyle: FontStyle.normal
                ),
              ),
            ),
          ),
          Container(
            height: height*0.2/5,
            width: width/2,
            margin: EdgeInsets.only(
              top: height*0.2/5,
            ),
            decoration: BoxDecoration(
                color: Colors.grey[300],
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
                "Ket qua hoc tap",
                style: TextStyle(
                    fontSize: 13,
                    color: Colors.black,
                    fontFamily: "Roboto",
                    fontStyle: FontStyle.normal
                ),
              ),
            ),
          ),
          Container(
            height: height*0.2/5,
            width: width/2,
            margin: EdgeInsets.only(
              top: height*0.2/5,
            ),
            decoration: BoxDecoration(
                color: Colors.grey[300],
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
                "Thay doi hop dong",
                style: TextStyle(
                    fontSize: 13,
                    color: Colors.black,
                    fontFamily: "Roboto",
                    fontStyle: FontStyle.normal
                ),
              ),
            ),
          ),
          Container(
            height: height*0.2/5,
            width: width/2,
            margin: EdgeInsets.only(
              top: height*0.2/5,
            ),
            decoration: BoxDecoration(
                color: Colors.grey[300],
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
                "Ket thuc khoa hoc",
                style: TextStyle(
                    fontSize: 13,
                    color: Colors.black,
                    fontFamily: "Roboto",
                    fontStyle: FontStyle.normal
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              top: height * 1.49 / 5,
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
