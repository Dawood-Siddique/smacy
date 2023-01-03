import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:flick_video_player/flick_video_player.dart';

class Video extends StatefulWidget {
  const Video({super.key});


  @override
  State<Video> createState() => _VideoState();
}

class _VideoState extends State<Video> {
  // late VideoPlayerController _controller;
  // @override
  // void initState() {
  //   super.initState();
  //   _controller = VideoPlayerController.asset('assets/video/1.mp4')
  //     ..initialize().then((_) {
  //       // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
  //       setState(() {});
  //     });
  final FlickManager flickManager = FlickManager(
    videoPlayerController: VideoPlayerController.asset(
    "assets/video/1.mp4"
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
      //   child: _controller.value.isInitialized
      //       ? AspectRatio(
      //           aspectRatio: _controller.value.aspectRatio,
      //           child: VideoPlayer(_controller),
      //         )
      //       : Container(),
      // ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     setState(() {
      //       _controller.value.isPlaying ? _controller.pause() : _controller.play();
      //     });
      //   },
      //   child: Icon(
      //     _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
      //   ),


      child: AspectRatio(aspectRatio: 16/9,
        child: FlickVideoPlayer(flickManager: flickManager),
      ),
      ),
    );
  }

  // @override
  // void dispose() {
  //   super.dispose();
  //   _controller.dispose();
  // }
}
