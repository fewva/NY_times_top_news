import 'package:flutter/material.dart';
import 'package:nt_top_news/components/bottom_navigation.dart';
import 'package:nt_top_news/theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: theme, 
      home: BottomNavigation(),
    );
  }
}
