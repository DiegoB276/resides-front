/*
  All rights reserved © Fullcode.
  Code by © Fullcode.
 */

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:resides/controller/auth/login_controller.dart';

class AuthenticationService {
  static const baseUrl = "YOUR_API_HERE";

//Inicia sesión en la app. Si las credenciales son validas, retorna 0;
  static Future<int> login(Map data, BuildContext context) async {
    final url = Uri.parse("$baseUrl/User/authenticateUser");
    try {
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(data),
      );
      if (response.statusCode == 200) {
        //Guarda el userId en el dispositivo.
        LoginController.saveUserId(await getUserId(data['mail']));
        final userRole = getRoleUserById(await getUserId(data['mail']));
        LoginController.navigateToHome(await userRole, context);
        return 0;
      }

      return 1;
    } catch (execption) {
      debugPrint(execption.toString());
      return 1;
    }
  }

//Obtiene el id del usuario mediante el correo electrónico
  static Future<int> getUserId(String email) async {
    final url = Uri.parse("$baseUrl/User/findUserByMail/$email");
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return data['idUsers'];
      }
      return -1;
    } catch (execption) {
      debugPrint(execption.toString());
      return -1;
    }
  }

  static Future<String> getRoleUserById(int userId) async {
    final url = Uri.parse("$baseUrl/User/findUserById/$userId");
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final String data2 = data['role'];
        return data2;
      }
    } catch (exception) {
      debugPrint(exception.toString());
    }
    return "";
  }

  static Future<int> createAccount(Map data) async {
    final url = Uri.parse("$baseUrl/User/saveUser");
    try {
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(data),
      );
      print(response.body);
      return (response.statusCode == 200) ? 0 : 1;
    } catch (exception) {
      debugPrint(exception.toString());
      return 1;
    }
  }
}
