/*
  All rights reserved © Fullcode.
  Code by © Fullcode.
 */

import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class UserAPI {
  static const baseurl = "YOUR_API_HERE";

  static Future<List<dynamic>?> getResidences() async {
    final url = Uri.parse("$baseurl/Residence/findAllResidences");
    Random random = Random();
    try {
      final response = await http.get(url);
      List<dynamic> myData = json.decode(response.body);
      myData.shuffle(random);
      return myData;
    } catch (error) {
      error.toString();
      return null;
    }
  }

  static Future<Map<String, dynamic>> getResidenceById(int id) async {
    final url =
        Uri.parse("$baseurl/Residence/findResidenceById/$id");
    final response = await http.get(url);
    return json.decode(response.body);
  }

  static Future<Map?> getUserByid(int userId) async {
    final url = Uri.parse("$baseurl/User/findUserById/$userId");
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      }
      return null;
    } catch (exception) {
      debugPrint(exception.toString());
      return null;
    }
  }
}
