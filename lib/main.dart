import 'package:flutter/material.dart';
import 'package:inshorts_clone/screens/home_page.dart';
import 'package:inshorts_clone/screens/landing_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: LandingPage(),
    );
  }
}
