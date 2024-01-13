import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:interview/features/employees/data/models/employee.dart';
import 'package:interview/features/employees/presentation/employee_screen.dart';

class EmployeeTable extends ConsumerWidget {
  final List<Employee> employees;

  const EmployeeTable({super.key, required this.employees});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedEmployees = ref.watch(selectedEmployeesProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _titleSection(employees.length),
        _content(employees, selectedEmployees, ref)
      ],
    );
  }


  Color getRandomColor() {
    final random = Random();
    return Color.fromARGB(
      255,
      random.nextInt(256),
      random.nextInt(256),
      random.nextInt(256),
    );
  }
}
