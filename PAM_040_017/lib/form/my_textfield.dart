import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool obscureText;

  const MyTextField({
    Key? key,
    required this.controller,
    required this.hintText,
    required this.obscureText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Icon prefixIcon;
    if (hintText == 'Nama pengguna') {
      prefixIcon = Icon(Icons.person);
    } else if (hintText == 'Kata sandi') {
      prefixIcon = Icon(Icons.lock);
    } else {
      prefixIcon = Icon(Icons.person);
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.5),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade400),
          ),
          fillColor: Colors.grey.shade200,
          filled: true,
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.grey[500]),
          prefixIcon: prefixIcon,
        ),
      ),
    );
  }
}
