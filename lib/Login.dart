import 'package:flutter/material.dart';
import 'package:SmartBin/signup.dart';
import 'package:SmartBin/map.dart';
import 'package:SmartBin/qr.dart';

void main() => runApp(const Log_in());

// ignore: camel_case_types
class Log_in extends StatelessWidget {
  const Log_in({Key? key}) : super(key: key);

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
                      'Log In',
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
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: TextField(
                    obscureText: true,
                    controller: passwordController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Password',
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    //forgot password screen
                  },
                  child: const Text('Forgot Password',),
                ),
                Container(
                    height: 50,
                    padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: ElevatedButton(
                      child: const Text('Login'),
                      onPressed: () {
                        map_run();
                      },
                    )
                ),
                Row(
                  // ignore: sort_child_properties_last
                  children: <Widget>[
                    const Text('Does not have account?'),
                    TextButton(
                      child: const Text(
                        'Sign up',
                        style: TextStyle(fontSize: 20),
                      ),
                      onPressed: () {
                        //signup screen
                        sign_up();
                      },
                    )
                  ],
                  mainAxisAlignment: MainAxisAlignment.center,
                ),
                Container(
                    height: 45,
                    padding: const EdgeInsets.fromLTRB(100, 0, 100, 0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ), // Background color
                      ),
                      child: const Text(
                        'Log in using Google',
                        style: TextStyle(color: Colors.blue),
                      ),
                      onPressed: () {
                      },
                    )
                  ),
                Container(
                    height: 50,
                    padding: const EdgeInsets.fromLTRB(100, 10, 100, 0),
                    // padding: const EdgeInsets.fromLTRB(100, 0, 100, 0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white, // Background color
                      ),
                      child: const Text(
                          'Scan QR',
                        style: TextStyle(color: Colors.blue),
                      ),
                      onPressed: () async {
                          final result = await Navigator.push<String>(
                          context,
                          MaterialPageRoute(builder: (context) => const QRScreen()),
                        );
                      if (result != null) {
                        // Do something with the scan data
                        // ignore: avoid_print
                        print(result);
                      }
                        },
                    )
                ),
              ],
            )),
      )
    );
  }
}
