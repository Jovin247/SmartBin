import 'package:flutter/material.dart';
import 'package:myapp/map.dart';

// ignore: non_constant_identifier_names
void sign_up() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // static const String _title = 'Sample App';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      // title: _title,
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
      appBar: AppBar(
        title: const Text('SmartBin'),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical:50),
        child: Padding(
            padding: const EdgeInsets.all(10),
            child: ListView(
              children: <Widget>[
                Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(10),
                    child: const Text(
                      'Sign Up',
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.blue,
                      ),
                    )),
                Container(
                  padding: const EdgeInsets.all(10),
                  child: TextField(
                    controller: nameController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'User Name',
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                  child: TextField(
                    obscureText: true,
                    controller: passwordController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Password',
                    ),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 300,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromARGB(255, 6, 160, 9),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                          minimumSize: const Size(double.infinity, 45),
                        ),
                        onPressed: () {
                          map_run();
                        },
                        child: const Text('Create Account',
                        style: TextStyle(fontSize: 18),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      width: 300,
                      child: ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.blue,
                          backgroundColor: Colors.white,
                          padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          minimumSize: const Size(double.infinity, 45),
                        ),
                        onPressed: () {
                          // Do something when the button is pressed
                        },
                        icon: Image.asset(
                          'assets/google.png',
                          width: 30,
                          height: 30,
                        ),
                        label: const Text(
                          'Sign up using Google',
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            )),
      )
    );
  }
}
