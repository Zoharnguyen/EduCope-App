import 'package:edu_cope/view/utils/common-utils.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AddNewAdjustStudentLearningClassTPage(),
    );
  }
}

class AddNewAdjustStudentLearningClassTPage extends StatefulWidget {
  AddNewAdjustStudentLearningClassTPage();

  @override
  _AddNewAdjustStudentLearningClassTPageState createState() => _AddNewAdjustStudentLearningClassTPageState();
}

class _AddNewAdjustStudentLearningClassTPageState extends State<AddNewAdjustStudentLearningClassTPage> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: Container(
          child: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
      ),
      body: Column(
        children: <Widget>[
          Container(
            child: Text(
              'Nguyen Van A',
              style: TextStyle(
                fontSize: CommonUtils.getUnitPx() * 20,
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
                  child: Text(
                    'Thoi gian',
                    style: TextStyle(
                      fontSize: CommonUtils.getUnitPx() * 20,
                      fontFamily: "Roboto",
                      fontStyle: FontStyle.normal,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                    left: width * 0.2 / 2,
                    right: width * 0.2 / 2,
                  ),
                  child: TextFormField(
                    autofocus: false,
                    maxLines: 2,
                    cursorWidth: 2,
                    cursorHeight: 25,
                    onChanged: (text) {},
                    decoration: InputDecoration(
                      hintStyle: TextStyle(
                        fontSize: CommonUtils.getUnitPx() * 14,
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
                  margin: EdgeInsets.only(
                    top: height * 0.2 / 5,
                  ),
                  child: Text(
                    'Noi dung',
                    style: TextStyle(
                      fontSize: CommonUtils.getUnitPx() * 20,
                      fontFamily: "Roboto",
                      fontStyle: FontStyle.normal,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                    left: width * 0.2 / 2,
                    right: width * 0.2 / 2,
                  ),
                  child: TextFormField(
                    autofocus: false,
                    maxLines: 2,
                    cursorWidth: 2,
                    cursorHeight: 25,
                    onChanged: (text) {},
                    decoration: InputDecoration(
                      hintStyle: TextStyle(
                        fontSize: CommonUtils.getUnitPx() * 14,
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
                  height: height * 0.3 / 5,
                  width: width * 0.6 / 2,
                  margin: EdgeInsets.only(
                      top: height * 0.3 / 5,
                      bottom: height * 0.2 / 5,
                      left: width * 0.7 / 2,
                      right: width * 0.7 / 2),
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
                          color: Colors.grey.shade400,
                          offset: Offset(0, 4),
                        ),
                      ]),
                  child: TextButton(
                    child: Text(
                      "Tao moi",
                      style: TextStyle(
                          fontSize: CommonUtils.getUnitPx() * 18,
                          color: Colors.white,
                          fontFamily: "Roboto",
                          fontStyle: FontStyle.normal),
                    ),
                    onPressed: () {},
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
