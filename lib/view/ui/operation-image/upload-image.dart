import 'dart:collection';
import 'dart:io';

import 'package:edu_cope/view/utils/common-utils.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

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
      home: MyImagePicker(title: 'Upload image'),
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
  late PickedFile _imageFile = new PickedFile("");
  final ImagePicker _picker = ImagePicker();

  void uploadImage(String filepath) async {
    String authorId = CommonUtils.currentUserId;
    await uploadFile(filepath, authorId);
  }

  Widget _previewImage() {
    if (_imageFile.path.length > 1) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.file(File(_imageFile.path)),
            SizedBox(
              height: 20,
            ),
            RaisedButton(
              onPressed: () async {
                uploadImage(_imageFile.path);
              },
              child: const Text('Upload'),
            )
          ],
        ),
      );
    } else {
      return const Text(
        'You have not yet picked an image.',
        textAlign: TextAlign.center,
      );
    }
  }

  void _pickImage() async {
    try {
      final pickedFile = await _picker.getImage(source: ImageSource.gallery);
      setState(() {
        _imageFile = pickedFile!;
      });
    } catch (e) {
      print("Image picker error ");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(child: _previewImage()),
      floatingActionButton: FloatingActionButton(
        onPressed: _pickImage,
        tooltip: 'Pick Image from gallery',
        child: Icon(Icons.photo_library),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

// Future<Widget> uploadFile(MultipartFile file, String authorId) async {
//   APIFileClient apiAcountClient =
//       APIFileClient(Dio(BaseOptions(contentType: "application/json")));
//   ResponseEntity responseEntity =
//       await apiAcountClient.uploadFile(file, authorId);
//   if (responseEntity.getStatus == HttpStatus.ok) {
//     print('Upload file success');
//     return Text('Success!');
//   } else {
//     print('Error: ' + responseEntity.getException.toString());
//     return Text('Failed!');
//   }
// }

Future<void> uploadFile(String filePath, String authorId) async {
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
