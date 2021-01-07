import 'package:flutter/material.dart';
import 'package:learnmate/screens/authenticate.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

  String name;
  String username;
  String password;
  String phone_number;


  _getDataofUser() async {
    SharedPreferences shared = await SharedPreferences.getInstance();
    name = shared.getString("name");
    username = shared.getString("username");
    password = shared.getString("password");
    phone_number = shared.getString("phone_number");
    setState(() {

    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getDataofUser();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: [
          Container(
            padding: EdgeInsets.only(top: 18),
            margin: EdgeInsets.only(left: 10, right: 10),

            height: MediaQuery.of(context).size.width * 0.3,
            child: Card(
              elevation: 5,
              color: Colors.blue,
              child: Center(
                child: Text(
                  "Your Profile",
                  style: TextStyle(color: Colors.white, fontSize: 32),
                ),
              ),
            ),
          ),
          Container(

            height: 100,
            margin: EdgeInsets.only(top: 30, left: 10, right: 10),
            child: Card(
              elevation: 5,
              child: Column(
                // padding: EdgeInsets.only(left: 30),
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      "Phone number: $phone_number",
                      style: TextStyle(
                        fontSize: 22,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: 100,
            margin: EdgeInsets.only(top: 10, left: 10, right: 10),
            child: Card(
              elevation: 5,
              child: Column(
                // padding: EdgeInsets.only(left: 30),
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      "Password: $password",
                      style: TextStyle(
                        fontSize: 22,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: 100,
            margin: EdgeInsets.only(top: 10, left: 10, right: 10),
            child: Card(
              elevation: 5,
              child: Column(
                // padding: EdgeInsets.only(left: 30),
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      "Display Name: $username",
                      style: TextStyle(
                        fontSize: 22,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: 100,
            margin: EdgeInsets.only(top: 10, left: 10, right: 10),
            child: Card(
              elevation: 5,
              child: Column(
                // padding: EdgeInsets.only(left: 30),
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      "Name: $name",
                      style: TextStyle(
                        fontSize: 22,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: FlatButton(
              onPressed: () async {
                SharedPreferences shared = await SharedPreferences.getInstance();
                shared.setInt("state", null);
                Navigator.push(context, MaterialPageRoute(builder: (_)=>Authentication()));
              },
              child: Container(
                height: 60.0,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.red[600],
                  borderRadius: BorderRadius.circular(
                    30.0,
                  ),
                ),
                child: Center(
                  child: Text(
                    "Logout",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
