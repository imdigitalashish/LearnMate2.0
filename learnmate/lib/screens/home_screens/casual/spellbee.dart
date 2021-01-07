import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:get/get.dart';

import 'package:shared_preferences/shared_preferences.dart';

class SpellBee extends StatefulWidget {
  @override
  _SpellBeeState createState() => _SpellBeeState();
}

class _SpellBeeState extends State<SpellBee> {
  bool canLogin = false;
  TextEditingController wordController = TextEditingController();

  List<String> words = List<String>();

  bool canPractice = false;

  _getWords() async {
    SharedPreferences shared = await SharedPreferences.getInstance();
    if (shared.getStringList("wordsList").toList().isNotEmpty) {
      words = shared.getStringList("wordsList");
      setState(() {
        canPractice = true;
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getWords();
  }

  _changeButton() {
    if (wordController.text.trim() != "") {
      setState(() {
        canLogin = true;
      });
    } else {
      setState(() {
        canLogin = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Center(
                child: Text("Spell Bee",
                    style:
                        TextStyle(fontSize: 32, fontWeight: FontWeight.w400)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: wordController,
                      decoration: InputDecoration(
                        labelText: "Add A Word",
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.teal),
                        ),
                      ),
                      onChanged: (text) => _changeButton(),
                    ),
                  ),
                  RaisedButton(
                    child: Text("Add"),
                    onPressed: canLogin
                        ? () async {
                            words.add(wordController.text.toLowerCase());
                            print(words);
                            SharedPreferences shared =
                                await SharedPreferences.getInstance();
                            shared.setStringList("wordsList", words);
                            _getWords();
                            wordController.clear();
                          }
                        : null,
                    color: Colors.purple,
                    textColor: Colors.white,
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(18.0),
              child: RaisedButton(
                child: Text("Practice"),
                onPressed: canPractice
                    ? () => Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (_) => PracticeScreenSpellBee()))
                    : null,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class PracticeScreenSpellBee extends StatefulWidget {
  @override
  _PracticeScreenSpellBeeState createState() => _PracticeScreenSpellBeeState();
}

class _PracticeScreenSpellBeeState extends State<PracticeScreenSpellBee> {
  List<String> wordsList = List<String>();
  int position = 0;

  var ttsState;
  String text = "";

  int score = 0;
  bool canDelete = false;
  bool canNext = false;

  _getWordsList() async {
    SharedPreferences shared = await SharedPreferences.getInstance();
    if (shared.getStringList("wordsList").toList().isNotEmpty) {
      wordsList = shared.getStringList("wordsList");
      setState(() {
        text = wordsList[position];
      });
    }
  }

  bool canLogin = false;
  TextEditingController wordController = TextEditingController();

  List<String> words = List<String>();

  bool canPractice = false;
  bool canScoreChange = true;


  _validateAnswer() {
    if (wordController.text.toLowerCase() == text) {
      _speakHello("Wow.. Its Correct !.. Well Done");

      setState(() {
        if (canScoreChange) {
          score++;
          canScoreChange = false;
        }
        canDelete = true;
        canNext = true;
      });
    } else {
      _speakHello("Oh No.. Its Wrong.. try Again");

      setState(() {
        canDelete = true;
        canNext = true;
      });
    }
  }

  _changeButton() {
    if (wordController.text.trim() != "") {
      setState(() {
        canLogin = true;
      });
    } else {
      setState(() {
        canLogin = false;
      });
    }
  }

  FlutterTts flutterTts = FlutterTts();

  _speakHello(text) async {
    await flutterTts.setLanguage("hi");

    await flutterTts.speak(text);

  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _getWordsList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                  child: Text("Score: $score",
                      style: TextStyle(
                        fontSize: 32,
                      ))),
            ),
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(18),
              child: RaisedButton(
                child: Text("Speak", style: TextStyle(color: Colors.white)),
                color: Colors.red[200],
                onPressed: () => _speakHello(text),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: wordController,
                      decoration: InputDecoration(
                        labelText: "Enter the work by hearing",
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.teal),
                        ),
                      ),
                      onChanged: (text) => _changeButton(),
                    ),
                  ),
                  RaisedButton(
                    child: Text("Check"),
                    onPressed: canLogin ? () => _validateAnswer() : null,
                    color: Colors.purple,
                    textColor: Colors.white,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Row(children: [
                Expanded(
                  child: RaisedButton(
                      child: Text("DELETE THIS WORD",
                          style: TextStyle(color: Colors.white)),
                      onPressed: canDelete
                          ? () async {
                              try {
                                canScoreChange = true;

                                wordsList.removeAt(position);
                                SharedPreferences shared =
                                    await SharedPreferences.getInstance();
                                shared.setStringList("wordsList", wordsList);
                                _getWordsList();
                              } catch (e) {
                                Navigator.pop(context);
                              }
                            }
                          : null,
                      color: Colors.red),
                ),
                Expanded(
                  child: RaisedButton(
                      child:
                          Text("Next", style: TextStyle(color: Colors.white)),
                      onPressed: canNext
                          ? () async {
                        canScoreChange = true;

                        int currentPos = position + 1;
                              try {
                                if (currentPos != wordsList.length) {
                                  position++;
                                  setState(() {
                                    text = wordsList[position];
                                    wordController.clear();
                                    canDelete = false;
                                    canNext = false;
                                  });
                                } else {
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
                                      "You are at end of the words",
                                      style: TextStyle(fontSize: 25),
                                    ),
                                  );
                                }
                              } catch (e) {}
                            }
                          : null,
                      color: Colors.blue),
                )
              ]),
            )
          ],
        ),
      ),
    );
  }
}
