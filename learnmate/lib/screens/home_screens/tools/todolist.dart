import 'package:flutter/material.dart';

class TodoList extends StatefulWidget {
  @override
  _TodoListState createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {

  final double heightOfCard = 0.2;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('49715760 Stackoverflow'),
      ),
      body: new Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          new Expanded(
            child: ListView(
              children: [
                Container(
                  height: MediaQuery.of(context).size.width * heightOfCard,
                  child: Card(
                    child: Text("My Item")
                  )
                )
              ]
            ),
          ),
          new Container(
            color: Colors.white,
            padding: new EdgeInsets.all(10.0),
            child: new TextField(
              decoration: new InputDecoration(
                hintText: 'Chat message',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
