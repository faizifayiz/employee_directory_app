import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'employee_model.dart';

class EmployeeProvider with ChangeNotifier {
  List<Employee> _employees = [];

  List<Employee> get employees => _employees;

  Future<void> fetchEmployees() async {
  final response = await http.get(Uri.parse('YOUR_API_ENDPOINT'));

  if (response.statusCode == 200) {
    _employees = _parseEmployees(response);
    notifyListeners();
  } else {
    throw Exception('Failed to fetch employees');
  }
}


  List<Employee> _parseEmployees(http.Response response) {
    final List<dynamic> responseData = json.decode(response.body);
    return responseData
        .map((employeeData) => Employee(
              id: employeeData['id'],
              name: employeeData['name'],
              email: employeeData['email'],
              profileImage: employeeData['profile_image'],
              companyName: employeeData['company_name'],
            ))
        .toList();
  }
}
