import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:interview/features/employees/data/models/employee.dart';

Widget _titleSection(int employeeCount) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        'Employee ($employeeCount)',
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
              Text(
                'View and manage employees in your organization',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
          Wrap(
            direction: Axis.horizontal,
            children: [
              const Text(
                'Filter',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.blue,
                ),
              ),
              const SizedBox(width: 20),

              //add employee button
              ElevatedButton(
                onPressed: () {},
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(Icons.add, color: Colors.white),
                      Text(
                        "Add Employee",
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18),
                  ),
                ),
              )
            ],
          )
        ],
      )
    ],
  );
}

Widget _content(
    List<Employee> employees, Set<Employee> selectedEmployees, WidgetRef ref) {
  return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
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
      ));
}
