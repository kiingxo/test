import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:interview/add_employee.dart';
import 'package:interview/features/employees/data/models/employee.dart';

final selectedEmployeesProvider = Provider<Set<Employee>>((ref) => {});

class EmployeesScreen extends StatelessWidget {
  const EmployeesScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future:
            DefaultAssetBundle.of(context).loadString('assets/employees.json'),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text('Error loading data: ${snapshot.error}');
          } else {
            List<dynamic> jsonData = json.decode(snapshot.data.toString());
            List<Employee> employees =
                jsonData.map((json) => Employee.fromJson(json)).toList();
            return ProviderScope(
              child: EmployeeTable(employees: employees),
            );
          }
        },
      ),
    );
  }
}

