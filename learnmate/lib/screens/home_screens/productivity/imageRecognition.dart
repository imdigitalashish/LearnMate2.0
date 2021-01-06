import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:dio/dio.dart' as dio;
class WhatIsIt extends StatefulWidget {
  @override
  _WhatIsItState createState() => _WhatIsItState();
}

class _WhatIsItState extends State<WhatIsIt> {

  String api_key = 'acc_abe59a7e9771da3';
  String api_secret = '8119b9b1ab9554093d1bea1e181d0b13';


  _getImageDetails() async {
    final picker = ImagePicker();
    final file = picker.getImage(source: ImageSource.gallery);
    dio.Response response = await dio.Dio().get("https://api.imagga.com/v2/tags", );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getImageDetails();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

    );
  }
}
