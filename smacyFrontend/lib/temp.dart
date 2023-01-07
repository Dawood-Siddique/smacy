import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:smacy/VideoPlayer.dart';

void main() {
  runApp(const MaterialApp(
    home: Install(),
  ));
}

class Install extends StatefulWidget {
  const Install({super.key});

  @override
  State<Install> createState() => _InstallState();
}

class _InstallState extends State<Install> {
  //Local variables of classes
  bool loading = false;
  Dio dio = Dio();
  double progress = 0.0;

  Future<bool> saveFile(String url, String fileName) async {
    // 2
    //Function will use to create file and save it in the device
    Directory? directory;
    try {
      if (Platform.isAndroid) {
        if (await _requestPermission(Permission.storage)) {
          directory = (await getExternalStorageDirectory())!;
          print(directory.path);
        } else {}
      } else {}
      // done with platform if statement now time to save file
      var filePath = "${directory!.path}/$fileName";
      File saveFile = File(filePath);
      await dio.download(url, saveFile.path, onReceiveProgress: (recivedBytes, totalBytes) {
        setState(() {
          progress = recivedBytes / totalBytes;
        });
      }, deleteOnError: true).then(
        (_) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const Video()),
          );
        },
      );
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> _requestPermission(Permission permission) async {
    // 3
    //Function will use to check permission of the device
    if (await permission.isGranted) {
      return true;
    } else {
      var result = await permission.request();
      if (result == PermissionStatus.granted) {
        return true;
      } else {
        return false;
      }
    }
  }

  downloadFile() {
    // 1
    // like a main function that will run inside widget to download file as non-sync function
    setState(() {
      loading = true;
    });
    saveFile("https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4", "video.mp4");
    setState(() {
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: loading
              ? const CircularProgressIndicator()
              : ElevatedButton(
                  onPressed: () {
                    downloadFile();
                  },
                  child: const Text("Download"),
                ),
        ),
      ),
    );
  }
}
