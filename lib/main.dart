import 'package:flutter/material.dart';
import 'package:smart_bin/login.dart';

void main() {
  runApp(const login());
}

class SmartBin extends StatelessWidget {
  const SmartBin({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'SmartBin',
      home: MyStatefulWidget(),
    );
  }
}