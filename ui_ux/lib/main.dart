import 'package:flutter/material.dart';
import 'package:ui_ux/pages/landing/landingPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: landingPage(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          //   fontFamily: 'Poppins',
          ),
    );
  }
}
