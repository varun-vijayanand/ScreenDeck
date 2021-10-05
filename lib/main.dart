import 'package:flutter/material.dart';
import 'package:screen_deck/views/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ScreenDeck',
      theme: ThemeData(
               primaryColor: Colors.white,
      ),
      home: Home(),
    );
  }
}
