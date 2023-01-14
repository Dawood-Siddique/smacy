import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:smacy/DownloadScreen.dart';
import 'package:http/http.dart' as http;

class Install extends StatefulWidget {
  String fileName;
  int userId;
  int movieId;
  String downloadLink;
  Install({super.key, required this.userId, required this.movieId, required this.fileName, required this.downloadLink});

  @override
  State<Install> createState() => _InstallState();
}

class _InstallState extends State<Install> {
  //Local variables of classes
  bool loading = false;
  Dio dio = Dio();
  double progress = 0.0;
  final baseSaveDownloadUrl = "http://10.0.2.2:8000/userMovieDownload/";

  @override
  initState() {
    //1
    super.initState();
    downloadFile();
  }

  void dialog(String title, String content, int statusCode) {
    // 2b
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(title),
            content: Text(content),
            actions: [
              TextButton(
                child: const Text("OK"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }

  downloadFile() {
    // 2
    // like a main function that will run inside widget to download file as non-sync function
    saveFile(widget.downloadLink, "${widget.fileName}.mp4");
  }

  Future<bool> saveFile(String url, String fileName) async {
    //Function will use to create file and save it in the device
    Directory? directory;
    try {
      if (Platform.isAndroid) {
        if (await _requestPermission(Permission.storage)) {
          directory = (await getExternalStorageDirectory())!;
        } else {}
      } else {}
      // done with platform if statement now time to save file
      var filePath = "${directory!.path}/$fileName";
      File saveFile = File(filePath);
      setState(() {
        loading = true;
      });
      await dio.download(url, saveFile.path, onReceiveProgress: (recivedBytes, totalBytes) {
        setState(() {
          progress = recivedBytes / totalBytes;
        });
      }, deleteOnError: true).then(
        (_) async {
          // Save that user have downloaded specific movie
          var qurey = {
            "MovieId": widget.movieId.toString(),
            "UserId": widget.userId.toString(),
          };
          final respnse = await http.post(Uri.parse(baseSaveDownloadUrl), body: qurey);
          final decodedJsonSave = jsonDecode(respnse.body);
          if (respnse.statusCode != 201) {
            dialog(decodedJsonSave.keys.first, decodedJsonSave.values.first, respnse.statusCode);
          } else {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => DownloadScreen(
                        userId: widget.userId,
                        movieId: widget.movieId,
                      )),
            );
          }
        },
      );
      return true;
    } catch (e) {

      return false;
    }
  }

  Future<bool> _requestPermission(Permission permission) async {
    // 4
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: loading
            ? AlertDialog(
                title: const Text("Downloading"),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    LinearProgressIndicator(
                      value: progress,
                    ),
                    Text("${(progress * 100).toStringAsFixed(0)} %"),
                  ],
                ),
              )
            : Center(
                child: Container(
                  height: 200,
                  width: 200,
                  child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DownloadScreen(
                                      userId: widget.userId,
                                      movieId: widget.movieId,
                                    )));
                      },
                      child: Text("Downloaded")),
                ),
              ),
      ),
    );
  }
}
