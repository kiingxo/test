
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:interview/features/employees/data/models/employee.dart';
import 'package:interview/features/employees/presentation/screens/employee_screen.dart';
import 'package:interview/features/employees/presentation/widgets/table_contents.dart';

class EmployeeTable extends ConsumerWidget {
  final List<Employee> employees;

  const EmployeeTable({super.key, required this.employees});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedEmployees = ref.watch(selectedEmployeesProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        titleSection(employees.length),
        content(employees, selectedEmployees, ref)
      ],
    );
  }
}
