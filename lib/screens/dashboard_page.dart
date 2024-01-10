import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:interview/componets/widgets.dart';
import 'package:interview/componets/side_drawer_component.dart';
import 'package:interview/models/employee.dart';

List<Employee> employees = [];

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int index_ = 0;

  @override
  void initState() {
    super.initState();

    loadEmployeeData();
  }

  Future<void> loadEmployeeData() async {
    final String data = await DefaultAssetBundle.of(context)
        .loadString('assets/employees.json');
    final List<dynamic> jsonList = json.decode(data);

    setState(() {
      employees = jsonList
          .map((json) => Employee.fromJson(json))
          .toList()
          .cast<Employee>();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildAppBar(),
      body: SafeArea(
        child: Row(
          children: [
            SideDrawerComponent(
              index: index_,
              onItemSelected: (v) {
                index_ = v;
                setState(() {});
              },
            ),
            Expanded(
              child: IndexedStack(
                index: index_,
                children: [
                  Text('blank screen'),
                  buildEmployeeDataTable(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
