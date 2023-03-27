import 'package:flutter/material.dart';
import 'package:SmartBin/login.dart';

void main() {
  runApp(const Log_in());
}

class SmartBin extends StatelessWidget {
  const SmartBin({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'SmartBin',
      home: MyStatefulWidget(),
    );
  }
}