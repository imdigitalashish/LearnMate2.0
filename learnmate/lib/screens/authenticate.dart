import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:learnmate/export_url.dart';
import 'package:get/get.dart';
import 'package:learnmate/screens/home.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Authentication extends StatefulWidget {
  @override
  _AuthenticationState createState() => _AuthenticationState();
}

class _AuthenticationState extends State<Authentication> {
  // ============= LOGIN ===============================
  TextEditingController loginPhoneController = TextEditingController();
  TextEditingController loginPasswordController = TextEditingController();
  final loginpasswordFocusNode = FocusNode();
  final loginphoneFocusNode = FocusNode();

  bool canLogin = false;

  _signController() {
    if (loginPhoneController.text.trim().length == 10 &&
        loginPasswordController.text.trim().length != 0) {
      setState(() {
        canLogin = true;
      });
    } else {
      setState(() {
        canLogin = false;
      });
    }
  }

  _loginUser() async {
    setState(() {
      canLogin = false;
    });
    var client = http.Client();
    try {
      var uriResponse = await client.post(server_url +
          "login?phone=${loginPhoneController.text.trim()}&password=${loginPasswordController.text.trim()}");

      if (uriResponse.statusCode == 200) {
        Map<String, dynamic> response = jsonDecode(uriResponse.body.toString());

        SharedPreferences shared = await SharedPreferences.getInstance();
        shared.setString("name", response['name']);
        shared.setString("username", response['username']);
        shared.setString("password", response['password']);
        shared.setString("phone_number", response['phone_number']);
        shared.setInt("state", 1);
        Navigator.of(context).popUntil((route) => route.isFirst);

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (_) => Home(),
          ),
        );
      } else if (uriResponse.statusCode == 404) {
        Get.snackbar(
          "Failed",
          "There is no user with that phone number",
          snackPosition: SnackPosition.TOP,
          margin: EdgeInsets.only(
            top: 40,
          ),
          maxWidth: 400,
          duration: Duration(seconds: 5),
          titleText: Text(
            "Failed",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          messageText: Text(
            "Invalid Credentials",
            style: TextStyle(fontSize: 25),
          ),
        );
      } else if (uriResponse.statusCode == 502) {
        Get.snackbar(
          "Failed",
          "There is no user with that phone number",
          snackPosition: SnackPosition.TOP,
          margin: EdgeInsets.only(
            top: 40,
          ),
          maxWidth: 400,
          duration: Duration(seconds: 5),
          titleText: Text(
            "Alert",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          messageText: Text(
            "Something Went Wrong Please Contact App Developer",
            style: TextStyle(fontSize: 25),
          ),
        );
      }

      // print(await client.get(uriResponse.bodyFields['uri']));
    } catch (e) {
      Get.snackbar(
        "Failed",
        "There is no user with that phone number",
        snackPosition: SnackPosition.TOP,
        margin: EdgeInsets.only(
          top: 40,
        ),
        maxWidth: 400,
        duration: Duration(seconds: 5),
        titleText: Text(
          "Connection Error !",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        messageText: Text(
          "Make sure you are connected to internet",
          style: TextStyle(fontSize: 25),
        ),
      );
    } finally {
      client.close();
    }

    setState(() {
      canLogin = true;
    });
  }

  // ==================== REGISTER ====================================================

  TextEditingController registerPhoneController = TextEditingController();
  TextEditingController registerPasswordController = TextEditingController();
  TextEditingController registerUsernameController = TextEditingController();
  TextEditingController registerNameController = TextEditingController();

  bool canLoginRegister = false;

  controlRegister() {
    if (registerPhoneController.text.trim().length == 10 &&
        registerUsernameController.text.trim().length != 0 &&
        registerPasswordController.text.trim().length != 0 &&
        registerNameController.text.trim().length != 0) {
      print("F");
      setState(() {
        canLoginRegister = true;
      });
    } else {
      print("E");
      setState(() {
        canLoginRegister = false;
      });
    }
  }

  _registerUser() async {
    canLoginRegister = false;
    var client = http.Client();

    try {
      var uriResponse = await client.post(server_url +
          "registerUser?username=${registerUsernameController.text.trim()}&phone=${registerPhoneController.text.trim()}&password=${registerPasswordController.text.trim()}&name=${registerNameController.text.trim()}");
      print(uriResponse.statusCode);
      if (uriResponse.statusCode == 200) {
        SharedPreferences shared = await SharedPreferences.getInstance();
        shared.setString("name", registerNameController.text.trim());
        shared.setString("username", registerUsernameController.text.trim());
        shared.setString("password", registerPasswordController.text.trim());
        shared.setString("phone_number", registerPhoneController.text.trim());

        shared.setInt("state", 1);
        Navigator.of(context).popUntil((route) => route.isFirst);

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (_) => Home(),
          ),
        );
      } else if (uriResponse.statusCode == 404) {
        Get.snackbar(
          "Failed",
          "User Already Exists with That Phone Number",
          snackPosition: SnackPosition.TOP,
          margin: EdgeInsets.only(
            top: 40,
          ),
          maxWidth: 400,
          duration: Duration(seconds: 5),
          titleText: Text(
            "Failed",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          messageText: Text(
            "User Already Exists with That Phone Number",
            style: TextStyle(fontSize: 25),
          ),
        );
      } else if (uriResponse.statusCode == 502) {
        Get.snackbar(
          "Failed",
          "There is no user with that phone number",
          snackPosition: SnackPosition.TOP,
          margin: EdgeInsets.only(
            top: 40,
          ),
          maxWidth: 400,
          duration: Duration(seconds: 5),
          titleText: Text(
            "Alert",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          messageText: Text(
            "Something Went Wrong Please Contact App Developer",
            style: TextStyle(fontSize: 25),
          ),
        );
      }

      // print(await client.get(uriResponse.bodyFields['uri']));
    } catch (e) {
      print(e.toString());
      Get.snackbar(
        "Failed",
        "There is no user with that phone number",
        snackPosition: SnackPosition.TOP,
        margin: EdgeInsets.only(
          top: 40,
        ),
        maxWidth: 400,
        duration: Duration(seconds: 5),
        titleText: Text(
          "Connection Error !",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        messageText: Text(
          "Make sure you are connected to internet",
          style: TextStyle(fontSize: 25),
        ),
      );
    } finally {
      client.close();
    }

    canLoginRegister = true;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Card(
            elevation: 40,
            child: ListView(
              children: [
                Container(
                  padding: EdgeInsets.all(25),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image(
                        width: MediaQuery.of(context).size.height * 0.4,
                        image: NetworkImage(
                            'https://i.pinimg.com/originals/65/dc/a6/65dca69f78972935caf61580e7c17bd9.png'),
                      ),
                      Text(
                        "Sign In To Learn Mate",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 35,
                        ),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Text("Phone"),
                      SizedBox(
                        height: 20,
                      ),
                      TextField(
                        focusNode: this.loginphoneFocusNode,
                        controller: loginPhoneController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: "Enter your phone",
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.teal),
                          ),
                        ),
                        onChanged: (text) => _signController(),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text("Password"),
                      SizedBox(
                        height: 10,
                      ),
                      TextField(
                        focusNode: this.loginpasswordFocusNode,
                        controller: loginPasswordController,
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: "Enter your password",
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.teal),
                          ),
                        ),
                        keyboardType: TextInputType.visiblePassword,
                        onChanged: (sign) => _signController(),
                      ),
                      RaisedButton(
                        child: Text("Sign In"),
                        onPressed: canLogin ? () => _loginUser() : null,
                        color: Colors.purple,
                        textColor: Colors.white,
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      InkWell(
                        child: Text(
                          "Don't have an account? Sign Up",
                          style: TextStyle(fontSize: 15),
                        ),
                        onTap: () {
                          this.loginphoneFocusNode.unfocus();
                          this.loginpasswordFocusNode.unfocus();
                          showModalBottomSheet(
                            context: context,
                            isScrollControlled: true,
                            backgroundColor: Colors.transparent,
                            builder: (context) => Container(
                              height: MediaQuery.of(context).size.height * 0.90,
                              decoration: new BoxDecoration(
                                color: Colors.white,
                                borderRadius: new BorderRadius.only(
                                  topLeft: const Radius.circular(25.0),
                                  topRight: const Radius.circular(25.0),
                                ),
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(20),
                                child: Column(
                                  children: [
                                    Text(
                                      "Sign Up",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 35,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 40,
                                    ),
                                    Text("Phone Number"),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    TextField(
                                      controller: registerPhoneController,
                                      decoration: InputDecoration(
                                        labelText: "Enter your Phone",
                                        border: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.teal),
                                        ),
                                      ),
                                      onChanged: (sign) => controlRegister(),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Text("Password"),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    TextField(
                                      controller: registerPasswordController,
                                      onChanged: (sign) => controlRegister(),
                                      obscureText: true,
                                      decoration: InputDecoration(
                                        labelText: "Enter your Password",
                                        border: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.teal),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Text("Display Name"),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    TextField(
                                      controller: registerUsernameController,
                                      onChanged: (sign) => controlRegister(),
                                      decoration: InputDecoration(
                                        labelText: "Enter your Display Name",
                                        border: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.teal),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Text("Name"),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    TextField(
                                      controller: registerNameController,
                                      onChanged: (sign) => controlRegister(),
                                      decoration: InputDecoration(
                                        labelText: "Enter your Name",
                                        border: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.teal),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    RaisedButton(
                                      child: Text("Sign Up"),
                                      onPressed: canLoginRegister
                                          ? () => _registerUser()
                                          : null,
                                      color: Colors.purple,
                                      textColor: Colors.white,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      )
                    ],
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
