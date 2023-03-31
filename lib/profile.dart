import 'package:flutter/material.dart';
import 'package:smart_bin/map.dart';

// ignore: non_constant_identifier_names
void user_profile() => runApp(const Profile());

// ignore: camel_case_types
class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: MyStatefulWidget(),
      ),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

@override
Widget build(BuildContext context) {
  return Scaffold(
    backgroundColor: Colors.black,
    body: Container(
      padding: const EdgeInsets.symmetric(vertical:50),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: const [
              Padding(
                padding: EdgeInsets.fromLTRB(20, 30, 0, 0),
                child: Icon(Icons.person, color: Colors.white, size: 60,),
              ),
              SizedBox(width: 20),
              Text(
                'Profile',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
            ],
          ),
          ElevatedButton(
            onPressed: () {
              const MapScreen();
            },
            child: const Text('Back'),
          ),
        ],
      ),
    ),
  );
}}