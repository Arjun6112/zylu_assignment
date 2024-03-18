import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:zylu_assignment/models/employee.dart';

Future<List<Employee>> fetchEmployeeData() async {
  try {
    final response = await http.get(Uri.parse(
        'https://api.jsonbin.io/v3/b/65f87033dc74654018b4be8b?meta=false'));

    if (response.statusCode == 200) {
      return List<Employee>.from(
          jsonDecode(response.body)['record'].map((x) => Employee.fromJson(x)));
    } else {
      throw Exception('Failed to load employee data');
    }
  } catch (e) {
    throw Exception('Failed to load employee data');
  }
}


