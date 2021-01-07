import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';


class DifficultyForAddition extends StatefulWidget {
  @override
  _DifficultyForAdditionState createState() => _DifficultyForAdditionState();
}

class _DifficultyForAdditionState extends State<DifficultyForAddition> {
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
                onTap: () => Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (_) => AdditionQuiz(maxInt: 12,timer: 10, level: "Easy",),
                  ),
                ),
                child: Card(
                  elevation: 20,
                  color: Colors.blue,
                  child: Container(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.width * 0.05,
                        bottom: MediaQuery.of(context).size.width * 0.05,
                    ),
                    child: Center(
                      child: Text(
                        "Easy",
                        style: TextStyle(
                          fontSize: 32,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 12.0, right: 12.0, top: 26),
              child: InkWell(
                onTap: () => Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (_) => AdditionQuiz(maxInt: 40,timer: 16, level: "Medium",),
                  ),
                ),
                child: Card(
                  elevation: 20,
                  color: Colors.blue,
                  child: Container(
                    padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.width * 0.05,
                      bottom: MediaQuery.of(context).size.width * 0.05,
                    ),
                    child: Center(
                      child: Text(
                        "Medium",
                        style: TextStyle(
                          fontSize: 32,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 12.0, right: 12.0, top: 26),
              child: InkWell(
                onTap: () => Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (_) => AdditionQuiz(maxInt: 120,timer: 23, level: "Hard",),
                  ),
                ),
                child: Card(
                  elevation: 20,
                  color: Colors.blue,
                  child: Container(
                    padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.width * 0.05,
                      bottom: MediaQuery.of(context).size.width * 0.05,
                    ),
                    child: Center(
                      child: Text(
                        "Hard",
                        style: TextStyle(
                          fontSize: 32,
                          color: Colors.white,
                        ),
                      ),
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



class AdditionQuiz extends StatefulWidget {
  final int maxInt;
  final int timer;
  final String level;

  const AdditionQuiz({Key key, this.maxInt, this.timer, this.level}) : super(key: key);

  @override
  _AddtionQuizState createState() => _AddtionQuizState();
}

class _AddtionQuizState extends State<AdditionQuiz> {
  int number1;
  int number2;
  int result;

  TextEditingController answerController = TextEditingController();

  _chooseRandomNumber() {
    var rn = new Random();
    setState(() {
      number1 = rn.nextInt(widget.maxInt);
      number2 = rn.nextInt(widget.maxInt);
      result = number1 + number2;
    });

    print("$number1 + $number2 = $result");
  }

  Timer _timer;
  int _start;
  int _score = 0;

  void startTimer() {
    const oneSec = const Duration(seconds: 1);
    _timer = new Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_start == 0) {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (_) => GameOver(
                level: widget.level,
                game: "Addition",
                score: _score,
              ),
            ),
          );
        } else {
          setState(() {
            _start--;
          });
        }
      },
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _start = widget.timer;
    _chooseRandomNumber();
    startTimer();
  }

  validateAnswer() {
    if (int.parse(answerController.text.toString()) == result) {
      _chooseRandomNumber();
      _score++;
      _start = widget.timer;
      answerController.clear();

    } else {
      print("incorrect logic");
      answerController.clear();

    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: ListView(children: [
        Padding(
          padding: const EdgeInsets.only(left: 14.0, top: 14.0),
          child: Text("Timer: $_start", style: TextStyle(fontSize: 22)),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 14.0, top: 14.0),
          child: Text("Score: $_score", style: TextStyle(fontSize: 22)),
        ),
        Padding(
          padding: const EdgeInsets.all(28.0),
          child: Center(
            child: Text(
              "$number1 + $number2",
              style: TextStyle(fontSize: 56),
            ),
          ),
        ),
        Row(children: [
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                // focusNode: this.loginphoneFocusNode,
                controller: answerController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Enter your answer",
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.teal),
                  ),
                ),
                // onChanged: (text) => _signController(),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: RaisedButton(
              child: Text("Submit", style: TextStyle(color: Colors.white)),
              color: Colors.black,
              onPressed: () => validateAnswer(),
            ),
          ),
        ])
      ]),
    ));
  }
}


class DifficultyForSubstraction extends StatefulWidget {
  @override
  _DifficultyForSubtractionState createState() => _DifficultyForSubtractionState();
}

class _DifficultyForSubtractionState extends State<DifficultyForSubstraction> {
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
                onTap: () => Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (_) => SubstractionQuiz(maxInt: 12,timer: 10, level: "Easy",),
                  ),
                ),
                child: Card(
                  elevation: 20,
                  color: Colors.blue,
                  child: Container(
                    padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.width * 0.05,
                      bottom: MediaQuery.of(context).size.width * 0.05,
                    ),
                    child: Center(
                      child: Text(
                        "Easy",
                        style: TextStyle(
                          fontSize: 32,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 12.0, right: 12.0, top: 26),
              child: InkWell(
                onTap: () => Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (_) => SubstractionQuiz(maxInt: 40,timer: 16, level: "Medium",),
                  ),
                ),
                child: Card(
                  elevation: 20,
                  color: Colors.blue,
                  child: Container(
                    padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.width * 0.05,
                      bottom: MediaQuery.of(context).size.width * 0.05,
                    ),
                    child: Center(
                      child: Text(
                        "Medium",
                        style: TextStyle(
                          fontSize: 32,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 12.0, right: 12.0, top: 26),
              child: InkWell(
                onTap: () => Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (_) => SubstractionQuiz(maxInt: 120,timer: 23, level: "Hard",),
                  ),
                ),
                child: Card(
                  elevation: 20,
                  color: Colors.blue,
                  child: Container(
                    padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.width * 0.05,
                      bottom: MediaQuery.of(context).size.width * 0.05,
                    ),
                    child: Center(
                      child: Text(
                        "Hard",
                        style: TextStyle(
                          fontSize: 32,
                          color: Colors.white,
                        ),
                      ),
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



class SubstractionQuiz extends StatefulWidget {
  final int maxInt;
  final int timer;
  final String level;

  const SubstractionQuiz({Key key, this.maxInt, this.timer, this.level}) : super(key: key);

  @override
  _SubstractionQuizState createState() => _SubstractionQuizState();
}

class _SubstractionQuizState extends State<SubstractionQuiz> {
  int number1;
  int number2;
  int result;

  TextEditingController answerController = TextEditingController();

  _chooseRandomNumber() {
    var rn = new Random();
    setState(() {
      number1 = rn.nextInt(widget.maxInt);
      number2 = rn.nextInt(widget.maxInt-3);
      if (number2 > number1) {
        number2 = number1 - 2;
      }
      result = number1 - number2;
    });

    print("$number1 - $number2 = $result");
  }

  Timer _timer;
  int _start;
  int _score = 0;

  void startTimer() {
    const oneSec = const Duration(seconds: 1);
    _timer = new Timer.periodic(
      oneSec,
          (Timer timer) {
        if (_start == 0) {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (_) => GameOver(
                level: widget.level,
                game: "Subtraction",
                score: _score,
              ),
            ),
          );
        } else {
          setState(() {
            _start--;
          });
        }
      },
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _start = widget.timer;
    _chooseRandomNumber();
    startTimer();
  }

  validateAnswer() {
    if (int.parse(answerController.text.toString()) == result) {
      _chooseRandomNumber();
      _score++;
      _start = widget.timer;
      answerController.clear();

    } else {
      print("incorrect logic");
      answerController.clear();

    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: ListView(children: [
            Padding(
              padding: const EdgeInsets.only(left: 14.0, top: 14.0),
              child: Text("Timer: $_start", style: TextStyle(fontSize: 22)),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 14.0, top: 14.0),
              child: Text("Score: $_score", style: TextStyle(fontSize: 22)),
            ),
            Padding(
              padding: const EdgeInsets.all(28.0),
              child: Center(
                child: Text(
                  "$number1 - $number2",
                  style: TextStyle(fontSize: 56),
                ),
              ),
            ),
            Row(children: [
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    // focusNode: this.loginphoneFocusNode,
                    controller: answerController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: "Enter your answer",
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.teal),
                      ),
                    ),
                    // onChanged: (text) => _signController(),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: RaisedButton(
                  child: Text("Submit", style: TextStyle(color: Colors.white)),
                  color: Colors.black,
                  onPressed: () => validateAnswer(),
                ),
              ),
            ])
          ]),
        ));
  }
}





class DifficultyForMulti extends StatefulWidget {
  @override
  _DifficultyForMultiState createState() => _DifficultyForMultiState();
}

class _DifficultyForMultiState extends State<DifficultyForMulti> {
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
                onTap: () => Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (_) => MultiplicationQuiz(maxInt: 12,timer: 10, level: "Easy",),
                  ),
                ),
                child: Card(
                  elevation: 20,
                  color: Colors.blue,
                  child: Container(
                    padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.width * 0.05,
                      bottom: MediaQuery.of(context).size.width * 0.05,
                    ),
                    child: Center(
                      child: Text(
                        "Easy",
                        style: TextStyle(
                          fontSize: 32,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 12.0, right: 12.0, top: 26),
              child: InkWell(
                onTap: () => Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (_) => MultiplicationQuiz(maxInt: 40,timer: 16, level: "Medium",),
                  ),
                ),
                child: Card(
                  elevation: 20,
                  color: Colors.blue,
                  child: Container(
                    padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.width * 0.05,
                      bottom: MediaQuery.of(context).size.width * 0.05,
                    ),
                    child: Center(
                      child: Text(
                        "Medium",
                        style: TextStyle(
                          fontSize: 32,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 12.0, right: 12.0, top: 26),
              child: InkWell(
                onTap: () => Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (_) => MultiplicationQuiz(maxInt: 120,timer: 23, level: "Hard",),
                  ),
                ),
                child: Card(
                  elevation: 20,
                  color: Colors.blue,
                  child: Container(
                    padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.width * 0.05,
                      bottom: MediaQuery.of(context).size.width * 0.05,
                    ),
                    child: Center(
                      child: Text(
                        "Hard",
                        style: TextStyle(
                          fontSize: 32,
                          color: Colors.white,
                        ),
                      ),
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



class MultiplicationQuiz extends StatefulWidget {
  final int maxInt;
  final int timer;
  final String level;

  const MultiplicationQuiz({Key key, this.maxInt, this.timer, this.level}) : super(key: key);

  @override
  _MultiplicationQuizState createState() => _MultiplicationQuizState();
}

class _MultiplicationQuizState extends State<MultiplicationQuiz> {
  int number1;
  int number2;
  int result;

  TextEditingController answerController = TextEditingController();

  _chooseRandomNumber() {
    var rn = new Random();
    setState(() {
      number1 = rn.nextInt(widget.maxInt);
      number2 = rn.nextInt(widget.maxInt);
      result = number1 * number2;
    });

    print("$number1 * $number2 = $result");
  }

  Timer _timer;
  int _start;
  int _score = 0;

  void startTimer() {
    const oneSec = const Duration(seconds: 1);
    _timer = new Timer.periodic(
      oneSec,
          (Timer timer) {
        if (_start == 0) {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (_) => GameOver(
                level: widget.level,
                game: "Multiplication",
                score: _score,
              ),
            ),
          );
        } else {
          setState(() {
            _start--;
          });
        }
      },
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _start = widget.timer;
    _chooseRandomNumber();
    startTimer();
  }

  validateAnswer() {
    if (int.parse(answerController.text.toString()) == result) {
      _chooseRandomNumber();
      _score++;
      _start = widget.timer;
      answerController.clear();

    } else {
      print("incorrect logic");
      answerController.clear();

    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: ListView(children: [
            Padding(
              padding: const EdgeInsets.only(left: 14.0, top: 14.0),
              child: Text("Timer: $_start", style: TextStyle(fontSize: 22)),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 14.0, top: 14.0),
              child: Text("Score: $_score", style: TextStyle(fontSize: 22)),
            ),
            Padding(
              padding: const EdgeInsets.all(28.0),
              child: Center(
                child: Text(
                  "$number1 x $number2",
                  style: TextStyle(fontSize: 56),
                ),
              ),
            ),
            Row(children: [
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    // focusNode: this.loginphoneFocusNode,
                    controller: answerController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: "Enter your answer",
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.teal),
                      ),
                    ),
                    // onChanged: (text) => _signController(),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: RaisedButton(
                  child: Text("Submit", style: TextStyle(color: Colors.white)),
                  color: Colors.black,
                  onPressed: () => validateAnswer(),
                ),
              ),
            ])
          ]),
        ));
  }
}






class GameOver extends StatefulWidget {
  final String level;
  final String game;
  final int score;

  const GameOver({Key key, this.level, this.game, this.score})
      : super(key: key);

  @override
  _GameOverState createState() => _GameOverState();
}

class _GameOverState extends State<GameOver> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Text(
                "You have scored: ${widget.score} \n In ${widget.game} \n at ${widget.level} level", style: TextStyle(fontSize: 32),)));
  }
}
