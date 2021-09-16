import 'package:flutter/material.dart';
import 'package:mobile1/config/constant.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

List<String> imagePaths = ["asset/image/facebook.png", "asset/image/gmail.png"];

class _LoginState extends State<Login> {
  var username, password;
  final formkey = GlobalKey<FormState>();

  final TextEditingController _pass = TextEditingController();
  final TextEditingController _confirmPass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Login",
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
        body: Container(
          alignment: Alignment.center,
          child: Stack(
            children: [
              Column(
                children: [
                  Image.asset(
                    "asset/image/logo-kmutnb.png",
                    width: size.width * 0.35,
                    height: size.height * 0.2,
                  ),
                  sizebox(),
                  txtUsername(),
                  sizebox(),
                  txtPassword(),
                  sizebox(),
                  btnSummit(),
                  sizebox(),
                  Text(
                    "OR",
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  Image.asset(
                    "asset/image/facebook.png",
                    width: size.width * 0.2,
                    height: size.height * 0.2,
                  ),
                ],
              ),
            ],
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
          "LOGIN",
          style: TextStyle(fontSize: 18),
        ),
        onPressed: () {
          if (formkey.currentState!.validate()) {
            formkey.currentState!.save();
            print("Name : $username Password: $password");
            formkey.currentState!.reset();
            print("LOGIN Complete");
            //Navigator.pushNamed(context, 'Login');
          }
        },
      );
}
