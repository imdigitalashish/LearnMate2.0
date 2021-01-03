import 'package:flutter/material.dart';
import 'package:learnmate/screens/authenticate.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';

void main() {
  runApp(
    GetMaterialApp(
      home: MainApp(),
    ),
  );
}

class MainApp extends StatefulWidget {
  @override
  _MainAppState createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  int stateOfApp = 0;

  _getData() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    int state = preferences.getInt("state");
    print(state);
    if (state == null) {
      setState(() {
        stateOfApp = 1;
      });
    } else {
      setState(() {
        stateOfApp = 2;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _getData();
  }

  @override
  Widget build(BuildContext context) {
    if (stateOfApp == 0) {
      return Scaffold();
    } else if (stateOfApp == 1) {
      return Scaffold(
        body: Authentication(),
      );
    } else {
      return Scaffold(
        body: Text("Entered Home"),
      );
    }
  }
}

/*
Column(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.all(20),
                                    child: Column(
                                      children: [
                                        Text(
                                          "Sign Up",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 35,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 40,
                                        ),
                                        Text("Phone Number"),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        TextField(
                                          decoration: InputDecoration(
                                            labelText: "Enter your Phone",
                                            border: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.teal),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Text("Password"),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        TextField(
                                          obscureText: true,
                                          decoration: InputDecoration(
                                            labelText: "Enter your Password",
                                            border: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.teal),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Text("Username"),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        TextField(
                                          decoration: InputDecoration(
                                            labelText: "Enter your username",
                                            border: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.teal),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Text("Name"),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        TextField(
                                          decoration: InputDecoration(
                                            labelText: "Enter your Name",
                                            border: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.teal),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              );
                              */
