import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learnmate/export_url.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dio/dio.dart' as dio;

class DonateBooks extends StatefulWidget {
  @override
  _DonateBooksState createState() => _DonateBooksState();
}

class _DonateBooksState extends State<DonateBooks> {
  TextEditingController cityName = TextEditingController();
  TextEditingController pinCode = TextEditingController();
  TextEditingController bookName = TextEditingController();

  bool canDonate = false;

  _changeCanDonateState() {
    if (cityName.text.trim().length != 0 &&
        pinCode.text.trim().length != 0 &&
        bookName.text.trim().length != 0) {
      print("true");
      setState(() {
        canDonate = true;
      });
    } else {
      print("false");
      setState(() {
        canDonate = false;
      });
    }
  }

  _donateBooks() async {
    SharedPreferences shared = await SharedPreferences.getInstance();
    String phoneNumber = shared.getString("phone_number");
    String name = shared.getString("name");
    try {
      dio.Response response = await dio.Dio().post(server_url +
          "addBooks?phone=$phoneNumber&name=$name&city=${cityName.text.trim()}&pin=${pinCode.text.trim()}&book=${bookName.text.trim()}");
      if (response.statusCode == 200) {
        Get.snackbar(
          "Failed",
          "User Already Exists with That Phone Number",
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
            "Yay ! You have made a contribution $name",
            style: TextStyle(fontSize: 25),
          ),
        );
        bookName.text = "";
        cityName.text = "";
        pinCode.text ="";
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
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Center(
                child: Text("Donate Book",
                    style:
                        TextStyle(fontSize: 32, fontWeight: FontWeight.w400)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: cityName,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: const BorderRadius.all(
                      const Radius.circular(30.0),
                    ),
                  ),
                  labelText: "City Name",
                ),
                onChanged: (e) => _changeCanDonateState(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: pinCode,
                keyboardType: TextInputType.numberWithOptions(),
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: const BorderRadius.all(
                      const Radius.circular(30.0),
                    ),
                  ),
                  labelText: "Pin code",
                ),
                onChanged: (e) => _changeCanDonateState(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: bookName,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: const BorderRadius.all(
                      const Radius.circular(30.0),
                    ),
                  ),
                  labelText: "Book Name",
                ),
                onChanged: (e) => _changeCanDonateState(),
              ),
            ),
            Center(
              child: RaisedButton(
                onPressed: canDonate ? () => _donateBooks() : null,
                child: Text(
                  "Donate",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                color: Colors.green,
              ),
            )
          ],
        ),
      ),
    );
  }
}
