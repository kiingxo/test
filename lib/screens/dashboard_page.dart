import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:interview/componets/side_drawer_component.dart';
import 'package:interview/models/employee.dart';

void main() {
  runApp(
    ProviderScope(
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Interview",
      home: const DashboardPage(),
    );
  }
}

class EmployeeDataTable extends ConsumerWidget {
  final List<Employee> employees;

  const EmployeeDataTable(this.employees, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    return Container(
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
    );
  }
}

class DashboardPage extends ConsumerWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final employees = watch(employeeLoaderProvider);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildAppBar(),
      body: SafeArea(
        child: Row(
          children: [
            SideDrawerComponent(
              index: context.read(indexProvider),
              onItemSelected: (v) {
                context.read(indexProvider.notifier).setIndex(v);
              },
            ),
            Expanded(
              child: IndexedStack(
                index: context.read(indexProvider),
                children: [
                  Text('blank screen'),
                  EmployeeDataTable(employees),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class EmployeeLoaderNotifier
    extends Notifier<List<Employee>, AsyncValue<List<Employee>>> {
  EmployeeLoaderNotifier(ProviderReference ref) : super(ref);

  @override
  Future<List<Employee>> load() async {
    final String data = await DefaultAssetBundle.of(ref.read(context))
        .loadString('assets/employees.json');
    final List<dynamic> jsonList = json.decode(data);

    return jsonList
        .map((json) => Employee.fromJson(json))
        .toList()
        .cast<Employee>();
  }

  @override
  build() {
    // TODO: implement build
    throw UnimplementedError();
  }
}

final employeeLoaderProvider = EmployeeLoaderNotifier.autoDispose();
final indexProvider =
    StateNotifierProvider<IndexNotifier, int>((ref) => IndexNotifier());

class IndexNotifier extends StateNotifier<int> {
  IndexNotifier() : super(0);

  void setIndex(int index) {
    state = index;
  }
}

AppBar buildAppBar() {
  return AppBar(
    backgroundColor: Colors.blue, // Change the color accordingly
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

class SearchBar1 extends StatelessWidget {
  final String hinttext;

  const SearchBar1({required this.hinttext, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // Replace with your SearchBar implementation
      child: TextField(
        decoration: InputDecoration(
          hintText: hinttext,
          // Add additional styling as needed
        ),
      ),
    );
  }
}

class SideDrawerComponent extends StatelessWidget {
  final int index;
  final ValueChanged<int> onItemSelected;

  const SideDrawerComponent({
    required this.index,
    required this.onItemSelected,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 20,
      ),
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(
          top: BorderSide(
            color: Colors.grey,
          ),
          right: BorderSide(
            color: Colors.grey,
          ),
          bottom: BorderSide(
            color: Colors.grey,
          ),
        ),
      ),
      child: Column(
        children: [
          DrawerTileAtom(
            icon: Icons.menu,
            label: 'Dashboard',
            isSelected: index == 0,
            onTap: () => onItemSelected(0),
          ),
          const SizedBox(height: 10),
          DrawerTileAtom(
            icon: Icons.people,
            label: 'Employees',
            isSelected: index == 1,
            onTap: () => onItemSelected(1),
          ),
        ],
      ),
    );
  }
}

class DrawerTileAtom extends StatelessWidget {
  final bool isSelected;
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const DrawerTileAtom({
    required this.isSelected,
    required this.icon,
    required this.label,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: isSelected ? Colors.blue : Colors.white,
        ),
        child: Row(
          children: [
            Icon(
              icon,
              color: isSelected ? Colors.blueAccent : Colors.grey,
            ),
            const SizedBox(width: 13),
            Text(
              label,
              style: TextStyle(
                fontSize: isSelected ? 17 : 14,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              ),
            )
          ],
        ),
      ),
    );
  }
}
