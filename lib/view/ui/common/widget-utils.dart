import 'dart:collection';
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:edu_cope/constant/user-type.dart';
import 'package:edu_cope/dto/local-file.dart';
import 'package:edu_cope/dto/response-entity.dart';
import 'package:edu_cope/dto/user-information.dart';
import 'package:edu_cope/dto/user-profile.dart';
import 'package:edu_cope/service/api-file.dart';
import 'package:edu_cope/view/ui/common/developing-feature-screen-T-and-P.dart';
import 'package:edu_cope/view/utils/common-utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

import '../basic-operate-course/create-offer-class-T.dart';
import '../homepage-T-and-P.dart';
import '../manage-profile/manage-profile-T-and-P.dart';

double width = CommonUtils.width;
double height = CommonUtils.height;
String userIdGlobal = CommonUtils.currentUserId;

// Show margin of container
// decoration: BoxDecoration(
//   border: Border.all(
//   color: Colors.green,
//   width: 2,
//   )
// ),

class WidgetUtils {
  static int valueColorAppBar = 0xFF32a689;

  static Container mainButton(
      BuildContext context, double heightTopMargin, UserType userType) {
    return Container(
      // color: Colors.grey[100],
      margin: EdgeInsets.only(
        top: heightTopMargin,
      ),
      decoration: BoxDecoration(
        color: Color(0xFFe9f0ef),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(27),
          topRight: Radius.circular(27),
        ),
      ),
      child: Row(
        children: <Widget>[
          Container(
            height: height * 0.4 / 5,
            width: width * 0.45 / 2,
            margin: EdgeInsets.only(
              left: width * 0.07 / 2,
            ),
            child: TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => HomePageTandP(userIdGlobal)));
              },
              child: new Image.asset('asset/image/homepage_green.png'),
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              left: width * 0.25 / 2,
            ),
            height: height * 0.2 / 2,
            width: width * 0.45 / 2,
            child: TextButton(
              onPressed: () {
                if (UserType.TEACHER == userType) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CreateOfferClassTPage()));
                } else {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              DevelopingFeatureScreenTandPPage()));
                }
              },
              child: new Image.asset('asset/image/add.png'),
            ),
          ),
          Container(
              margin: EdgeInsets.only(
                left: width * 0.2 / 2,
              ),
              height: height * 0.4 / 5,
              width: width * 0.45 / 2,
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ManageProfileTandPPage(
                              CommonUtils.currentUserId)));
                },
                child: new Image.asset('asset/image/personal_blue.png'),
              )),
        ],
      ),
    );
  }

  static Expanded showRatingStarsMinor(String? rate, List stars) {
    if (rate != null) {
      stars = CommonUtils.mapNumStarsToListStars(rate);
      return Expanded(
        child: Container(
          width: width * 0.4 / 2,
          height: height * 0.1 / 5,
          child: new ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: stars.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  margin: EdgeInsets.only(
                    left: width * 0.01 / 2,
                  ),
                  width: width * 0.06 / 2,
                  child: new Image.asset(
                    stars[index],
                    fit: BoxFit.fitWidth,
                  ),
                );
              }),
        ),
      );
    } else
      return Expanded(
        child: Container(),
      );
  }

  static Future<LocalFile> getFileById(String fileId) async {
    APIFileClient apiAcountClient =
        APIFileClient(Dio(BaseOptions(contentType: "application/json")));
    ResponseEntity responseEntity = await apiAcountClient.getFileById(fileId);
    if (responseEntity.getStatus == HttpStatus.ok) {
      print('Get file success');
      LocalFile localFile = LocalFile.fromJson(responseEntity.data);
      if (localFile != null && localFile.filename != null) {
        print("Filename: " + localFile.filename.toString());
      }
      return localFile;
    } else {
      print('Error: ' + responseEntity.getException.toString());
      return new LocalFile();
    }
  }

  static Uint8List dataFromBase64String(String base64String) {
    return base64Decode(base64String);
  }

  static Future<Image> getImage(String fileId) async {
    Image? image = null;
    if (fileId != null && fileId != ' ') {
      LocalFile localFile = new LocalFile();
      await getFileById(fileId).then((value) => {localFile = value});
      print("Image will be converted from file!!!");
      image = new Image.memory(dataFromBase64String(localFile.file.toString()));
      return image;
    }
    image = Image.network('https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg');
    return image;
  }

  static Future<void> uploadFile(String filePath, String authorId) async {
    print("Start upload file...");
    // Initialize value for header
    final String tokenType = "Bearer ";
    var _headers = <String, String>{};
    _headers.putIfAbsent(
        "Authorization", () => tokenType + CommonUtils.userToken);

    // Initialize value for request param
    Map<String, String> _requestParam = new HashMap();
    _requestParam.putIfAbsent("authorId", () => authorId);

    var request = http.MultipartRequest(
        'POST', Uri.parse(CommonUtils.baseUrl + "/file/upload-single"));

    // Add information for request
    request.files.add(await http.MultipartFile.fromPath('file', filePath));
    request.headers.addAll(_headers);
    request.fields.addAll(_requestParam);

    var res = await request.send();
    print("End upload file!!!");
  }

  static Image? getImageFromUserProfile(UserProfile userProfile) {
    Image? profileImage = null;
    if (userProfileGlobal != null && userProfileGlobal.urlImageProfile != null && userProfileGlobal.urlImageProfile != '') {
      profileImage = new Image.memory(WidgetUtils.dataFromBase64String(
          userProfileGlobal.urlImageProfile.toString()));
    }
    return profileImage;
  }

  static Image? getImageFromUserInformation(UserInformation userInformation) {
    Image? profileImage = null;
    if (userInformation != null && userInformation.urlImageProfile != null && userInformation.urlImageProfile != '') {
      profileImage = new Image.memory(WidgetUtils.dataFromBase64String(
          userInformation.urlImageProfile.toString()));
    }
    return profileImage;
  }

}
