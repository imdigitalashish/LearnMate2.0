import 'package:flutter/material.dart';
import 'package:translator/translator.dart';

class HindiMainPage extends StatefulWidget {
  @override
  _HindiMainPageState createState() => _HindiMainPageState();
}

class _HindiMainPageState extends State<HindiMainPage> {
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
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => TranslationHindi(),
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
                        Icon(
                          Icons.translate,
                          size: MediaQuery.of(context).size.width * 0.20,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.10,
                        ),
                        Text(
                          "Translate",
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
                        Icon(
                          Icons.article,
                          size: MediaQuery.of(context).size.width * 0.20,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.10,
                        ),
                        Text(
                          "Grammer",
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
          ],
        ),
      ),
    );
  }
}

class TranslationHindi extends StatefulWidget {
  @override
  _TranslationHindiState createState() => _TranslationHindiState();
}

class _TranslationHindiState extends State<TranslationHindi> {
  TextEditingController translateText = TextEditingController();
  String data = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Translation",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 32,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(12),
              height: 10 * 24.0,
              child: TextField(
                controller: translateText,
                maxLines: 10,
                decoration: InputDecoration(
                  hintText: "Enter a message",
                  fillColor: Colors.grey[300],
                  filled: true,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RaisedButton(
                  child: Text("Translate"),
                  color: Colors.purple[300],
                  textColor: Colors.white,
                  onPressed: () async {
                    final translator = GoogleTranslator();
                    final text = await translator.translate(translateText.text,
                        to: 'hi');
                    setState(() {
                      data = text.toString();
                    });
                  },
                ),
                RaisedButton(
                  child: Text("Clear"),
                  color: Colors.red,
                  textColor: Colors.white,
                  onPressed: () {
                    setState(() {
                      this.translateText.text = "";
                    });
                  },
                ),
              ],
            ),
            Expanded(
              flex: 1,
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    data,
                    style: TextStyle(
                      fontSize: 17,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
