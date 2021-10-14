import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart' as http;
import 'package:mobile1/config/constant.dart';
import 'package:mobile1/model/tct.dart';
import 'package:mobile1/screen/img.dart';

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
                Text(
                  data?.type ?? "loading...",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.pinkAccent.shade100,
                    fontSize: 20,
                  ),
                ),
                Text(
                  '${data?.price ?? "loading..."}',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.pinkAccent.shade100,
                    fontSize: 20,
                  ),
                ),
                Text(
                  '${data?.participants ?? "loading..."}',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.pinkAccent.shade100,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          ),
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                decoration: BoxDecoration(
                  color: pcolor,
                ),
                child: Text(
                  "Menu",
                  style: TextStyle(
                    fontSize: 22,
                    color: Colors.lightBlueAccent[400],
                  ),
                ),
              ),
              ListTile(
                title: Text(
                  "Video",
                  style: TextStyle(
                    fontSize: 22,
                  ),
                ),
                onTap: () {
                  Navigator.popAndPushNamed(context, "PacVideo");
                },
                leading: Icon(
                  Icons.video_call_rounded,
                  size: 26,
                  color: Colors.red[600],
                ),
              ),
              ListTile(
                title: Text(
                  "Image",
                  style: TextStyle(
                    fontSize: 22,
                  ),
                ),
                onTap: () {
                  Navigator.popAndPushNamed(context, "PacImage");
                },
                leading: Icon(
                  Icons.image_rounded,
                  size: 26,
                  color: Colors.green[700],
                ),
              ),
              ListTile(
                title: Text(
                  "Location",
                  style: TextStyle(
                    fontSize: 22,
                  ),
                ),
                onTap: () {
                  Navigator.popAndPushNamed(context, "PacLocation");
                },
                leading: Icon(
                  Icons.gps_fixed_rounded,
                  size: 26,
                  color: Colors.blue[800],
                ),
              ),
              ListTile(
                title: Text(
                  'About Me',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                leading: Icon(Icons.contact_page_rounded),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text(
                  'Logout',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                leading: Icon(Icons.vpn_key_rounded),
                onTap: () {
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
