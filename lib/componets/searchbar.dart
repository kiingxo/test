import 'package:flutter/material.dart';

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
