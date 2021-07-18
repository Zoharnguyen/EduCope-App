import 'package:edu_cope/view/utils/common-utils.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

final double height = CommonUtils.height;
final double width = CommonUtils.width;

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // title: 'Edu Cope',
      // theme: ThemeData(
      //   primarySwatch: Colors.blue,
      // ),
      home: EditProfileBasicInformationTandPPage(),
    );
  }
}

class EditProfileBasicInformationTandPPage extends StatefulWidget {
  EditProfileBasicInformationTandPPage();

  @override
  _EditProfileBasicInformationTandPPageState createState() =>
      _EditProfileBasicInformationTandPPageState();
}

class _EditProfileBasicInformationTandPPageState
    extends State<EditProfileBasicInformationTandPPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        leading: Container(
          margin: EdgeInsets.only(
            top: height * 0.04 / 5,
          ),
          child: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            // iconSize: 20,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        centerTitle: true,
        title: Text(
          'Cập nhật',
          style: TextStyle(
            fontSize: 24,
          ),
        ),
      ),
      body: SingleChildScrollView(
        reverse: false,
        // padding: EdgeInsets.only(
        //   bottom: bottomKeyboard * 0.1,
        // ),
        child: Column(
          children: <Widget>[
            Container(
              width: width / 2,
              height: height / 5,
              child: new Image.asset(
                'asset/image/blank-account.jpg',
              ),
            ),
            titleForItems('Họ và tên'),
            inputContentItem('Nguyễn Van A', 1),
            titleForItems('Số điện thoại'),
            inputContentItem('0123456789', 1),
            titleForItems('Ngày sinh'),
            inputContentItem('01/01/1995', 1),
            titleForItems('Giới thiệu'),
            inputContentItem(
                'Toi la A, hien dang la sinh vien truong dai hoc Ngoai Ngu', 2),
            titleForItems('Kinh nghiệm'),
            inputContentItem(
                'Toi la A, hien dang la sinh vien truong dai hoc Ngoai Ngu', 2),
            titleForItems('Địa chỉ'),
            inputContentItem('Thanh Oai, Hoang Mai, Ha Noi', 2),
            Container(
              height: height * 0.3 / 5,
              width: width * 0.6 / 2,
              margin: EdgeInsets.only(
                  top: height * 0.3 / 5, bottom: height * 0.2 / 5),
              decoration: BoxDecoration(
                  color: Colors.blue[300],
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
              child: FlatButton(
                child: Text(
                  "Cap nhat",
                  style: TextStyle(
                      fontSize: 18,
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
    );
  }
}

Container titleForItems(String initialValueTitle) {
  return Container(
    height: height * 0.35 / 5,
    child: Row(
      children: <Widget>[
        Container(
            // width: width * 0.3 / 2,
            margin: EdgeInsets.only(
              left: width * 0.15 / 2,
            ),
            child: Text(
              initialValueTitle,
              style: TextStyle(
                color: Colors.blue,
                fontSize: 20,
              ),
            )),
      ],
    ),
  );
}

Container inputContentItem(String contentItem, int maxLine) {
  return Container(
    margin: EdgeInsets.only(
      right: width * 0.2 / 2,
      left: width * 0.3 / 2,
    ),
    child: TextFormField(
      autofocus: false,
      maxLines: maxLine,
      cursorWidth: 2,
      cursorHeight: 25,
      initialValue: contentItem,
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
  );
}
