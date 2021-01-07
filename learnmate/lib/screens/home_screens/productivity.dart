import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:learnmate/screens/home_screens/productivity/flashcards.dart';
import 'package:learnmate/screens/home_screens/productivity/imageRecognition.dart';
import 'package:learnmate/screens/home_screens/productivity/mathsquiz.dart';
import 'package:learnmate/screens/home_screens/productivity/weeklyPlanner.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProductivityScreen extends StatefulWidget {
  @override
  _ProductivityScreenState createState() => _ProductivityScreenState();
}

class _ProductivityScreenState extends State<ProductivityScreen> {

  Color themeColor = Colors.lightBlueAccent;
  final double boxSize = 0.55;

  String phone;


  _getStatus() async {
    SharedPreferences shared = await SharedPreferences.getInstance();
    phone = shared.getString("phone_number");
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getStatus();
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
                "Productivity Tools",
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
                            builder: (_) => FlashCards())),
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
                                          "assets/productivity_cards.png"),
                                    ),
                                    SizedBox(height: 15),
                                    Text(
                                      "Flash Cards",
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
                        builder: (_) => MathsHomeScreen(),
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
                                    Icon(
                                      Icons.architecture,
                                      color: Colors.white,
                                      size: MediaQuery.of(context).size.width *
                                      0.3,
                                    ),
                                    SizedBox(height: 15),
                                    Text(
                                      "Maths Quiz",
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
                            builder: (_) => WeeklyPlanner(phone: phone))),
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
                                    Icon(
                                      Icons.event,
                                      size: MediaQuery.of(context).size.width *
                                          0.3,
                                      color: Colors.white,
                                    ),
                                    SizedBox(height: 15),
                                    Text(
                                      "Weekly Planner",
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
                        builder: (_) => WhatIsIt(),
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
                                    Icon(
                                      Icons.camera,
                                      size: MediaQuery.of(context).size.width *
                                          0.3,
                                      color:Colors.white,
                                    ),
                                    SizedBox(height: 15),
                                    Text(
                                      "Text Recogniser",
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


class MathsHomeScreen extends StatefulWidget {
  @override
  _MathsHomeScreenState createState() => _MathsHomeScreenState();
}

class _MathsHomeScreenState extends State<MathsHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 12.0, right: 12.0, top: 26),
              child: InkWell(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => DifficultyForAddition(),
                  ),
                ),
                child: Card(
                  elevation: 20,
                  color: Colors.blue,
                  child: Container(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.width * 0.05,
                        bottom: MediaQuery.of(context).size.width * 0.05,
                        left: MediaQuery.of(context).size.width * 0.10),
                    child: Row(
                      children: [
                        Icon(
                          Icons.add,
                          size: MediaQuery.of(context).size.width * 0.20,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.10,
                        ),
                        Text(
                          "Addition",
                          style: TextStyle(
                            fontSize: 32,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 12.0, right: 12.0, top: 26),
              child: InkWell(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => DifficultyForSubstraction(),
                  ),
                ),
                child: Card(
                  elevation: 20,
                  color: Colors.blue,
                  child: Container(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.width * 0.05,
                        bottom: MediaQuery.of(context).size.width * 0.05,
                        left: MediaQuery.of(context).size.width * 0.10),
                    child: Row(
                      children: [
                        Icon(
                          Icons.remove,
                          size: MediaQuery.of(context).size.width * 0.20,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.10,
                        ),
                        Text(
                          "Subtraction",
                          style: TextStyle(
                            fontSize: 32,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 12.0, right: 12.0, top: 26),
              child: InkWell(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => DifficultyForMulti(),
                    ),
                  ),
                child: Card(
                  elevation: 20,
                  color: Colors.blue,
                  child: Container(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.width * 0.05,
                        bottom: MediaQuery.of(context).size.width * 0.05,
                        left: MediaQuery.of(context).size.width * 0.10),
                    child: Row(
                      children: [
                        Icon(
                          Icons.clear,
                          size: MediaQuery.of(context).size.width * 0.20,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.10,
                        ),
                        Text(
                          "Multiplication",
                          style: TextStyle(
                            fontSize: 32,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
