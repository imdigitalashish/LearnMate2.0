import 'package:flutter/material.dart';
import 'package:dio/dio.dart' as dio;
import 'package:get/get.dart';
import 'package:learnmate/export_url.dart';
import 'package:learnmate/models/Todo.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WeeklyPlanner extends StatefulWidget {
  final String phone;

  const WeeklyPlanner({Key key, this.phone}) : super(key: key);

  @override
  _WeeklyPlannerState createState() => _WeeklyPlannerState();
}

class _WeeklyPlannerState extends State<WeeklyPlanner> {
  String week = "Monday";
  final double heightOfCard = 0.2;

  List<Todo> listOftodo = [];
  bool canLogin = false;
  TextEditingController todoController = TextEditingController();

  _changeButton() {
    if (todoController.text.trim() != "") {
      setState(() {
        canLogin = true;
      });
    } else {
      setState(() {
        canLogin = false;
      });
    }
  }

  _addTodoList() async {
    try {
      dio.Response response = await dio.Dio().post(server_url +
          "addWeek?phone_number=${widget.phone}&todo=${todoController.text}&week=$week");
      if (response.statusCode == 200) {
        todoController.text = "";
        _getDataOfWeek();
      }
    } catch (e) {
      Get.snackbar(
        "Failed",
        "User Already Exists with That Phone Number",
        snackPosition: SnackPosition.TOP,
        maxWidth: 400,
        duration: Duration(seconds: 5),
        titleText: Text(
          "Try Again",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        messageText: Text(
          "Make Sure your internet connection is available",
          style: TextStyle(fontSize: 25),
        ),
      );
    }
  }

  _getDataOfWeek() async {
    try {
      print(week);
      dio.Response<List<dynamic>> response = await dio.Dio()
          .post<List<dynamic>>(
              server_url + "getWeek?phone_number=${widget.phone}&week=$week");
      print(response.data.toList());
      setState(() {
        listOftodo =
            response.data.toList().map((e) => Todo.fromJson(e)).toList();
        if (listOftodo.isEmpty) {
          stateOfScreen = 2;
        } else {
          stateOfScreen = 1;
        }
      });
    } catch (e) {
      print(e);
      setState(() {
        stateOfScreen = 3;
      });
    }
  }

  int stateOfScreen = 0;

  Widget getListstoWidgets() {
    List<Widget> widgetsOfTodo = [];
    for (int i = 0; i < listOftodo.length; i++) {
      widgetsOfTodo.add(
        Dismissible(
          key: Key(listOftodo[i].item),
          direction: DismissDirection.startToEnd,
          onDismissed: (d) async {
            try {
              dio.Response response = await dio.Dio()
                  .post(server_url + "deleteWeek?pk=${listOftodo[i].id}");
              listOftodo.removeAt(i);
              if (listOftodo.isEmpty) {
                setState(() {
                  stateOfScreen = 2;
                });
              }
            } catch (e) {
              Get.snackbar(
                "Failed",
                "User Already Exists with That Phone Number",
                snackPosition: SnackPosition.TOP,
                maxWidth: 400,
                duration: Duration(seconds: 5),
                titleText: Text(
                  "Try Again",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                messageText: Text(
                  "Make Sure your internet connection is available",
                  style: TextStyle(fontSize: 25),
                ),
              );
            }
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.width * heightOfCard,
              child: Card(
                elevation: 10,
                child: Center(
                  child: Text(
                    listOftodo[i].item,
                    style: TextStyle(
                        fontSize: MediaQuery.of(context).size.width * 0.05),
                  ),
                ),
              ),
            ),
          ),
        ),
      );
    }
    return new ListView(children: widgetsOfTodo);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getDataOfWeek();
  }

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
                      print(text);
                      week = text;
                      print(week);
                      _getDataOfWeek();
                    });
                  },
                  hint: Text("$week")),
            ),
            Expanded(child: getListstoWidgets()),
            new Container(
              color: Colors.white,
              padding: new EdgeInsets.all(10.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: todoController,
                      decoration: InputDecoration(
                        labelText: "Todo",
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.teal),
                        ),
                      ),
                      onChanged: (text) => _changeButton(),
                    ),
                  ),
                  RaisedButton(
                    child: Text("Add"),
                    onPressed: canLogin ? () => _addTodoList() : null,
                    color: Colors.purple,
                    textColor: Colors.white,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
