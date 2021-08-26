//import 'package:mobile1/index.dart';

//import 'home.dart';
import 'index.dart';

import 'package:flutter/material.dart';


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
    );
  }
}