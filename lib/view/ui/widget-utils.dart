import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'create-offer-class.dart';
import 'homepage.dart';
import 'manage-profile.dart';

double width = 411.4285;
double height = 683.4285;

// Show margin of container
// decoration: BoxDecoration(
//   border: Border.all(
//   color: Colors.green,
//   width: 2,
//   )
// ),

class WidgetUtils {
  static Container mainButton(BuildContext context, double heightTopMargin) {
    return Container(
      color: Colors.grey[100],
      margin: EdgeInsets.only(
        top: heightTopMargin,
      ),
      child: Row(
        children: <Widget>[
          Container(
            // height: height * 0.3 / 5,
            width: width * 0.45 / 2,
            margin: EdgeInsets.only(
              left: width * 0.07 / 2,
            ),
            child: FlatButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomePage()));
              },
              child: new Image.asset('asset/image/homepage_green.jpg'),
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
              height: height * 0.4 / 5,
              child: FlatButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ManageProfile()));
                },
                child: new Image.asset('asset/image/personal_blue.png'),
              )),
        ],
      ),
    );
  }
}
