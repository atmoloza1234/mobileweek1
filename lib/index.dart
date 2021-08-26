import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Index extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Stack(
          children: [
            Positioned(
              top: -140,
              left: -140,
              child: Image.network(
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ8osvCFF-Ni0zuzpmU9pOc6DLcoGgPfYv50tjckP-WylES9qRhOlMKUr2ESHIuvcODoNg&usqp=CAU',
                ),
                ),
                 Positioned(
              bottom: -120,
              left: -100,
              child: Image.asset(
                'asset/image/gray.png',
                ),
                ),
            Column(
              children: [
               SizedBox(
                  height: 20,
                ),
                Image.asset(
                  "asset/image/logo-kmutnb.png",
                  width: size.width * 0.35,
                  height: size.height * 0.2,
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Welcome To KMUTNB",
                  style: TextStyle(
                    color: Colors.orange[800],
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Image.network(
                  'https://images.unsplash.com/photo-1629872874038-b1d600221640?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=700&q=80',
                  width: size.width * 0.55,
                  height: size.height * 0.37,
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.orange[800],
                    shape: StadiumBorder(),
                    padding: EdgeInsets.fromLTRB(120, 10, 120, 10),
                  ),
                  child: Text(
                    "LOGIN",
                    style: TextStyle(fontSize: 16),
                  ),
                  onPressed: () {
                    print("Success");
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.orange[800],
                    shape: StadiumBorder(),
                    padding: EdgeInsets.fromLTRB(120, 10, 120, 10),
                  ),
                  child: Text(
                    "SIGN UP",
                    style: TextStyle(fontSize: 16),
                  ),
                  onPressed: () {
                    print("Thank you");
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
