import 'package:flutter/material.dart';
import 'package:mobile1/config/constant.dart';

class Register extends StatefulWidget {

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Register",
        style: TextStyle(
          color: Colors.black,
        ),
        ),
              ),
      body: Container(
        child: Text("Register"),
        ),
    );
  }
}