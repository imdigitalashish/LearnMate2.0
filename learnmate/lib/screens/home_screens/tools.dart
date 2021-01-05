import 'package:flutter/material.dart';
import 'package:learnmate/screens/home_screens/tools/donateBooks.dart';
import 'package:learnmate/screens/home_screens/tools/getbooks.dart';
import 'package:learnmate/screens/home_screens/tools/textrecognition.dart';
import 'package:learnmate/screens/home_screens/tools/todolist.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ToolsScreen extends StatefulWidget {
  @override
  _ToolsScreenState createState() => _ToolsScreenState();
}

class _ToolsScreenState extends State<ToolsScreen> {
  final double boxSize = 0.55;
  final Color themeColor = Colors.green;
  String phoneNumber = "";

  _getUserData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      phoneNumber = sharedPreferences.getString("phone_number");
      print(phoneNumber);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getUserData();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Center(
              child: Text(
                "Choose a tool",
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => TodoList(phone: phoneNumber))),
                    child: Container(
                      height: MediaQuery.of(context).size.width * boxSize,
                      child: Card(
                        elevation: 20,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        color: themeColor,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Center(
                                child: Column(
                                  children: [
                                    Image(
                                      width: MediaQuery.of(context).size.width *
                                          0.3,
                                      image: AssetImage(
                                          "assets/tools_todolist.png"),
                                    ),
                                    SizedBox(height: 15),
                                    Text(
                                      "Todo List",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize:
                                            MediaQuery.of(context).size.width *
                                                0.05,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: InkWell(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => DonateBooks(),
                      ),
                    ),
                    child: Container(
                      height: MediaQuery.of(context).size.width * boxSize,
                      child: Card(
                        elevation: 20,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        color: themeColor,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Center(
                                child: Column(
                                  children: [
                                    Image(
                                      width: MediaQuery.of(context).size.width *
                                          0.3,
                                      image:
                                          AssetImage("assets/tools_donatebook.png"),
                                    ),
                                    SizedBox(height: 15),
                                    Text(
                                      "Donate Books",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize:
                                            MediaQuery.of(context).size.width *
                                                0.045,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => GetBooks(phone: phoneNumber,))),
                    child: Container(
                      height: MediaQuery.of(context).size.width * boxSize,
                      child: Card(
                        elevation: 20,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        color: themeColor,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Center(
                                child: Column(
                                  children: [
                                    Image(
                                      width: MediaQuery.of(context).size.width *
                                          0.34,
                                      image: AssetImage(
                                          "assets/tools_getbooks.png"),
                                    ),
                                    SizedBox(height: 15),
                                    Text(
                                      "Get Books",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize:
                                        MediaQuery.of(context).size.width *
                                            0.05,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: InkWell(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => FirebaseVIsionText(),
                      ),
                    ),
                    child: Container(
                      height: MediaQuery.of(context).size.width * boxSize,
                      child: Card(
                        elevation: 20,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        color: themeColor,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Center(
                                child: Column(
                                  children: [
                                    Image(
                                      width: MediaQuery.of(context).size.width *
                                          0.3,
                                      image:
                                      AssetImage("assets/tools_donatebook.png"),
                                    ),
                                    SizedBox(height: 15),
                                    Text(
                                      "Donate Books",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize:
                                        MediaQuery.of(context).size.width *
                                            0.045,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
