import 'package:dio/dio.dart' as dio;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learnmate/export_url.dart';
import 'package:learnmate/models/Todo.dart';

class TodoList extends StatefulWidget {
  final String phone;

  const TodoList({Key key, this.phone}) : super(key: key);

  @override
  _TodoListState createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  final double heightOfCard = 0.2;
  TextEditingController todoController = TextEditingController();
  List<Todo> listOftodo = [];

  int stateOfScreen =
      0; // 0 -> No tried; 1 -> Have todoitems; 2 -> Don't have; 3 -> Internet Connection Error
  bool canLogin = false;

  _getTodoListData() async {
    try {
      dio.Response<List<dynamic>> response = await dio.Dio()
          .post<List<dynamic>>(
              server_url + "getTodos?phone_number=${widget.phone}");
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

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getTodoListData();
  }

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
                  .post(server_url + "deleteTodo?pk=${listOftodo[i].id}");
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
          "addTodo?phone_number=${widget.phone}&todo=${todoController.text.trim()}");
      if (response.statusCode == 200) {
        todoController.text = "";
        _getTodoListData();
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

  @override
  Widget build(BuildContext context) {
    print(stateOfScreen);
    if (stateOfScreen == 0) {
      return Scaffold(
        body: Center(
          child: Text(
            "Loading..",
            style: TextStyle(
              fontSize: 32,
            ),
          ),
        ),
      );
    } else if (stateOfScreen == 1) {
      return Scaffold(
        body: new Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            new Expanded(
              child: getListstoWidgets(),
            ),
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
      );
    } else if (stateOfScreen == 2) {
      return Scaffold(
        body: new Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            new Expanded(
              child: Center(
                child: Text(
                  "You Don't have any Todo",
                  style: TextStyle(
                    fontSize: 32,
                  ),
                ),
              ),
            ),
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
      );
    } else if (stateOfScreen == 3) {
      return Scaffold(
        body: Center(
          child: Text(
            "No Internet Connection",
            style: TextStyle(
              fontSize: 32,
            ),
          ),
        ),
      );
    }
  }
}
