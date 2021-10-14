import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

class PacLocation extends StatefulWidget {
  const PacLocation({Key? key}) : super(key: key);

  @override
  _PacLocationState createState() => _PacLocationState();
}

class _PacLocationState extends State<PacLocation> {
  dynamic latitude = "";
  dynamic longitude = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getLocation();
  }

  Future<void> getLocation() async {
    //ตำสั่งการดึง Location
    var location = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    print(location);
    print(location.latitude);
    print(location.longitude);

    setState(() {
      latitude = '${location.latitude}';
      longitude = '${location.longitude}';
    });

    //การแปลง ละติจูดกับลองจิจูด เป็นสถานที่จริง
    var address = await placemarkFromCoordinates(13.5845974, 100.2291469);

    print(address);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Location",
          style: TextStyle(
            fontSize: 22,
            color: Colors.blue[800],
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "ละติจูด" + latitude,
              style: TextStyle(fontSize: 26),
            ),
            Text(
              "ลองติจูด" + longitude,
              style: TextStyle(fontSize: 26),
            ),
          ],
        ),
      ),
    );
  }
}
