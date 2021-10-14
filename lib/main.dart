//import 'package:mobile1/index.dart';

//import 'home.dart';
import 'package:mobile1/config/constant.dart';
import 'package:mobile1/screen/dashboard.dart';
import 'package:mobile1/screen/img.dart';
import 'package:mobile1/screen/index.dart';

import 'package:flutter/material.dart';
import 'package:mobile1/screen/location.dart';
import 'package:mobile1/screen/login.dart';
import 'package:mobile1/screen/register.dart';
import 'package:mobile1/screen/video.dart';

void main() => runApp(KMUTNB());

/*var TCT = MaterialApp(
    home: Scaffold(
      body: Container(),
    ),
  );
  runApp(TCT);*/

class KMUTNB extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //home: Home(),
      home: Index(),
      routes: {
        'Login': (context) => Login(),
        'Register': (context) => Register(),
        'Dashboard': (context) => Dashboard(),
        'PacImage': (context) => PacImage(),
        'PacVideo': (context) => PacVideo(),
        'PacLocation': (context) => PacLocation(),
      },
      theme: ThemeData(
        primaryColor: pcolor,
        //secondaryHeaderColor: scolor,
      ),
      //home: Login(),
    );
  }
}
