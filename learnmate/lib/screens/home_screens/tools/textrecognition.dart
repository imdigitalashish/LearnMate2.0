import 'dart:ui';

import 'package:firebase_ml_vision/firebase_ml_vision.dart';
import 'package:flutter/material.dart';

import 'package:image_picker/image_picker.dart';

class FirebaseVIsionText extends StatefulWidget {
  @override
  _FirebaseVIsionTextState createState() => _FirebaseVIsionTextState();
}

class _FirebaseVIsionTextState extends State<FirebaseVIsionText> {
  final TextRecognizer textRecognizer = FirebaseVision.instance.textRecognizer();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RaisedButton(
        onPressed: () async {
          final imageFile = await ImagePicker.pickImage(source: ImageSource.camera);
          print(imageFile.path);
          final FirebaseVisionImage visionImage = FirebaseVisionImage.fromFile(imageFile);
          final VisionText visionText = await textRecognizer.processImage(visionImage);
          String text = visionText.text;
          for (TextBlock block in visionText.blocks) {
            final Rect boundingBox = block.boundingBox;
            final List<Offset> cornerPoints = block.cornerPoints;
            final String text = block.text;
            final List<RecognizedLanguage> languages = block.recognizedLanguages;

            for (TextLine line in block.lines) {
              // Same getters as TextBlock
              for (TextElement element in line.elements) {
                // Same getters as TextBlock
              }
            }
          }
          print(visionText.toString());
          print(text);

        }
      )
    );
  }
}
