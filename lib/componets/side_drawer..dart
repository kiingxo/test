// my_side_drawer.dart
import 'package:flutter/material.dart';

class MySideDrawer extends StatelessWidget {
  const MySideDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Drawer(
        width: 150,
        elevation: 0,
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const SizedBox(height: 40),
            buildDrawerItem("Dashboard"),
            const SizedBox(height: 40),
            buildDrawerItem("Employees"),
            const SizedBox(height: 150),
            Divider(
              color: Colors.grey,
            ),
            buildDrawerItem("Help & Support"),
            const SizedBox(height: 40),
            buildDrawerItem("Log out"),
          ],
        ),
      ),
    );
  }

  ListTile buildDrawerItem(String title) {
    return ListTile(
      title: Row(
        children: [
          Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
      onTap: () {
        // Handle onTap
      },
    );
  }
}
