import 'dart:convert';
import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:smacy/VideoPlayer.dart';


class DownloadScreen extends StatefulWidget {
  int userId;
  int movieId;
  DownloadScreen({super.key, required this.userId, required this.movieId});

  @override
  State<DownloadScreen> createState() => _DownloadScreenState();
}

class _DownloadScreenState extends State<DownloadScreen> {
  List movieList = [];

  @override
  void initState() {
    // 1st
    loadDownloaded();
    super.initState();
  }

  Future<void> loadDownloaded() async {
    // 2nd
    final baseUrl = "http://10.0.2.2:8000/getDownloadedMovie/" + widget.userId.toString() + "/";
    final respose = await http.get(Uri.parse(baseUrl));
    final decodedJson = jsonDecode(respose.body);
    if (respose.statusCode == 200 && decodedJson.isNotEmpty) {
      for (var i = 0; i < decodedJson.length; i++) {
        movieList.add(decodedJson[i]['MovieId']);
      }
    } else {
      dialog(decodedJson.keys.first, decodedJson.values.first, respose.statusCode);
    }
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Download'),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(8.0),
        scrollDirection: Axis.vertical,
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) {
          return DownloadMovie(
            movieId: movieList[index],
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return SizedBox(
            width: 12,
          );
        },
      ),
      backgroundColor: const Color.fromRGBO(11, 26, 13, 1),
    );
  }
}

class DownloadMovie extends StatefulWidget {
  final String movieId;
  const DownloadMovie({super.key, required this.movieId});

  @override
  State<DownloadMovie> createState() => _DownloadMovieState();
}

//
// Container class which will display movie title, poster and click will play movie
class _DownloadMovieState extends State<DownloadMovie> {
  //
  // variable
  String posterPath = '';
  String movieTitle = '';
  String duration = '';
  late File file;
  String ImageUrl = "https://images.unsplash.com/photo-1607434472257-d9f8e57a643d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2344&q=80";
  //
  // methods
  @override
  void initState() {
    //1st method
    super.initState();
    loadMovieDetail();
  }

  Future<void> loadMovieDetail() async {
    //2nd method
    final baseUrl = "http://10.0.2.2:8000/movieDetail/" + widget.movieId + "/";
    final respose = await http.get(Uri.parse(baseUrl));
    final decodedJson = jsonDecode(respose.body);
    if (respose.statusCode == 200 && decodedJson.isNotEmpty) {
      duration = decodedJson['Duration'];
      movieTitle = decodedJson['MovieTitle'];
      ImageUrl = decodedJson['Poster'];
      setState(() {});
    } else {
      dialog(decodedJson.keys.first, decodedJson.values.first, respose.statusCode);
    }
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

  //
  // widgets
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      height: 100,
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Video(
                movieTitle: movieTitle,
              ),
            ),
          );
        },
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Container(
                height: 160,
                width: 115,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: CachedNetworkImage(
                  imageUrl: ImageUrl,
                  fit: BoxFit.cover,
                  placeholder: (context, url) => CircularProgressIndicator(),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      overflow: TextOverflow.ellipsis,
                      movieTitle,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                      maxLines: 1,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      duration,
                      style: TextStyle(color: Color.fromARGB(255, 198, 198, 198), fontSize: 12),
                      textAlign: TextAlign.left,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

// Download Screen
// Seperated
// 

