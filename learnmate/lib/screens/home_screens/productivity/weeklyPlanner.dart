import 'package:flutter/material.dart';

class WeeklyPlanner extends StatefulWidget {
  @override
  _WeeklyPlannerState createState() => _WeeklyPlannerState();
}

class _WeeklyPlannerState extends State<WeeklyPlanner> {

  String week = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: Column(
      children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(18),
            child: DropdownButton<String>(
                isExpanded: true,

                items: <String>[
                'Monday',
                'Tuesday',
                'Wednesday',
                'Thursday',
                'Friday',
                'Saturday',
                'Sunday'
              ].map((String value) {
                return new DropdownMenuItem<String>(
                  value: value,
                  child: new Text(value),
                );
              }).toList(),
              onChanged: (text) {
                  setState(() {
                    week = text;
                  });
              },
              hint: Text("Hello")

            ),
          )
      ],
    ),
        ));
  }
}
