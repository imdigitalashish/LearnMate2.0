import 'package:flutter/material.dart';
import 'package:learnmate/screens/home_screens/casual/spellbee.dart';
import 'package:learnmate/screens/home_screens/casual/tictactoe.dart';

class CasualMainScreen extends StatefulWidget {
  @override
  _CasualMainScreenState createState() => _CasualMainScreenState();
}

class _CasualMainScreenState extends State<CasualMainScreen> {


  Color themeColor = Colors.red[200];
  final double boxSize = 0.55;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Center(
              child: Text(
                "Casual",
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
                            builder: (_) => TicTacToeScreen())),
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
                                          "assets/tictactoe.png"),
                                    ),
                                    SizedBox(height: 15),
                                    Text(
                                      "Tic Tac Toe",
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
                        builder: (_) => SpellBee(),
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
                                    Image(
                                      width: MediaQuery.of(context).size.width *
                                          0.3,
                                      image: AssetImage(
                                          "assets/bee.png"),
                                    ),
                                    SizedBox(height: 15),
                                    Text(
                                      "Spell Bee",
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
