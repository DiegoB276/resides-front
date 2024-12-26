/*
  All rights reserved © Fullcode.
  Code by © Fullcode.
 */

import 'package:flutter/material.dart';
import 'package:resides/owner_screens/owner_bottom_navigation_page.dart';
import 'package:resides/user_screens/bottom_navigation_bar_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController {
  static void saveUserId(int userId) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.setInt("user_id", userId);
    return;
  }

  static Future<void> logOut(BuildContext context) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.setInt("user_id", 0);
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const BottomNavigationBarScreen(),
      ),
    );
  }

//Recibe como parametro el rol del estudiante, y según sea
//Navega a pantallas diferentes.
  static Future<void> navigateToHome(String role, BuildContext context) async {
    final roles = ["Estudiante", "Arrendador"];
    if (role == roles[0]) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const BottomNavigationBarScreen(),
        ),
      );
      return;
    }
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const OwnerBottomNavigationPage(),
        ),
      );
      return;
  }
}
