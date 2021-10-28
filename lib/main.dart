import 'dart:ui';

//Size in logical pixels
import 'package:edu_cope/view/ui/welcome/welcome-T-and-P.dart';
import 'package:edu_cope/view/utils/common-utils.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

var pixelRatio = window.devicePixelRatio;
var logicalScreenSize = window.physicalSize / pixelRatio;
var logicalWidth = logicalScreenSize.width;
var logicalHeight = logicalScreenSize.height;

Future<void> main() async {
  // Initialize value of width and height of screen
  CommonUtils.width = logicalWidth;
  CommonUtils.height = logicalHeight;
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: WelcomeTandPPage(),
    );
  }
}
