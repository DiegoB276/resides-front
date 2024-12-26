/*
  All rights reserved © Fullcode.
  Code by © Fullcode.
 */

import 'dart:convert';
import 'dart:math';
import 'package:http/http.dart' as http;

class OwnerAPI {
  static const baseurl = "YOUR_API_HERE";

  static Future<List<dynamic>?> getResidences() async {
    final url = Uri.parse("$baseurl/ResidencesController/findAllResidences");
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
        Uri.parse("$baseurl/ResidencesController/findResidenceById/$id");
    final response = await http.get(url);
    return json.decode(response.body);
  }
}
