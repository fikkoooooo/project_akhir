import 'package:flutter/material.dart';

class Bentuk extends StatefulWidget {
  const Bentuk({super.key, required this.image, required this.name});
  final String image;
  final String name;

  @override
  State<Bentuk> createState() => _BentukState();
}

class _BentukState extends State<Bentuk> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
