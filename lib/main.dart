import 'package:flutter/material.dart';
import 'package:flutter_filter_1/screen/filterScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FilterScreen(),
    );
  }
}