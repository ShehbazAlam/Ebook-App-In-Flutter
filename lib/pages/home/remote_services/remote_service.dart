import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ApiService extends GetxController {
  Future<List<dynamic>> fetchData() async {
    final response = await http.get(Uri.parse('https://example.com/api/data'));
    if (response.statusCode == 200) {
      return json.decode(response.body) as List;
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<List<dynamic>> fetchBooks() async {
    final response = await http.get(Uri.parse('https://example.com/api/data'));
    if (response.statusCode == 200) {
      return json.decode(response.body) as List;
    } else {
      throw Exception('Failed to load data');
    }
  }
}