// ignore_for_file: unused_element, prefer_const_constructors

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:video_player/video_player.dart';

class VideoPlayer extends StatefulWidget {
  const VideoPlayer({super.key});

  @override
  State<VideoPlayer> createState() => _VideoPlayerState();
}

class _VideoPlayerState extends State<VideoPlayer> {
  // Variables
  late VideoPlayerController _controller;
  String videoPath = '';
  late File file;

  // methods and functions
  Future<String> _getFilePath(String filename) async {
    // 3
    final dir = await getExternalStorageDirectory();
    return "${dir!.path}/$filename";
  }

  Future<void> videoPathInit(String filename) async {
    // 2
    final localDir = await _getFilePath(filename);
    setState(() {
      file = File(localDir);
    });
  }

  @override
  void initState() {
    // 1
    super.initState();
    videoPathInit("video.mp4");
    _controller = VideoPlayerController.file(file)
      ..addListener(() {
        setState(() {});
      })
      ..initialize().then((_) {
        _controller.play();
      });

    @override
    void dispose() {
      _controller.dispose();
      super.dispose();
    }
  }

  // Widgets
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
