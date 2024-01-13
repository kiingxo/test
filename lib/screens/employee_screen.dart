import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:interview/add_employee.dart';
import 'package:interview/models/employee.dart';

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

class EmployeeTable extends ConsumerWidget {
  final List<Employee> employees;

  const EmployeeTable({required this.employees});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedEmployees = ref.watch(selectedEmployeesProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Employee (${employees.length})',
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Wrap(
              direction: Axis.vertical,
              children: [
                Text(
                  'Employees',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                      const Text(
                        'View and manage employees in your organization',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 190,
                  ),
                  TextButton(
                    onPressed: () {
                      // Add your filter logic here
                    },
                    child: const Text(
                      'Filter',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  const AddButtonn(hint: "Add Employee"),
                ],
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: DataTable(
            columns: const [
              DataColumn(label: Text('S/N')),
              DataColumn(label: Text('Name')),
              DataColumn(label: Text('Contact')),
              DataColumn(
                label: Text('Group'),
              ),
              DataColumn(label: Text('Department')),
              DataColumn(label: Text('Session')),
              DataColumn(label: Text('Action')),
            ],
            rows: employees.asMap().entries.map((entry) {
              int index = entry.key + 1;
              Employee employee = entry.value;
              final isSelected = selectedEmployees.contains(employee);
              final randomColor = getRandomColor();

              return DataRow(
                selected: isSelected,
                onSelectChanged: (bool? selected) {
                  if (selected != null && selected) {
                    ref.read(selectedEmployeesProvider).add(employee);
                  } else {
                    ref.read(selectedEmployeesProvider).remove(employee);
                  }
                },
                cells: [
                  DataCell(Text('$index')),
                  DataCell(
                    Row(
                      children: [
                        const Icon(Icons.person),
                        const SizedBox(width: 8),
                        Text(employee.name),
                      ],
                    ),
                  ),
                  DataCell(
                    Row(
                      children: [
                        const Icon(Icons.phone),
                        const SizedBox(width: 8),
                        Text(employee.contact),
                      ],
                    ),
                  ),
                  DataCell(
                    Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 8,
                        horizontal: 12,
                      ),
                      decoration: BoxDecoration(
                        color: randomColor,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        employee.group,
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  DataCell(Text(employee.department)),
                  DataCell(Text('44')),
                  DataCell(
                    IconButton(
                      icon: const Icon(Icons.menu),
                      onPressed: () {
                        // Handle action menu button press
                      },
                    ),
                  ),
                ],
              );
            }).toList(),
          ),
        ),
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
