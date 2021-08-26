
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("KMUTNB"),
      ),
      body: Container(
        color: Colors.cyan,
        alignment: Alignment.center,
        child: Stack(
          children: [
            Positioned(
              bottom: 10,
              left: 140,
              child: Text("KMTUNB",
              style: TextStyle(fontSize: 30,
              ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}