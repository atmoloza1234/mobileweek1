import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart' as http;
import 'package:mobile1/model/tct.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

var data;

class _DashboardState extends State<Dashboard> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("HELLO WORLD");
    callAPI();
  }

  Future<void> callAPI() async {
    var url = Uri.parse("https://www.boredapi.com/api/activity");
    var response = await http.get(url);

    setState(() {
      data = tctFromJson(response.body);
    });
    //print(response.statusCode);
    //print(response.body);
    //print(response.request);

    //data = tctFromJson(response.body);
    //print(data.activity);
    //print(data.type);
    //print(data.link);
  }

  Future<void> loading() async {}

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              Icon(Icons.api),
              SizedBox(width: 10),
              Text("Dashboard"),
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                Text(
                  data?.activity ?? "loading...",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.pinkAccent.shade100,
                    fontSize: 20,
                  ),
                ),
                Text(data?.type ?? "loading..."),
                Text('${data?.price ?? "loading..."}'),
                Text('${data?.participants ?? "loading..."}'),
              ],
            ),
          ),
        ),
        drawer: Drawer(
          // Add a ListView to the drawer. This ensures the user can scroll
          // through the options in the drawer if there isn't enough vertical
          // space to fit everything.
          child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: [
              ListTile(
                title: const Text('Item 1'),
                onTap: () {
                  // Update the state of the app
                  // ...
                  // Then close the drawer
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text('Logout'),
                onTap: () {
                  // Update the state of the app
                  // ...
                  // Then close the drawer

                  Navigator.popAndPushNamed(context, "Login");
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
