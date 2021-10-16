import 'package:binge/introduction.dart';
import 'package:binge/login.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  await Firebase.initializeApp();
  runApp(Phoenix(
    child: MaterialApp(
      home: Login(),
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
    ),
  ));
}
