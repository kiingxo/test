// employee_controller.dart
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:interview/features/employees/data/models/employee.dart';

class EmployeeController extends ChangeNotifier {
  List<Employee> employees = [];

  Future<void> loadEmployeeData(BuildContext context) async {
    final String data = await DefaultAssetBundle.of(context)
        .loadString('assets/employees.json');
    final List<dynamic> jsonList = json.decode(data);

    employees = jsonList
        .map((json) => Employee.fromJson(json))
        .toList()
        .cast<Employee>();

    notifyListeners();
  }
}
