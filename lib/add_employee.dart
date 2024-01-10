import 'package:flutter/material.dart';

class AddButtonn extends StatelessWidget {
  final String hint;
  const AddButtonn({super.key, required this.hint});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
        onPressed: () {
          print("test");
        },
        icon: IconButton(
          onPressed: null,
          icon: Icon(Icons.add),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
            minimumSize: const Size(double.infinity, 30),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18),
            ),
          ),
        ),
        label: Text(
          hint,
          style: const TextStyle(fontSize: 10),
        ));
  }
}
