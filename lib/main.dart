import 'package:flutter/material.dart';
import 'package:pdpbestanim/pages/home_page.dart';
import 'package:pdpbestanim/pages/home_page3.dart';
import 'package:pdpbestanim/pages/home_page4.dart';
import 'package:pdpbestanim/pages/home_page5.dart';
import 'package:pdpbestanim/pages/home_page6.dart';
import 'package:pdpbestanim/pages/homework1.dart';
import 'package:pdpbestanim/pages/homework2.dart';
import 'package:pdpbestanim/pages/hope_page2.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: HomeWork2(),
    );
  }
}