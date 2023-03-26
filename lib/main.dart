import 'package:flutter/material.dart';
import 'package:secure_password_and_generator/navigationpage.dart';
import 'package:secure_password_and_generator/page1.dart';
import 'package:secure_password_and_generator/splash.dart';

import 'login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
          left: true,
          bottom: true,
          top: true,
          right: true,
          child: NavigationPage()),
    );
  }
}

