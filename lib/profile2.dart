import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:smart_bin/map.dart';
void userProfile() => runApp(const Profile());

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MediaQuery(
        data: const MediaQueryData(),
        child: Scaffold(
          backgroundColor: Colors.grey, //change here
          appBar: AppBar(
            leading:  IconButton(onPressed: (){  map_run();}, icon: const Icon(Icons.arrow_back)),
            backgroundColor: Colors.black,
            actions: [
              IconButton(onPressed: (){}, icon: const Icon(Icons.settings)),
            ],
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Padding(
                          padding:  EdgeInsets.fromLTRB(20, 30, 0, 0),
                          child: CircleAvatar(
                            radius: 40,
                            backgroundImage: AssetImage('assets/profile.jpg'),
                          ),
                        ),
                        const SizedBox(width: 20),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                           const Text(
                              'John Doe',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.0,
                              ),
                            ),
                            const SizedBox(height: 5),
                            const Text(
                              'Level 4',
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 16.0,
                              ),
                            ),
                            const SizedBox(height: 5),
                              SizedBox(
                              width: 200, // Set the desired width here
                              child: LinearProgressIndicator(
                                value: 0.5,
                                 backgroundColor: Colors.grey[300],
                                  valueColor: const AlwaysStoppedAnimation<Color>(Color(0xffE6EA35)),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: Text(
                            'This Month Earned',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18.0,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 16.0),
                          child: Image.asset(
                            'assets/google.png',
                            width: 35,
                            height: 40,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
            const SizedBox(
              height: 50,
            ),
            const Text(
              "Leaderboard",
              style: TextStyle(fontSize: 20),
            ),
            Container(
              color: Colors.black,
              margin: const EdgeInsets.all(20),
              child: SizedBox(
                height: 300,
                child: ListView.separated(
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Row(
                          children: const [
                            CircleAvatar(
                              backgroundImage: NetworkImage(
                                  "https://images.unsplash.com/photo-1522075469751-3a6694fb2f61?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=580&q=80"),
                            ),
                            SizedBox(
                              width: 3,
                            ),
                            Text("David Sawyers", style: TextStyle(color: Colors.white),)
                          ],
                        ),
                        leading: Text("#${index + 1}" ,style: const TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),
                        trailing: Text(
                            (400 / (index + 1)).toString().substring(0, 3),style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
                      );
                    },
                    separatorBuilder: (context, index) => const Divider(thickness: 1,color: Colors.grey,indent: 10,endIndent: 10,),
                    itemCount: 12),
              ),
            )
          ],
        ),
      ),
    )
    )
    );
  }
}