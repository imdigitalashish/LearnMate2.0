import 'package:flutter/material.dart';
import 'package:learnmate/screens/home_screens/study/learnenglish.dart';
import 'package:learnmate/screens/home_screens/study/learnhindi.dart';
import 'package:learnmate/screens/home_screens/study/learnscience.dart';

class Student extends StatefulWidget {
  @override
  _StudentState createState() => _StudentState();
}

class _StudentState extends State<Student> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16.0, top: 23.0),
            child: Text(
              "Hello, What you want to learn today?",
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 12.0, right: 12.0, top: 26),
            child: InkWell(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => HindiMainPage(),
                ),
              ),
              child: Card(
                elevation: 20,
                color: Colors.orange[400],
                child: Container(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.width * 0.05,
                      bottom: MediaQuery.of(context).size.width * 0.05,
                      left: MediaQuery.of(context).size.width * 0.10),
                  child: Row(
                    children: [
                      Image(
                        image: AssetImage("assets/hindiicon.png"),
                        width: MediaQuery.of(context).size.width * 0.20,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.10,
                      ),
                      Text(
                        "Learn Hindi",
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
                  builder: (_) => EnglishMain(),
                ),
              ),
              child: Card(
                elevation: 20,
                color: Colors.orange[400],
                child: Container(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.width * 0.05,
                      bottom: MediaQuery.of(context).size.width * 0.05,
                      left: MediaQuery.of(context).size.width * 0.10),
                  child: Row(
                    children: [
                      Image(
                        image: AssetImage("assets/englishicon.png"),
                        width: MediaQuery.of(context).size.width * 0.17,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.10,
                      ),
                      Text(
                        "Learn English",
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
                  builder: (_) => LearnScienceMain(),
                ),
              ),
              child: Card(
                elevation: 20,
                color: Colors.orange[400],
                child: Container(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.width * 0.05,
                      bottom: MediaQuery.of(context).size.width * 0.05,
                      left: MediaQuery.of(context).size.width * 0.10),
                  child: Row(
                    children: [
                      Image(
                        image: AssetImage("assets/scienceicon.png"),
                        width: MediaQuery.of(context).size.width * 0.17,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.10,
                      ),
                      Text(
                        "Learn Science",
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
          )
        ],
      ),
    );
  }
}
