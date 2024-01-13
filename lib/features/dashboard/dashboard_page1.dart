import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:interview/componets/add_employee.dart';
import 'package:interview/componets/side_drawer_component.dart';
import 'package:interview/componets/widgets.dart';
import 'package:interview/constants/appconst.dart';
import 'package:interview/features/employees/data/models/employee.dart';
import 'package:interview/features/employees/presentation/screens/employee_screen.dart';

final employeeCountProvider = Provider<int>((ref) {
  List<Employee> employees = [];
  return employees.length;
});

class EmployeeTable extends ConsumerWidget {
  const EmployeeTable({super.key});

  Color getRandomColor() {
    Random random = Random();
    Color color = Color.fromARGB(
      255,
      random.nextInt(256),
      random.nextInt(256),
      random.nextInt(256),
    );
    return color;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final employeeCount = ref.watch(employeeCountProvider);

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text(
                'Employee ($employeeCount)',
                style: const TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              LayoutBuilder(
                builder: (context, constraints) {
                  if (constraints.maxWidth > 600) {
                    return const Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          'View and Manage the Employees in your organization',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(width: 20),
                        Row(
                          children: [
                            Text("Filter"),
                            Text("Filter"),
                            AddButtonn(hint: "Add Employee"),
                          ],
                        ),
                      ],
                    );
                  } else {
                    return const Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          'View and Manage the Employees in your organization',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            Text("Filter"),
                            Text("Filter"),
                            AddButtonn(hint: "Add Employee"),
                          ],
                        ),
                      ],
                    );
                  }
                },
              ),
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
              DataColumn(label: Text('Name')),
              DataColumn(label: Text('Contact')),
              DataColumn(label: Text('Group')),
              DataColumn(label: Text('Department')),
              DataColumn(label: Text('Session')),
              DataColumn(label: Text('Date Added')),
            ],
            rows: employees.map((employee) {
              return DataRow(
                cells: [
                  DataCell(Text(employee.name)),
                  DataCell(Text(employee.contact)),
                  DataCell(
                    Container(
                      padding: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        color: getRandomColor(),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Text(
                        employee.group,
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  DataCell(Text(employee.department)),
                  DataCell(Text(employee.session)),
                  DataCell(Text(employee.dateAdded)),
                ],
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int index_ = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Pallete.primaryColor,
        leading: Image.asset('assets/bold/avatar.png'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.circle_notifications,
              color: Colors.red,
            ),
          ),
        ],
        title: const SearchBar1(
          hinttext: 'Search for groups, employees;settings;etc',
        ),
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children: [
              SideDrawerComponent(
                index: index_,
                onItemSelected: (v) {
                  index_ = v;
                  setState(() {});
                },
              ),
              const SizedBox(
                width: 30,
              ),
              Expanded(
                child: IndexedStack(
                  index: index_,
                  children: [
                    Text('Dashbboard'),
                    EmployeesScreen(),
                    Text('Settings'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
