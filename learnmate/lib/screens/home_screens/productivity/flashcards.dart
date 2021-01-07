import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';

class FlashCards extends StatefulWidget {
  @override
  _FlashCardsState createState() => _FlashCardsState();
}

class _FlashCardsState extends State<FlashCards> {
  bool canPractice = false;
  bool canAdd = false;
  List<String> termCards = List<String>();
  List<String> valueCards = List<String>();

  TextEditingController termController = TextEditingController();
  TextEditingController valueController = TextEditingController();

  _getCards() async {
    SharedPreferences shared = await SharedPreferences.getInstance();

    if (shared.getStringList("termCards").toList().isNotEmpty) {
      termCards = shared.getStringList("termCards");
      valueCards = shared.getStringList("valueCards");
      // print(termCards);
      // print(valueCards);
      setState(() {
        canPractice = true;
      });
    }
  }

  _changeAddCardStatus() {
    if (termController.text.trim().length != 0 &&
        valueController.text.trim().length != 0) {
      setState(() {
        canAdd = true;
      });
    } else {
      setState(() {
        canAdd = false;
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getCards();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Your Card"),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              // focusNode: this.loginphoneFocusNode,
              controller: termController,
              decoration: InputDecoration(
                labelText: "Term eg. Cat",
                fillColor: Colors.grey[300],
                filled: true,
              ),
              onChanged: (text) => _changeAddCardStatus(),
            ),
          ),
          Container(
            margin: EdgeInsets.all(12),
            height: 10 * 24.0,
            child: TextField(
              controller: valueController,
              maxLines: 10,
              decoration: InputDecoration(
                hintText: "Value for the term eg: A Cat is an animal",
                fillColor: Colors.grey[300],
                filled: true,
              ),
              onChanged: (text) => _changeAddCardStatus(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(children: [
              Expanded(
                child: RaisedButton(
                  child: Text("Add this card"),
                  onPressed: canAdd
                      ? () async {
                          termCards.add(termController.text);
                          valueCards.add(valueController.text);
                          SharedPreferences shared =
                              await SharedPreferences.getInstance();
                          shared.setStringList("termCards", termCards);
                          shared.setStringList("valueCards", valueCards);
                          _getCards();
                          termController.clear();
                          valueController.clear();
                        }
                      : null,
                ),
              ),
              Expanded(
                child: RaisedButton(
                  child: Text("Practice"),
                  onPressed: canPractice
                      ? () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => FlashCardsState()));
                        }
                      : null,
                ),
              )
            ]),
          )
        ],
      ),
    );
  }
}

class FlashCardsState extends StatefulWidget {
  @override
  _FlashCardsStateState createState() => _FlashCardsStateState();
}

class _FlashCardsStateState extends State<FlashCardsState> {
  int position = 0;
  List<String> termCards = List<String>();
  List<String> valueCards = List<String>();

  TextEditingController termController = TextEditingController();
  TextEditingController valueController = TextEditingController();
  bool nextButton = false;

  String text = "";

  _getCards() async {
    SharedPreferences shared = await SharedPreferences.getInstance();

    print(termCards);
    print(shared.getStringList("termCards").toList().isNotEmpty);
    if (shared.getStringList("termCards").toList().isNotEmpty) {
      termCards = shared.getStringList("termCards");
      valueCards = shared.getStringList("valueCards");
      print(termCards);
      print(valueCards);
      setState(() {
        text = termCards[position];
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getCards();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(children: [
        InkWell(
          onTap: () {
            setState(() {
              text = valueCards[position];
            });
          },
          child: Container(
            padding: EdgeInsets.all(16),
            height: MediaQuery.of(context).size.width * 0.9,
            child: Card(
              elevation: 15,
              child: Center(
                child: SingleChildScrollView(
                    child: Text(text,
                        style: TextStyle(
                            fontSize:
                                MediaQuery.of(context).size.width * 0.07))),
              ),
            ),
          ),
        ),
        RaisedButton(
          child: Text("Next"),
          onPressed: () {
            int currentPos = position + 1;
            try {
              print(currentPos);
              print(termCards.length);
              print(currentPos == termCards.length);
              if (currentPos != termCards.length) {
                print("YOU CAN CHANGE POS");
                position++;
                setState(() {
                  text = termCards[position];
                });
              } else {
                print("YOU CAN'T CHANGE");
                Get.snackbar(
                  "Failed",
                  "There is no user with that phone number",
                  snackPosition: SnackPosition.TOP,
                  maxWidth: 400,
                  duration: Duration(seconds: 5),
                  titleText: Text(
                    "Message",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  messageText: Text(
                    "You are at end of the cards",
                    style: TextStyle(fontSize: 25),
                  ),
                );
              }
              // if (position++ > termCards.length - 1) {

              // } else {
              //   print("CHANGED");
              //   position++;

              // }
            } catch (e) {
              print(e.toString());
            }
          },
        ),
        RaisedButton(
          child: Text("Remove"),
          onPressed: () async {
            try {
              print(position);
              termCards.removeAt(position);
              valueCards.removeAt(position);

              SharedPreferences shared = await SharedPreferences.getInstance();
              shared.setStringList("termCards", termCards);
              shared.setStringList("valueCards", valueCards);
              _getCards();

              position = 0;
            } catch (e) {
              print(e.toString());
              Navigator.pop(context);
            }
          },
        ),
      ]),
    );
  }
}
