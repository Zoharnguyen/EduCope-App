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
  String _subjectName;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    final bottomKeyboard = MediaQuery.of(context).viewInsets.bottom;
    return Scaffold(
      body: SingleChildScrollView(
        reverse: true,
        // padding: EdgeInsets.only(
        //   bottom: bottomKeyboard * 0.1,
        // ),
        child: Column(
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
                'Tao lop hoc moi',
                style: TextStyle(
                  fontSize: 22,
                  color: Colors.black,
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
                        'Mon hoc',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                        ),
                      )),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                right: width * 0.2 / 2,
                left: width * 0.3 / 2,
              ),
              child: TextFormField(
                autofocus: false,
                maxLines: 2,
                cursorWidth: 2,
                cursorHeight: 25,
                // focusNode: FocusNode(canRequestFocus: false),
                initialValue:
                'Mon toan',
                onChanged: (text) {},
                decoration: InputDecoration(
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
              height: height * 0.35 / 5,
              // margin: EdgeInsets.only(
              //   top: height * 0.2 / 5,
              // ),
              // decoration: BoxDecoration(
              //     border: Border.all(
              //       color: Colors.green,
              //       width: 2,color: Colors.green,
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
                        'Cap hoc',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                        ),
                      )),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                right: width * 0.4 / 2,
              ),
              child: DropdownButton<String>(
                value: _subjectName,
                //elevation: 5,
                style: TextStyle(color: Colors.black),
                items: <String>[
                  'Tieu hoc',
                  'Trung hoc co so',
                  'Trung hoc pho thong',
                  'Dai hoc',
                ].map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                hint: Text(
                  "Trung hoc pho thong",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
                onChanged: (String value) {
                  setState(() {
                    _subjectName = value;
                    // After selected drop down then cursor don't focus any text field
                    FocusScope.of(context).requestFocus(new FocusNode());
                  });
                },
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
                        'Hoc phi',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                        ),
                      )),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                right: width * 0.2 / 2,
                left: width * 0.3 / 2,
              ),
              child: TextFormField(
                autofocus: false,
                maxLines: 2,
                cursorWidth: 2,
                cursorHeight: 25,
                initialValue:
                '500k/buoi',
                onChanged: (text) {},
                decoration: InputDecoration(
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
                        'Luu y',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                        ),
                      )),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                right: width * 0.2 / 2,
                left: width * 0.3 / 2,
              ),
              child: TextFormField(
                autofocus: false,
                maxLines: 2,
                cursorWidth: 2,
                cursorHeight: 25,
                initialValue:
                'Day tai nha hoc sinh, chi day cho hoc sinh nam',
                onChanged: (text) {},
                decoration: InputDecoration(
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
              height: height*0.3/5,
              width: width*0.6/2,
              margin: EdgeInsets.only(
                  top: height*0.3/5,
                  bottom: height*0.2/5
              ),
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
                child: Text(
                  "Tao moi",
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontFamily: "Roboto",
                      fontStyle: FontStyle.normal
                  ),
                ),
                onPressed: () {},
              ),
            )
          ],
        ),
      ),
    );
  }
}
