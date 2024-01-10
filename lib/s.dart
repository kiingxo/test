// class MyHomePage extends StatefulWidget {
//   const MyHomePage({Key? key}) : super(key: key);

//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage>
//     with SingleTickerProviderStateMixin {
//   late TabController _tabController;
//   List<Employee> employees = [];

//   @override
//   void initState() {
//     super.initState();
//     _tabController = TabController(length: 2, vsync: this);
//     loadEmployeeData();
//   }

//   Future<void> loadEmployeeData() async {
//     final String data = await DefaultAssetBundle.of(context)
//         .loadString('assets/employees.json');
//     final List<dynamic> jsonList = json.decode(data);

//     setState(() {
//       employees = jsonList
//           .map((json) => Employee.fromJson(json))
//           .toList()
//           .cast<Employee>();
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Pallete.primaryColor,
//         leading: CircleAvatar(backgroundColor: Pallete.avatarColor),
//         actions: [
//           IconButton(
//             onPressed: () {},
//             icon: const Icon(
//               Icons.circle_notifications,
//               color: Colors.red,
//             ),
//           ),
//         ],
//         title: const SearchBar1(
//           hinttext: 'Search for groups, employees;settings;etc',
//         ),
//       ),
//       body: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: <Widget>[
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Align(
//               alignment: Alignment.centerLeft,
//               child: Text(
//                 'Employee (${employees.length})',
//                 style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//               ),
//             ),
//           ),
//           Expanded(
//             child: Row(
//               children: <Widget>[
//                 Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Container(
//                     decoration: BoxDecoration(
//                       border: Border.all(color: Colors.black),
//                       borderRadius: BorderRadius.circular(12.0),
//                     ),
//                     child: DataTable(
//                         // ... (DataTable contents)
//                         ),
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Container(
//                     decoration: BoxDecoration(
//                       border: Border.all(color: Colors.black),
//                       borderRadius: BorderRadius.circular(12.0),
//                     ),
//                     child: Drawer(
//                       width: 200,
//                       elevation: 0,
//                       child: ListView(
//                         padding: EdgeInsets.zero,
//                         children: <Widget>[
//                           // ... (Drawer contents)
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//       bottomNavigationBar: TabBar(
//         controller: _tabController,
//         tabs: [
//           Tab(text: 'Tab 1'),
//           Tab(text: 'Tab 2'),
//         ],
//         labelColor: Colors.blue,
//       ),
//     );
//   }
// }
