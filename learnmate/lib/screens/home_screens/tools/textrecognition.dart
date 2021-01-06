import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:dash_chat/dash_chat.dart';
import 'package:dio/dio.dart' as dio;
import 'package:image_picker/image_picker.dart';

class FirebaseVIsionText extends StatefulWidget {

  final String name;

  const FirebaseVIsionText({Key key, this.name}) : super(key: key);

  @override
  _FirebaseVIsionTextState createState() => _FirebaseVIsionTextState();
}

class _FirebaseVIsionTextState extends State<FirebaseVIsionText> {
  TextEditingController text = TextEditingController();
  ChatUser user = ChatUser();

  List<ChatMessage> conversation;



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    conversation = [
      ChatMessage(text: "Hello ${widget.name}, How are you... I am here to help you... tell me what should I tell you.. Try what is science", user: ChatUser(name: "Mate", avatar: "https://image.freepik.com/free-vector/cute-robot-cartoon-vector-icon-illustration-techology-robot-icon-concept-isolated-premium-vector-flat-cartoon-style_138676-1474.jpg")),
    ];
  }

  Widget returnChat() {
    List<Widget> conver = [];
    for (int i = 0; i < conversation.length; i++) {
      conver.add(Text(conversation[i].text));
    }
    return new ListView(children: conver);
  }

  onSend(ChatMessage message) async  {
    text.clear();
    if (message.text.contains("+")) {
      message.text = message.text.replaceAll("+", " plus ");
    }
    setState(() {
      conversation.add(ChatMessage(text: message.text, user: user));
    });
    try {
      dio.Response response = await dio.Dio().get(
          "https://api.wolframalpha.com/v1/result?i=${message
              .text}&appid=G3PE54-VKYR55XQ2J");
      setState(() {
        conversation.add(ChatMessage(text: response.data.toString(), user: ChatUser(name: "Mate", avatar: "https://image.freepik.com/free-vector/cute-robot-cartoon-vector-icon-illustration-techology-robot-icon-concept-isolated-premium-vector-flat-cartoon-style_138676-1474.jpg")));
      });
    }
    catch (e) {
      setState(() {
        conversation.add(ChatMessage(text: "Sorry, I don't know answer for that but I will learn that soon..", user: ChatUser(name: "Mate", avatar: "https://image.freepik.com/free-vector/cute-robot-cartoon-vector-icon-illustration-techology-robot-icon-concept-isolated-premium-vector-flat-cartoon-style_138676-1474.jpg")));
      });    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DashChat(
        user: user,
        messages: conversation,
        textController: text,
        inputDecoration: InputDecoration(
          hintText: "Message here...",
          border: InputBorder.none,
        ),
        onSend: onSend,

      ),
    );
  }
}
