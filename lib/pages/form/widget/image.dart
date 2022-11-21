import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../../global/widgets/buttons.dart';
import 'package:image_picker/image_picker.dart';

class Myimage extends StatefulWidget {
  const Myimage({Key? key}) : super(key: key);

  @override
  State<Myimage> createState() => _MyimageState();
}

class _MyimageState extends State<Myimage> {
  File? _pickedImage;
  Uint8List? webImage = Uint8List(8);
  //dynamic dimage = webImage;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Row(
        children: [
          SimpleElevatedButton(
              buttonWidth: 250,
              onPressed: (() => _pickImage()),
              text: 'Add Picture'),
          Padding(
              padding: EdgeInsets.all(20),
              child: Container(
                  height: 80,
                  width: 60,
                  child: _pickImage == Null
                      ? Container(
                          color: Colors.white,
                        )
                      : Image.memory(webImage!, fit: BoxFit.fill),
                  decoration: BoxDecoration(
                      //color: Colors.amber,
                      // borderRadius: BorderRadius.all(Radius.circular(35))
                      ))),
        ],
      ),
    );
  }

  Future<void> _pickImage() async {
    if (kIsWeb) {
      final ImagePicker _picker = ImagePicker();
      XFile? image = await _picker.pickImage(source: ImageSource.gallery);
      if (image != null) {
        var f = await image.readAsBytes();
        setState(() {
          webImage = f;
          _pickedImage = File("a");
        });
      } else {
        print("no image found");
      }
    }
  }
}
