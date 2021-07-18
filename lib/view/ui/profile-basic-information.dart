import 'package:edu_cope/view/ui/create-offer-class.dart';
import 'package:edu_cope/view/ui/profile-basic-information-edit.dart';
import 'package:edu_cope/view/ui/manage-profile.dart';
import 'package:flutter/material.dart';

import 'homepage.dart';

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
      home: ProfileBasicInformation(),
    );
  }
}

class ProfileBasicInformation extends StatefulWidget {
  ProfileBasicInformation();

  @override
  _ProfileBasicInformationState createState() => _ProfileBasicInformationState();
}

class _ProfileBasicInformationState extends State<ProfileBasicInformation> {
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
              'Thong Tin Ca Nhan',
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
                Container(
                  width: width*0.4 * 0.7/ 2,
                  height: height*0.5 * 0.7/ 5,
                  margin: EdgeInsets.only(
                    bottom: height*0.65/5,
                    left: width*0.15/2
                  ),
                  // decoration: BoxDecoration(
                  //   border: Border.all(
                  //     color: Colors.green,
                  //     width: 2,
                  //   )
                  // ),
                  child: IconButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => ProfileBasicInformationEdit()));
                    },
                    icon: new Image.asset(
                      'asset/image/edit.png',
                    ),
                  ),
                ),
              ],
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
                    'Ho va ten',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                    ),
                  )
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              right: width*0.8/2,
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
            height: height * 0.35 / 5,
            // decoration: BoxDecoration(
            //     border: Border.all(
            //       color: Colors.green,
            //       width: 2,
            //     )
            // ),
            child: Row(
              children: <Widget>[
                Container(
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
                      'Gioi thieu',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                      ),
                    )
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              left: width*0.15/2,
              right: width * 0.14/2
            ),
            child: Text(
              '      Toi la A, hien dang la sinh vien truong dai hoc Ngoai Ngu',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
              ),
            ),
          ),
          Container(
            height: height * 0.35 / 5,
            // decoration: BoxDecoration(
            //     border: Border.all(
            //       color: Colors.green,
            //       width: 2,
            //     )
            // ),
            child: Row(
              children: <Widget>[
                Container(
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
                      'Kinh nghiem',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                      ),
                    )
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              left: width*0.15/2,
              right: width * 0.14/2
            ),
            child: Text(
              '      Toi co hon 3 nam kinh nghiem gia su cho cac ban hoc sinh THPT',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
              ),
            ),
          ),
          Container(
            height: height * 0.35 / 5,
            // decoration: BoxDecoration(
            //     border: Border.all(
            //       color: Colors.green,
            //       width: 2,
            //     )
            // ),
            child: Row(
              children: <Widget>[
                Container(
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
                      'So dien thoai',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                      ),
                    )
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              right: width*0.8/2,
            ),
            child: Text(
              '0123456789',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
              ),
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
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => HomePage()));
                    },
                    child: new Image.asset('asset/image/homepage.png'),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                    left: width * 0.25 / 2,
                  ),
                  height: height * 0.4 / 5,
                  child: FlatButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CreateOfferClass()));
                    },
                    child: new Image.asset('asset/image/add.png'),
                  ),
                ),
                Container(
                    margin: EdgeInsets.only(
                      left: width * 0.2 / 2,
                    ),
                    height: height * 0.45 / 5,
                    child: FlatButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => ManageProfile()));
                      },
                      child: new Image.asset('asset/image/blank-account.jpg'),
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
