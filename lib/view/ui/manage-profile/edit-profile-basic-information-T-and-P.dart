import 'dart:io';

import 'package:dio/dio.dart';
import 'package:edu_cope/constant/from-screen.dart';
import 'package:edu_cope/dto/response-entity.dart';
import 'package:edu_cope/dto/user-information.dart';
import 'package:edu_cope/service/api-account.dart';
import 'package:edu_cope/view/ui/common/widget-utils.dart';
import 'package:edu_cope/view/ui/manage-profile/profile-basic-information-T-and-P.dart';
import 'package:edu_cope/view/utils/common-utils.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void main() {
  runApp(MyApp());
}

final double height = CommonUtils.height;
final double width = CommonUtils.width;
final String userId = CommonUtils.currentUserId;
Image? profileImage = null;
bool pickedImage = false;

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
  late PickedFile _imageFile = new PickedFile("");
  final ImagePicker _picker = ImagePicker();

  Future<void> uploadImage(String filepath, String currentUserId) async {
    String authorId = currentUserId;
    await WidgetUtils.uploadFile(filepath, authorId);
  }

  void _pickImage() async {
    try {
      final pickedFile = await _picker.getImage(source: ImageSource.gallery);
      setState(() {
        if (pickedFile != null) {
          _imageFile = pickedFile;
          profileImage = Image.file(File(pickedFile.path));
          pickedImage = true;
        }
      });
    } catch (e) {
      print("Image picker error ");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(WidgetUtils.valueColorAppBar),
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
            fontSize: CommonUtils.getUnitPx() * 20,
          ),
        ),
      ),
      body: FutureBuilder<UserInformation>(
        future: getUserInformation(userId),
        builder: (context, snapshot) {
          UserInformation userInformation = new UserInformation();
          if (snapshot.hasData) {
            userInformation = snapshot.data!;
            return SingleChildScrollView(
              reverse: false,
              child: Column(
                children: <Widget>[
                  Container(
                    height: height * 1.7 / 5,
                    child: Row(
                      children: [
                        Container(
                          width: width / 2,
                          height: height * 1.7 / 5,
                          margin: EdgeInsets.only(
                            left: width * 0.9 / 4,
                          ),
                          decoration: BoxDecoration(
                              color: Color(0xFFe4f2f0),
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(17),
                                topRight: Radius.circular(17),
                                bottomLeft: Radius.circular(17),
                                bottomRight: Radius.circular(17),
                              ),
                              border: Border.all(
                                color: Color(0xFFe1f5f2),
                                width: 2,
                              ),
                              image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: profileImage != null
                                      ? profileImage!.image
                                      : NetworkImage(
                                          'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg'))),
                        ),
                        Container(
                          width: width * 0.4 * 0.7 / 2,
                          height: height * 0.5 * 0.7 / 5,
                          margin: EdgeInsets.only(
                              left: width * 0.01 / 2, top: height * 1.3 / 5),
                          child: IconButton(
                            onPressed: () {
                              _pickImage();
                            },
                            icon: new Image.asset(
                              'asset/image/edit.png',
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  titleForItems('Họ và tên'),
                  inputContentItem(
                      CommonUtils.catchCaseStringNull(userInformation.fullName),
                      1,
                      userInformation,
                      'fullName'),
                  titleForItems('Số điện thoại'),
                  inputContentItem(
                      CommonUtils.catchCaseStringNull(
                          userInformation.phoneNumber),
                      1,
                      userInformation,
                      'phoneNumber'),
                  titleForItems('Ngày sinh'),
                  inputContentItem(
                      CommonUtils.catchCaseStringNull(userInformation.doB),
                      1,
                      userInformation,
                      'doB'),
                  titleForItems('Giới thiệu'),
                  inputContentItem(
                      CommonUtils.catchCaseStringNull(
                          userInformation.introduction),
                      2,
                      userInformation,
                      'introduction'),
                  titleForItems('Kinh nghiệm'),
                  inputContentItem(
                      CommonUtils.catchCaseStringNull(
                          userInformation.experience),
                      2,
                      userInformation,
                      'experience'),
                  titleForItems('Địa chỉ'),
                  inputContentItem(
                      CommonUtils.catchCaseStringNull(userInformation.address),
                      2,
                      userInformation,
                      'address'),
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
                    child: TextButton(
                      child: Text(
                        "Cập nhật",
                        style: TextStyle(
                            fontSize: CommonUtils.getUnitPx() * 18,
                            color: Colors.white,
                            fontFamily: "Roboto",
                            fontStyle: FontStyle.normal),
                      ),
                      onPressed: () async {
                        uploadImage(_imageFile.path, userId);
                        userInformation.urlImageProfile = '';
                        updateUserInformation(userInformation);
                        pickedImage = false;
                        await Future.delayed(const Duration(milliseconds: 500));
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    ProfileBasicInformationTandPPage(
                                        userInformation.id ?? '',
                                        FromScreen
                                            .fromScreenEditBasicInformationProfile)));
                      },
                    ),
                  )
                ],
              ),
            );
          }
          return Container();
        },
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
                color: Color(0xFF1298e0),
                fontSize: CommonUtils.getUnitPx() * 20,
                fontStyle: FontStyle.italic,
              ),
            )),
      ],
    ),
  );
}

Container inputContentItem(String contentItem, int maxLine,
    UserInformation userInformation, String fieldName) {
  // print("contentItem: " + contentItem);
  setValueFieldsForUserInformation(userInformation, fieldName, contentItem);
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
      onChanged: (text) {
        setValueFieldsForUserInformation(userInformation, fieldName, text);
      },
      decoration: InputDecoration(
        hintStyle: TextStyle(
          fontSize: CommonUtils.getUnitPx() * 14,
          color: Colors.grey,
        ),
      ),
    ),
  );
}

void setValueFieldsForUserInformation(
    UserInformation userInformation, String fieldName, String value) {
  if ('fullName' == fieldName) userInformation.fullName = value;
  if ('phoneNumber' == fieldName) userInformation.phoneNumber = value;
  if ('doB' == fieldName) userInformation.doB = value;
  if ('introduction' == fieldName) userInformation.introduction = value;
  if ('experience' == fieldName) userInformation.experience = value;
  if ('address' == fieldName) userInformation.address = value;
}

Future<UserInformation> getUserInformation(String userId) async {
  UserInformation userInformation = new UserInformation();
  APIAcountClient apiAcountClient =
      APIAcountClient(Dio(BaseOptions(contentType: "application/json")));
  ResponseEntity responseEntity =
      await apiAcountClient.getUserInformation(userId);
  if (responseEntity.getStatus == HttpStatus.ok) {
    UserInformation response = UserInformation.fromJson(responseEntity.data);
    print('Id: ' + response.id.toString());

    // Get Image of userInformation
    if(!pickedImage) {
      profileImage = WidgetUtils.getImageFromUserInformation(response);
    }

    return response;
  } else {
    print('Error: ' + responseEntity.getException.toString());
  }
  return userInformation;
}

void updateUserInformation(UserInformation userInformation) async {
  APIAcountClient apiAcountClient =
      APIAcountClient(Dio(BaseOptions(contentType: "application/json")));
  ResponseEntity responseEntity =
      await apiAcountClient.updateUserInformation(userInformation);
  if (responseEntity.getStatus == HttpStatus.ok) {
    UserInformation response = UserInformation.fromJson(responseEntity.data);
    print('Id: ' + response.id.toString());
  } else {
    print('Error: ' + responseEntity.getException.toString());
  }
}
