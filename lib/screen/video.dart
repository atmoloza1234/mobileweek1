import 'package:better_player/better_player.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class PacVideo extends StatefulWidget {
  const PacVideo({Key? key}) : super(key: key);

  @override
  _PacVideoState createState() => _PacVideoState();
}

class _PacVideoState extends State<PacVideo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Video",
          style: TextStyle(
            fontSize: 22,
            color: Colors.red[600],
          ),
        ),
      ),
      body: Center(
        child: BetterPlayer.network(
          "https://www.learningcontainer.com/wp-content/uploads/2020/05/sample-mp4-file.mp4",
          betterPlayerConfiguration: BetterPlayerConfiguration(
            autoPlay: true,
          ),
        ),
      ),
    );
  }
}
