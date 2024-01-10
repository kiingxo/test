import 'package:flutter/material.dart';
import 'package:interview/constants/appconst.dart';

class SignInButton extends StatelessWidget {
  final String hint;
  const SignInButton({super.key, required this.hint});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () {
        print("test");
      },
      icon: Icon(Icons.add),
      label: Text(
        hint,
        style: const TextStyle(fontSize: 18),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: Pallete.seecondaryColor,
        minimumSize: const Size(double.infinity, 50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }
}
