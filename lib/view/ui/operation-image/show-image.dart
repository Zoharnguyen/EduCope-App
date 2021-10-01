import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:edu_cope/dto/local-file.dart';
import 'package:edu_cope/dto/response-entity.dart';
import 'package:edu_cope/service/api-file.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Image',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyImagePicker(title: 'Show image'),
    );
  }
}

class MyImagePicker extends StatefulWidget {
  MyImagePicker({required this.title}) : super();
  final String title;

  @override
  _MyImagePickerState createState() => _MyImagePickerState();
}

class _MyImagePickerState extends State<MyImagePicker> {
  String fileId = "6080b4dd10349c34e7a90286";
  Image? imageInstance = null;

  @override
  initState() {
    super.initState();
    getImage(fileId).then((value) => {imageInstance = value});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Container(
          child: imageInstance != null ? imageInstance : new Container(),
          // child: Text("Test success"),
        ) // This trailing comma m
        );
  }
}

Future<LocalFile> getFileById(String fileId) async {
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

Uint8List dataFromBase64String(String base64String) {
  return base64Decode(base64String);
}

Future<Image> getImage(String fileId) async {
  LocalFile localFile = new LocalFile();
  await getFileById(fileId).then((value) => {localFile = value});
  Image image =
  new Image.memory(dataFromBase64String(localFile.file.toString()));
  return image;
}