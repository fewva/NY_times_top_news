

import 'package:flutter/material.dart';

ThemeData theme = ThemeData(
  fontFamily: font,
  scaffoldBackgroundColor: Colors.white,

  appBarTheme: AppBarTheme(
    elevation: 0,
    color: Colors.white,
    textTheme: TextTheme(
      headline6: TextStyle(
        color: Colors.black,
        fontSize: 20,
        fontWeight: FontWeight.w700,
        fontFamily: font
      )
    )  
  ),

  tabBarTheme: TabBarTheme(
    labelStyle: TextStyle(
      // fontWeight: FontWeight.w600,
      fontFamily: font,
      fontSize: 14,
      height: 1.5,
      letterSpacing: 0.5
    ),
    unselectedLabelStyle: TextStyle(
      fontWeight: FontWeight.w600,
      fontFamily: font,
      fontSize: 14,
      height: 1.5,
      letterSpacing: 0.5,
    ),
    labelColor: Colors.white,
    unselectedLabelColor: Colors.grey,
    indicatorSize: TabBarIndicatorSize.tab
  ),

  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    unselectedItemColor: const Color(0xff47515A),
    showUnselectedLabels: false,
    type: BottomNavigationBarType.fixed,
    selectedLabelStyle: TextStyle(
      fontFamily: font,
      fontSize: 12,
      fontWeight: FontWeight.w600
    ),
  ),

  primarySwatch: Colors.blue,
  visualDensity: VisualDensity.adaptivePlatformDensity,
);

List <BoxShadow> kStandartBoxShadow = [
  BoxShadow(
    color: Colors.white.withOpacity(0.8),
    offset: const  Offset(-6.0, -6.0),
    blurRadius: 16.0,
  ),
  BoxShadow(
    color: Colors.black.withOpacity(0.1),
    offset: const Offset(6.0, 6.0),
    blurRadius: 16.0,
  ),
];

const String font = 'Commissioner';