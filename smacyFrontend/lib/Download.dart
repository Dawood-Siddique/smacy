import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:smacy/VideoPlayer.dart';

void main() {
  runApp(MaterialApp(
    home: const Download(),
    theme: ThemeData(
      scaffoldBackgroundColor: const Color.fromRGBO(11, 26, 13, 1),
      primaryColor: const Color.fromRGBO(173, 225, 0, 1),
    ),
  ));
}

class Download extends StatefulWidget {
  const Download({super.key});

  @override
  State<Download> createState() => _DownloadState();
}

class _DownloadState extends State<Download> {
  @override
  Widget build(BuildContext context) {
    return Container(child: FloatingActionButton(onPressed: () {
      showDialog(context: context, builder: (context) => const downloadDialog());
    }));
  }
}

class downloadDialog extends StatefulWidget {
  const downloadDialog({super.key});

  @override
  State<downloadDialog> createState() => _downloadDialogState();
}

class _downloadDialogState extends State<downloadDialog> {
  Dio dio = Dio();
  double progress = 0.0;
  void startDownloading() async {
    const String url = 'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4';
    const String fileName = "video.mp4";
    String path = await _getFilePath(fileName);
    print(path);
    await dio.download(
      url,
      path,
      onReceiveProgress: (recivedBytes, totalBytes) {
        setState(() {
          progress = recivedBytes / totalBytes;
        });
      },
      deleteOnError: true,
    ).then((_) {
        Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Video(movieTitle: 'video.mp4')),
      );
    });
  }

  Future<String> _getFilePath(String filename) async {
    final dir = await getApplicationDocumentsDirectory();
    return "${dir.path}/$filename";
  }

  @override
  void initState() {
    super.initState();
    startDownloading();
  }

  @override
  Widget build(BuildContext context) {
    String downloadingprogress = (progress * 100).toInt().toString();

    return AlertDialog(
      backgroundColor: Colors.black,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const CircularProgressIndicator.adaptive(),
          const SizedBox(
            height: 20,
          ),
          Text(
            "Downloading: $downloadingprogress%",
            style: const TextStyle(
              color: Colors.white,
              fontSize: 17,
            ),
          ),
        ],
      ),
    );
  }
}
