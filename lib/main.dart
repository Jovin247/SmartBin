import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:smart_bin/Login.dart';
import 'package:smart_bin/map.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MaterialApp(
            debugShowCheckedModeBanner: false,
            home: SmartBin(),));
}

class SmartBin extends StatelessWidget {
  const SmartBin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const MaterialApp(
            home: CircularProgressIndicator());
        } else {
          if (snapshot.hasData) {
            return const MaterialApp(

              home: Map());
          } else {
            return const MaterialApp(

              home: login());
          }
        }
      },
    );
  }
}
