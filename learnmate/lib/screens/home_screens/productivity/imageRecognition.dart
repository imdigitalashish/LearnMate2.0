import 'dart:io';
import 'package:flutter/services.dart';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:dio/dio.dart';
import 'package:learnmate/export_url.dart';
import 'package:http_parser/http_parser.dart';
import 'package:image_cropper/image_cropper.dart';

class WhatIsIt extends StatefulWidget {
  @override
  _WhatIsItState createState() => _WhatIsItState();
}

class _WhatIsItState extends State<WhatIsIt> {
  File image;
  File croppedImage;

  _getImageDetailsUsingGallery() async {
    final picker = ImagePicker();

    var imagePicker = await picker.getImage(source: ImageSource.gallery);
    image = File(imagePicker.path);
    croppedImage = await ImageCropper.cropImage(
        sourcePath: image.path,
        aspectRatioPresets: [
          CropAspectRatioPreset.square,
          CropAspectRatioPreset.ratio3x2,
          CropAspectRatioPreset.original,
          CropAspectRatioPreset.ratio4x3,
          CropAspectRatioPreset.ratio16x9
        ],
        androidUiSettings: AndroidUiSettings(
            toolbarTitle: 'Crop Your Image',
            toolbarColor: Colors.deepOrange,
            toolbarWidgetColor: Colors.white,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: false),
        iosUiSettings: IOSUiSettings(
          minimumAspectRatio: 1.0,
        ));
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (_) => ImageAdd(
                  image: croppedImage,
                )));
  }

  _getImageDetailsUsingCamera() async {
    final picker = ImagePicker();

    var imagePicker = await picker.getImage(source: ImageSource.camera);
    image = File(imagePicker.path);
    croppedImage = await ImageCropper.cropImage(
        sourcePath: image.path,
        aspectRatioPresets: [
          CropAspectRatioPreset.square,
          CropAspectRatioPreset.ratio3x2,
          CropAspectRatioPreset.original,
          CropAspectRatioPreset.ratio4x3,
          CropAspectRatioPreset.ratio16x9
        ],
        androidUiSettings: AndroidUiSettings(
            toolbarTitle: 'Crop Your Image',
            toolbarColor: Colors.deepOrange,
            toolbarWidgetColor: Colors.white,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: false),
        iosUiSettings: IOSUiSettings(
          minimumAspectRatio: 1.0,
        ));
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (_) => ImageAdd(
              image: croppedImage,
            )));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  Color themeColor = Colors.red[200];
  final double boxSize = 0.55;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Center(
              child: Text(
                "Choose from below",
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
                    onTap: () => _getImageDetailsUsingCamera(),
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
                                    Icon(
                                      Icons.camera_alt_rounded,
                                      size: MediaQuery.of(context).size.width *
                                          0.3,
                                      color: Colors.white,
                                    ),
                                    SizedBox(height: 15),
                                    Text(
                                      "Camera",
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
                    onTap: () => _getImageDetailsUsingGallery(),
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
                                    Icon(
                                      Icons.photo,
                                      size: MediaQuery.of(context).size.width *
                                          0.3,
                                      color: Colors.white,
                                    ),
                                    SizedBox(height: 15),
                                    Text(
                                      "Gallery",
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

class ImageAdd extends StatefulWidget {
  final File image;

  const ImageAdd({Key key, this.image}) : super(key: key);

  @override
  _ImageAddState createState() => _ImageAddState();
}

class _ImageAddState extends State<ImageAdd> {
  Dio dio = new Dio();
  bool canPress = true;
  _getImageText() async {
    setState(() {
      canPress = false;
    });
    print(widget.image.path.split('/').last);
    print(widget.image.path);
    try {
      String filename = widget.image.path.split('/').last;
      print(filename);
      FormData formData = new FormData.fromMap({
        "file":
            await MultipartFile.fromFile(widget.image.path, filename: filename),
        "type": "image/png"
      });
      Response response = await dio.post(
        server_url + "uploadFile",
        data: formData,
      );
      print(response.data.toString());
      Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (_) => ExtractedTextScreen(text: response.data.toString())));
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(children: [
        Image.file(widget.image,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.width * 0.6),
        RaisedButton(
          child: Text("Extract"),
          onPressed: canPress? () => _getImageText() : null,
        )
      ]),
    );
  }
}

class ExtractedTextScreen extends StatefulWidget {
  final String text;

  const ExtractedTextScreen({Key key, this.text}) : super(key: key);

  @override
  _ExtractedTextScreenState createState() => _ExtractedTextScreenState();
}

class _ExtractedTextScreenState extends State<ExtractedTextScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Center(
              child: Text(
                "Your Extracted Text",
                style: TextStyle(fontSize: 32),
              ),
            ),
          ),
          RaisedButton(
            child: Text("Copy to clipboard"),
            onPressed: () {
              Clipboard.setData(new ClipboardData(text: widget.text));
            },
          ),
          Padding(
            padding: const EdgeInsets.all(18.0),

            child: Text(
              "${widget.text}",
              style: TextStyle(fontSize: 18),
            ),
          ),
        ],
      ),
    );
  }
}

// try {
// String filename = croppedImage.path.split('/').last;
// print(filename);
// FormData formData = new FormData.fromMap({
// "file": await MultipartFile.fromFile(croppedImage.path, filename: filename),
// "type": "image/png"
// });
// Response response = await dio.post(
// server_url + "uploadFile",
// data: formData,
// );
// print(response.data.toString());
// } catch (e) {
// print(e);
// }
