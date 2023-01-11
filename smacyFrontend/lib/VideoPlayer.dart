// ignore_for_file: file_names, unused_element, avoid_print

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:video_player/video_player.dart';

void main() {
  runApp(const MaterialApp(
    home: Video(),
  ));
}

class Video extends StatefulWidget {
  const Video({super.key});

  @override
  State<Video> createState() => _VideoState();
}

class _VideoState extends State<Video> {
  late VideoPlayerController _controller;
  String videoPath = '';
  late File file;

  Future<String> _getFilePath(String filename) async {
    final dir = await getExternalStorageDirectory();
    return "${dir!.path}/$filename";
  }

  Future<void> videoPathInit() async {
    final localDir = await _getFilePath("video.mp4");
    print(localDir);
    setState(() {
      file = File(localDir);
    });
  }

  @override
  void initState() {
    // 1
    super.initState();
    videoPathInit();
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _controller.value.isInitialized
            ? AspectRatio(
                aspectRatio: _controller.value.aspectRatio,
                child: VideoPlayer(_controller),
              )
            : Container(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _controller.value.isPlaying
                ? _controller.pause()
                : _controller.play();
          });
        },
        child: Icon(
          _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
        ),
      ),
    );
  }
}
