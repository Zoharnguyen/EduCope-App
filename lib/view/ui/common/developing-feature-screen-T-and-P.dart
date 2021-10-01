import 'package:edu_cope/view/ui/common/widget-utils.dart';
import 'package:edu_cope/view/utils/common-utils.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

double width = CommonUtils.width;
double height = CommonUtils.height;

String courseId = '60e394825ded485c37a643f1';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DevelopingFeatureScreenTandPPage(),
    );
  }
}

class DevelopingFeatureScreenTandPPage extends StatefulWidget {
  DevelopingFeatureScreenTandPPage();

  @override
  _DevelopingFeatureScreenTandPPageState createState() =>
      _DevelopingFeatureScreenTandPPageState();
}

class _DevelopingFeatureScreenTandPPageState extends State<DevelopingFeatureScreenTandPPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(WidgetUtils.valueColorAppBar),
          title: Container(
            margin: EdgeInsets.only(
              right: width * 0.3 / 2,
            ),
            child: Align(
              child: Text(
                'Tính năng đang phát triển',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: CommonUtils.getUnitPx() * 20,
                  fontFamily: "Roboto",
                  fontStyle: FontStyle.normal,
                ),
              ),
            ),
          ),
          leading: Container(
            child: IconButton(
              icon: Icon(Icons.arrow_back_ios),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        ),
        body: Container(
            alignment: Alignment.center,
            child: Text(
              'Tính năng đang được phát triển.',
              style: TextStyle(color: Color(0xFF1298e0), fontSize: CommonUtils.getUnitPx() * 18),
            )));
  }
}
