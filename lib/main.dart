import 'package:flutter/material.dart';
import 'package:sparkline/report_page.dart';
//import 'splash.dart';
//import 'test2.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue),


      home: Reports(),

    );
  }
}