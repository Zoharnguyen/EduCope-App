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
    final stars = [
      'asset/image/rating-star.png',
      'asset/image/rating-star.png',
      'asset/image/rating-star.png',
    ];
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(widget.title),
      // ),
      body: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(
              top: height * 0.4 / 5,
              right: width * 0.1 / 2,
            ),
            height: height * 0.3 / 5,
            // decoration: BoxDecoration(
            //   border: Border.all(
            //     color: Colors.green,
            //     width: 2,
            //   )
            // ),
            child: Text(
              'Ho So',
              style: TextStyle(
                fontSize: 22,
                color: Colors.black,
              ),
            ),
          ),
          Container(
            height: height / 5,
            // decoration: BoxDecoration(
            //   border: Border.all(
            //     color: Colors.green,
            //     width: 2,
            //   )
            // ),
            child: Row(
              children: <Widget>[
                Container(
                  width: width / 2,
                  height: height / 5,
                  margin: EdgeInsets.only(
                    left: width * 0.9 / 4,
                  ),
                  // decoration: BoxDecoration(
                  //   border: Border.all(
                  //     color: Colors.green,
                  //     width: 2,
                  //   )
                  // ),
                  child: new Image.asset(
                    'asset/image/blank-account.jpg',
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(
                      top: height * 0.7 / 5,
                    ),
                    child: new ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: stars.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            margin: EdgeInsets.only(
                              left: width*0.01/2,
                            ),
                            width: width * 0.1 / 2,
                            // decoration: BoxDecoration(
                            //     border: Border.all(
                            //   color: Colors.green,
                            //   width: 1,
                            // )),
                            child: new Image.asset(
                              stars[index],
                              fit: BoxFit.fitWidth,
                            ),
                          );
                        }),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: height * 0.2 / 5,
            // decoration: BoxDecoration(
            //     border: Border.all(
            //       color: Colors.green,
            //       width: 2,
            //     )
            // ),
            child: Text(
              'Nguyen Van A',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
              ),
            ),
          ),
          Container(
            height: height * 0.4 / 5,
            width: width * 1.3 / 2,
            // decoration: BoxDecoration(
            //     border: Border.all(
            //       color: Colors.green,
            //       width: 2,
            //     )
            // ),
            child: Text(
              'Toi la sinh vien nam cuoi truong dai hoc ngoai ngu...',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Container(
            height: height * 0.35 / 5,
            margin: EdgeInsets.only(
              top: height * 0.2 / 5,
            ),
            // decoration: BoxDecoration(
            //     border: Border.all(
            //       color: Colors.green,
            //       width: 2,
            //     )
            // ),
            child: Row(
              children: <Widget>[
                Container(
                  width: width * 0.3 / 2,
                  margin: EdgeInsets.only(
                    left: width * 0.15 / 2,
                  ),
                  // decoration: BoxDecoration(
                  //     border: Border.all(
                  //       color: Colors.green,
                  //       width: 2,
                  //     )
                  // ),
                  child: FlatButton(
                    onPressed: () {},
                    child: new Image.asset('asset/image/personal.png'),
                  ),
                ),
                Container(
                  width: width * 1.2 / 2,
                  margin: EdgeInsets.only(
                    left: width * 0.1 / 2,
                  ),
                  // decoration: BoxDecoration(
                  //     border: Border.all(
                  //       color: Colors.green,
                  //       width: 2,
                  //     )
                  // ),
                  child: Text(
                    'Thong tin ca nhan',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: height * 0.35 / 5,
            margin: EdgeInsets.only(
                // top: height * 0.85 / 5,
                ),
            // decoration: BoxDecoration(
            //     border: Border.all(
            //       color: Colors.green,
            //       width: 2,
            //     )
            // ),
            child: Row(
              children: <Widget>[
                Container(
                  width: width * 0.3 / 2,
                  margin: EdgeInsets.only(
                    left: width * 0.15 / 2,
                  ),
                  // decoration: BoxDecoration(
                  //     border: Border.all(
                  //       color: Colors.green,
                  //       width: 2,
                  //     )
                  // ),
                  child: FlatButton(
                    onPressed: () {},
                    child: new Image.asset('asset/image/comment.png'),
                  ),
                ),
                Container(
                  width: width * 1.2 / 2,
                  margin: EdgeInsets.only(
                    left: width * 0.1 / 2,
                  ),
                  // decoration: BoxDecoration(
                  //     border: Border.all(
                  //       color: Colors.green,
                  //       width: 2,
                  //     )
                  // ),
                  child: Text(
                    'Danh gia',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: height * 0.35 / 5,
            margin: EdgeInsets.only(
                // top: height * 0.85 / 5,
                ),
            // decoration: BoxDecoration(
            //     border: Border.all(
            //       color: Colors.green,
            //       width: 2,
            //     )
            // ),
            child: Row(
              children: <Widget>[
                Container(
                  width: width * 0.3 / 2,
                  margin: EdgeInsets.only(
                    left: width * 0.15 / 2,
                  ),
                  // decoration: BoxDecoration(
                  //     border: Border.all(
                  //       color: Colors.green,
                  //       width: 2,
                  //     )
                  // ),
                  child: FlatButton(
                    onPressed: () {},
                    child: new Image.asset('asset/image/setting.png'),
                  ),
                ),
                Container(
                  width: width * 1.2 / 2,
                  margin: EdgeInsets.only(
                    left: width * 0.1 / 2,
                  ),
                  // decoration: BoxDecoration(
                  //     border: Border.all(
                  //       color: Colors.green,
                  //       width: 2,
                  //     )
                  // ),
                  child: Text(
                    'Cai dat tai khoan',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: height * 0.35 / 5,
            margin: EdgeInsets.only(
                // top: height * 0.85 / 5,
                ),
            // decoration: BoxDecoration(
            //     border: Border.all(
            //       color: Colors.green,
            //       width: 2,
            //     )
            // ),
            child: Row(
              children: <Widget>[
                Container(
                  width: width * 0.3 / 2,
                  margin: EdgeInsets.only(
                    left: width * 0.15 / 2,
                  ),
                  // decoration: BoxDecoration(
                  //     border: Border.all(
                  //       color: Colors.green,
                  //       width: 2,
                  //     )
                  // ),
                  child: FlatButton(
                    onPressed: () {},
                    child: new Image.asset('asset/image/sign-out.png'),
                  ),
                ),
                Container(
                  width: width * 1.2 / 2,
                  margin: EdgeInsets.only(
                    left: width * 0.1 / 2,
                  ),
                  // decoration: BoxDecoration(
                  //     border: Border.all(
                  //       color: Colors.green,
                  //       width: 2,
                  //     )
                  // ),
                  child: Text(
                    'Dang xuat',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              top: height * 0.5 / 5,
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
