import 'package:flutter/material.dart';
import 'package:mobile1/config/constant.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
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
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Enter Your Username',
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Enter Your Password',
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: pcolor,
                    shape: StadiumBorder(),
                    padding: EdgeInsets.fromLTRB(120, 10, 120, 10),
                  ),
                  child: Text(
                    "LOGIN",
                    style: TextStyle(fontSize: 20),
                  ),
                  onPressed: () {
                    print("Login Complete");
                    Navigator.pushNamed(context, 'Login');
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                Text("OR",
                style: TextStyle(
                  fontSize: 16,
                ),
                ),
                Image.asset(
                  ""
                  ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
