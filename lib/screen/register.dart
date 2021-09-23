// import 'dart:ffi';

import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile1/backend/db.dart';
import 'package:mobile1/config/constant.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  var username, email, password, repassword;
  final formkey = GlobalKey<FormState>();

  final TextEditingController _pass = TextEditingController();
  final TextEditingController _confirmPass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      //ไม่ให้ซ้อนทับกับตัวแสดงเวลา
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Register",
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Form(
            key: formkey,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Image.asset(
                    "asset/image/logo-kmutnb.png",
                    width: size.width * 0.35,
                    height: size.height * 0.2,
                  ),
                  sizebox(),
                  txtUsername(),
                  sizebox(),
                  txtEmail(),
                  sizebox(),
                  txtPassword(),
                  sizebox(),
                  txtRepassword(),
                  sizebox(),
                  btnSummit(),
                  sizebox(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget txtUsername() {
    return Container(
      margin: EdgeInsets.fromLTRB(8, 0, 15, 0),
      child: TextFormField(
        decoration: const InputDecoration(
          icon: Icon(Icons.account_circle_rounded),
          border: OutlineInputBorder(),
          labelText: 'Username',
          hintText: 'Press Your Username',
        ),
        validator: (value) {
          if (value!.isEmpty) {
            return "กรุณาใส่ข้อมูล";
          } else if (value.length < 4) {
            return "กรุณาใส่ข้อมูลมากกว่า 4 ตัว";
          }
        },
        onSaved: (value) {
          username = value;
        },
      ),
    );
  }

  Widget txtEmail() {
    return Container(
      margin: EdgeInsets.fromLTRB(8, 0, 15, 0),
      child: TextFormField(
        keyboardType: TextInputType.emailAddress,
        decoration: const InputDecoration(
          icon: Icon(Icons.email_rounded),
          border: OutlineInputBorder(),
          labelText: 'Email',
          hintText: 'Press Your Email',
        ),
        validator: (value) {
          if (!(value!.contains('@'))) {
            return "กรุณากรอกข้อมูลรูปแบบ E-Mail ให้ถูกต้อง";
          } else if (!(value.contains('.'))) {
            return "กรุณากรอกข้อมูลรูปแบบ E-Mail ให้ถูกต้อง";
          }
        },
        onSaved: (value) {
          email = value;
        },
      ),
    );
  }

  Widget txtPassword() {
    return Container(
      margin: EdgeInsets.fromLTRB(8, 0, 15, 0),
      child: TextFormField(
        obscureText: true,
        decoration: const InputDecoration(
          icon: Icon(Icons.lock_rounded),
          border: OutlineInputBorder(),
          labelText: 'Password',
          hintText: 'Press Your Password',
        ),
        controller: _pass,
        validator: (value) {
          if (value!.isEmpty) {
            return "กรุณากรอก Password ให้ครบ";
            return null;
          } else if (value.length < 8) {
            return "กรุณากรอก Password อย่างน้อย 8 ตัว";
          }
        },
        /* validator: Validators.compose([
          Validators.required('Password is required'),
          Validators.patternString(
              r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$',
              'Invalid Password')
        ]),*/
        /* validator: (passvalue) {
          if (passvalue!.isEmpty) {
            return "กรุณาใส่ข้อมูล";
          } else if (passvalue.length < 8) {
            return "กรุณาใส่ข้อมูลมากกว่า 8 ตัว";
          }
        },*/
        onSaved: (value) {
          password = value;
        },
      ),
    );
  }

  Widget txtRepassword() {
    return Container(
      margin: EdgeInsets.fromLTRB(8, 0, 15, 0),
      child: TextFormField(
        obscureText: true,
        enableSuggestions: false,
        autocorrect: false,
        decoration: const InputDecoration(
          icon: Icon(Icons.lock_rounded),
          border: OutlineInputBorder(),
          labelText: 'Re-Password',
          hintText: 'Press Your Password Again',
        ),
        controller: _confirmPass,
        validator: (value) {
          if (value!.isEmpty) {
            return "กรุณากรอก Password ให้ครบ";
          } else if (value != _pass.text) {
            return "Password ไม่ตรงกัน";
            return null;
          }
        },

        /* if (value!.length >= 8 &&
              !value.contains(RegExp(r'\W')) &&
              RegExp(r'\d+\w*\d+').hasMatch(value)) {
            return "\n\t$value is Valid Password";
          } else {
            return "\n\t$value is Invalid Password";
          }*/

        onSaved: (value) {
          repassword = value;
        },
      ),
    );
  }

  Widget sizebox() {
    return SizedBox(
      height: 20,
    );
  }

  Widget btnSummit() => ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: pcolor,
          shape: StadiumBorder(),
          padding: EdgeInsets.fromLTRB(120, 10, 120, 10),
        ),
        child: Text(
          "SIGN UP",
          style: TextStyle(fontSize: 20),
        ),
        onPressed: () {
          print("Hello");
          // var local = new DBLocal();

          var local = DBLocal();

          if (formkey.currentState!.validate()) {
            formkey.currentState!.save();
            local.regis(username, email, password, repassword);
            /*print(
                "Name : $username Email: $email Password: $password Re-Password: $repassword");*/
            formkey.currentState!.reset();
            //print("SIGN UP Complete");
            Navigator.pushNamed(context, 'Login');
          }
        },
      );
}
