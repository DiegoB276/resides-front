/*
  All rights reserved © Fullcode.
  Code by © Fullcode.
 */

import 'package:flutter/material.dart';
import 'package:resides/user_screens/bottom_navigation_bar_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
//import 'package:residenciasup/user_screens/bottom_navigation_bar_screen.dart';

void main() {
  runApp(const MyApp());
  setProfileStatusDefault();
}

void setProfileStatusDefault() async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  if (pref.getInt("user_id") == 0) {
    await pref.setInt("user_id", 0);
    return;
  }
  return;
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: BottomNavigationBarScreen(),
    );
  }
}
