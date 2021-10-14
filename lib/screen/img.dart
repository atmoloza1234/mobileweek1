import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class PacImage extends StatefulWidget {
  const PacImage({Key? key}) : super(key: key);

  @override
  _PacImageState createState() => _PacImageState();
}

class _PacImageState extends State<PacImage> {
  var file;

  Future<void> openCam() async {
    var picker = ImagePicker();
    //var gal = await picker.pickImage(source: ImageSource.gallery);
    var photo = await picker.pickImage(source: ImageSource.camera);

    setState(() {
      file = File(photo!.path);
    });

    print(file);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Image",
          style: TextStyle(
            fontSize: 22,
            color: Colors.green[700],
          ),
        ),
      ),
      body: Center(
        child: file == null ? Text('Not Found') : Image.file(file),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          openCam();
        },
        child: Icon(Icons.camera_alt_rounded),
        backgroundColor: Colors.green[700],
      ),
    );
  }
}
