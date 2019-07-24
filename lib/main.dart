import 'package:flutter/material.dart';
import 'package:thanosrestaurant/screen/home_page.dart';
import 'package:thanosrestaurant/style/theme_style.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: buildPrimaryThemeData(context),
      home: MyHomePage(),
    );
  }
}

