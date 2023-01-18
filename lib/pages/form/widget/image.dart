import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

import '../../../global/widgets/buttons.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

class myimage extends StatefulWidget {
  const myimage({Key? key}) : super(key: key);

  @override
  State<myimage> createState() => _myimageState();
}

class _myimageState extends State<myimage> {
  File? _image;
  Uint8List? webImage = Uint8List(8);
  // final image = pw.MemoryImage(
  //   File('a').readAsBytesSync(),
  // );
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
                  child: Image.memory(
                    webImage!,
                    fit: BoxFit.fill,
                    height: 100,
                    width: 200,
                  ),
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
          _image = File("a");
        });
      } else {
        print("no image found");
      }
    }
  }

  // createPDF() async {
  //   var img;
  //   final image = pw.MemoryImage(img.readAsBytesSync());
  //   pdf.addPage(pw.page(Build:(pw.Context context){
  //     return pw.Image(image);
  //   }));

  // }
}
