import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/snackbar/snack.dart';
import 'package:learnmate/screens/home_screens/study.dart';
import 'package:learnmate/screens/home_screens/tools.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;

  static List<Widget> _widgetOptions = <Widget>[
    Student(),
    ToolsScreen(),
  ];

  static List<Color> _colors = <Color>[
    Colors.orange[200],
    Colors.green,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: _widgetOptions.elementAt(_currentIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: _colors.elementAt(_currentIndex),
        items: [
          BottomNavigationBarItem(
            backgroundColor: Colors.orange[400],
            icon: Icon(Icons.book),
            label: "Study",

          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.green[400],
            icon: Icon(Icons.poll),
            label: "Tools",
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.red[400],
            icon: Icon(Icons.science),
            label: "Productivity",
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.black,
            icon: Icon(Icons.all_inclusive),
            label: "Casual",
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.black,
            icon: Icon(Icons.person),
            label: "Profile",
          ),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
