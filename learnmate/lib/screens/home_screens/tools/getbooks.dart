import 'package:flutter/material.dart';
import 'package:dio/dio.dart' as dio;
import 'package:get/get.dart';
import 'package:learnmate/export_url.dart';
import 'package:learnmate/models/Book.dart';

class GetBooks extends StatefulWidget {
  final String phone;

  const GetBooks({Key key, this.phone}) : super(key: key);

  @override
  _GetBooksState createState() => _GetBooksState();
}

class _GetBooksState extends State<GetBooks> {
  List<Book> listOfBooks = [];
  List<Book> listOfBooksToShow = [];

  TextEditingController searchText = TextEditingController();


  _getDonatedBooks() async {
    try {
      dio.Response<List<dynamic>> response =
          await dio.Dio().post<List<dynamic>>(server_url + "getBooks");
      print(response);
      setState(() {
        listOfBooks =
            response.data.toList().map((e) => Book.fromJson(e)).toList();
        listOfBooksToShow = List.from(listOfBooks);
      });
    } catch (e) {}
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getDonatedBooks();
  }

  Widget getBooksWidgets() {
    List<Widget> booksWidget = [];
    for (int i = 0; i < listOfBooksToShow.length; i++) {
      booksWidget.add(
        Padding(
          padding: const EdgeInsets.only(bottom: 14.0),
          child: Card(
            elevation: 15,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: ExpansionTile(
                title: Text(

                  listOfBooksToShow[i].book,
                  style: TextStyle(fontSize: 26),
                ),
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Text("Phone Number: ${listOfBooksToShow[i].phone}"),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Text("Name Of Donor : ${listOfBooksToShow[i].name}"),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Text("City : ${listOfBooksToShow[i].city}"),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Text("Pin Code : ${listOfBooksToShow[i].pin}"),
                  ),
                  if (widget.phone == listOfBooksToShow[i].phone)
                    RaisedButton(
                      child: Text(
                        "Delete",
                        style: TextStyle(color: Colors.white),
                      ),
                      color: Colors.red,
                      onPressed: () async {
                        try {
                          dio.Response response = await dio.Dio().post(
                              server_url +
                                  "deleteBook?pk=${listOfBooksToShow[i].id}");
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
                                "Donation Deleted",
                                style: TextStyle(fontSize: 25),
                              ),
                            );
                            setState(() {
                              listOfBooksToShow.removeAt(i);

                            });
                          }
                        }catch (e) {
                          Get.snackbar(
                            "Failed",
                            "User Already Exists with That Phone Number",
                            snackPosition: SnackPosition.TOP,
                            maxWidth: 400,
                            duration: Duration(seconds: 5),
                            titleText: Text(
                              "Error",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            messageText: Text(
                              "Connection Error",
                              style: TextStyle(fontSize: 25),
                            ),
                          );
                        }
                      },
                    ),
                ],
              ),
            ),
          ),
        ),
      );
    }
    return new ListView(children: booksWidget);
  }

  _onSearchChanges() {
    if (searchText.text.trim().length != 0) {

        listOfBooksToShow.clear();
        listOfBooks.forEach((element) {
          print(element.book);
          print(listOfBooks.contains(searchText.text.trim()));
          if (element.book.toLowerCase().contains(searchText.text.trim().toLowerCase())) {
            listOfBooksToShow.add(element);
          }
        });
        setState(() {

        });
    } else {
      setState(() {
        listOfBooksToShow = List.from(listOfBooks);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              color: Theme.of(context).primaryColor,
              child: new Padding(
                padding: const EdgeInsets.all(8.0),
                child: new Card(
                  child: new ListTile(
                    leading: new Icon(Icons.search),
                    title: new TextField(
                      controller: searchText,
                      onChanged: (e) => _onSearchChanges(),
                      // controller: controller,
                      decoration: new InputDecoration(
                          hintText: 'Search', border: InputBorder.none),
                      // onChanged: onSearchTextChanged,
                    ),
                    trailing: new IconButton(
                      icon: new Icon(Icons.cancel),
                      onPressed: () {
                        searchText.clear();
                        _onSearchChanges();
                      },
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(21.0),
                child: getBooksWidgets(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
