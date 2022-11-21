import 'dart:async';

import 'package:flutter/material.dart';

import '../../main.dart';
import '../../pages/form/view/form_layout_view.dart';
import '../theme/pallete.dart';

class splashscreen extends StatefulWidget {
  const splashscreen({Key? key}) : super(key: key);

  @override
  State<splashscreen> createState() => _splashscreenState();
}

class _splashscreenState extends State<splashscreen> {
  @override
  void initState() {
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => AuthGate()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(26, 35, 126, 1),
      body: Container(
        child: Center(
          child: Text(
            'welcome to CV Maker',
            style: TextStyle(
                fontSize: 34, color: Colors.white, fontWeight: FontWeight.w600),
          ),
        ),
      ),
    );
  }
}
