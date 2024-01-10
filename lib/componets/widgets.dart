import 'package:flutter/material.dart';
import 'package:interview/add_employee.dart';

import 'package:interview/componets/searchbar.dart';
import 'package:interview/constants/appconst.dart';
import 'package:interview/screens/dashboard_page.dart';

Widget buildEmployeeDataTable() {
  return Column(
    children: [
      Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Column(
            children: [
              Text(
                'Employee (${employees.length})',
                style:
                    const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 30,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'View and Manage the Employees in your organization',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(),
                  Row(
                    children: [
                      Text("Filter"),
                      Text("Filter"),
                      AddButtonn(hint: "Add Employee"),
                    ],
                  )
                ],
              ),
            ],
          )),
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
    title: const SearchBar1(
      hinttext: 'Search for groups, employees;settings;etc',
    ),
  );
}
