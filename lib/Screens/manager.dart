import 'package:flutter/material.dart';

class manager extends StatefulWidget {
  const manager({Key? key}) : super(key: key);

  @override
  State<manager> createState() => _managerState();
}

class _managerState extends State<manager> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text("manager"),
    );
  }
}
