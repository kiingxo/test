import 'package:flutter/material.dart';
import 'package:interview/add_employee.dart';

import 'package:interview/constants/appconst.dart';
import 'package:interview/models/employee.dart';

List<Employee> employees = [];
Widget buildEmployeeDataTable() {
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(
              'Employee (${employees.length})',
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
                  // Large screen layout
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'View and Manage the Employees in your organization',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(width: 20),
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
                  // Small screen layout
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        'View and Manage the Employees in your organization',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
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
                DataCell(Text(employee.group)),
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

AppBar buildAppBar() {
  return AppBar(
    backgroundColor: Pallete.primaryColor,
    leading: Image.asset("assets/avatar.png"),
    actions: [
      IconButton(
        onPressed: () {},
        icon: const Icon(
          Icons.circle_notifications,
          color: Colors.red,
        ),
      ),
    ],
    title: SearchBar1(
      hinttext: 'Search for groups, employees;settings;etc',
    ),
  );
}

class SearchBar1 extends StatelessWidget {
  final String hinttext;
  final void Function(String)? done;
  final void Function()? onediting;
  final TextEditingController? controller;
  final void Function(String)? onchanged;

  const SearchBar1({
    Key? key,
    required this.hinttext,
    this.done,
    this.onchanged,
    this.controller,
    this.onediting,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(25, 0, 25, 0),
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.5,
        child: TextField(
          onEditingComplete: onediting,
          onSubmitted: done,
          onChanged: onchanged,
          controller: controller,
          decoration: InputDecoration(
            filled: true,
            fillColor: Color.fromARGB(171, 158, 158, 158),
            hintText: hinttext,
            hintStyle: const TextStyle(color: Colors.black),
            suffixIcon: const Icon(Icons.search),
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.horizontal(
                left: Radius.circular(20),
                right: Radius.circular(20),
              ),
              borderSide: BorderSide(color: Colors.black),
            ),
          ),
        ),
      ),
    );
  }
}
