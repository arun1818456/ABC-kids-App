import 'dart:async';

import 'package:abc_kids/Screens/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:video_player/video_player.dart';

class SplashPage extends StatefulWidget {
  static const route = "splash_screen";
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  late VideoPlayerController _controller;
  bool _visible = false;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset("assets/videos/VN20230704_001417.mp4");
    _controller.initialize().then((_) {
      _controller.setLooping(false);
      Timer(Duration(milliseconds: 100), () {
        setState(() {
          _controller.play();
          _visible = true;
        });
      });
    });

    Future.delayed(Duration(seconds: 5), () {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
              builder: (context) => HomeScreen()),
              (e) => false);
    });
  }

  @override
  void dispose() {
    super.dispose();
    if (_controller != null) {
      _controller.dispose();
      _controller.closedCaptionFile;
    }
  }

  _getVideoBackground() {
    return AnimatedOpacity(
      opacity: _visible ? 1.0 : 0.0,
      duration: Duration(seconds: 5),
      child: VideoPlayer(_controller),
    );
  }

  _getBackgroundColor() {
    return Container(color: Colors.transparent //.withAlpha(120),
    );
  }

  _getContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          children: <Widget>[
            _getVideoBackground(),
          ],
        ),
      ),
    );
  }
}
