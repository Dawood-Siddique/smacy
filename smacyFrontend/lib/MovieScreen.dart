import 'dart:convert';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'home.dart';

void main(List<String> args) {
  runApp(
    MaterialApp(
      home: DownloadPage(
        movieId: 2,
        userId: 26,
      ),
    ),
  );
}

class DownloadPage extends StatefulWidget {
  final int movieId;
  final int userId;
  const DownloadPage({super.key, required this.movieId, required this.userId});
  @override
  State<DownloadPage> createState() => _DownloadPageState();
}

class _DownloadPageState extends State<DownloadPage> {
  bool isVisible = false;
  bool text = false;
  late String baseUrl;
  String MovieTitle = "Nan";
  int ReleaseDate = 0000;
  String Duration = "0h 0m";
  String Description = "";
  double ImdbRating = 0.0;
  int AgeLimit = 0;
  String Genre = "";
  String ImageUrl = "https://images.unsplash.com/photo-1607434472257-d9f8e57a643d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2344&q=80";

  @override
  void initState() {
    // 1
    getUrl(widget.movieId);
    getMovieDetail();
    super.initState();
  }

  void getUrl(int id) {
    // 2
    baseUrl = "http://10.0.2.2:8000/movieDetail/$id/";
  }

  Future<void> getMovieDetail() async {
    // 3
    final response = await http.get(Uri.parse(baseUrl));
    var decodedJson = jsonDecode(response.body);
    if (response.statusCode == 200 && decodedJson.isNotEmpty) {
      MovieTitle = decodedJson['MovieTitle'];
      ReleaseDate = decodedJson['ReleaseDate'];
      Duration = mintToHour(decodedJson['Duration']);
      Description = decodedJson['Description'];
      ImdbRating = decodedJson['ImbdRating'];
      AgeLimit = decodedJson['AgeLimit'];
      Genre = decodedJson['Genre'];
      ImageUrl = decodedJson['Poster'];
      setState(() {});
    } else {
      dialog(decodedJson.keys.first, decodedJson.values.first, response.statusCode);
    }
  }

  String mintToHour(int minutes) {
    // 3a
    int hour = minutes ~/ 60;
    int min = minutes % 60;
    return "${hour}h ${min}m";
  }

  void dialog(String title, String content, int statusCode) {
    // 3b
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
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Home(userId: widget.userId)));
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
          leading: BackButton(color: Colors.white),
          backgroundColor: Colors.transparent,
          elevation: 0.0,
        ),
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Stack(children: [
            Container(
              height: 200,
              margin: EdgeInsets.only(top: 10),
              width: MediaQuery.of(context).size.width,
              child: CachedNetworkImage(
                imageUrl: ImageUrl,
                fit: BoxFit.cover,
                placeholder: (context, url) => CircularProgressIndicator(),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            ),
            Container(
              width: 500,
              height: 210,
              margin: EdgeInsets.only(top: 0),
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                colors: [
                  Colors.black,
                  Colors.black.withOpacity(0.1),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              )),
            ),
            Column(
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(0, 220, 145, 0),
                  // padding: EdgeInsets.only(left: 10),
                  child: Text(
                    MovieTitle,
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 30, fontFamily: 'Archivo'),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      child: Text(
                        ReleaseDate.toString(),
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    SizedBox(width: 5),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(3),
                        color: Colors.grey[800],
                      ),
                      padding: EdgeInsets.all(4),
                      child: Text(
                        AgeLimit.toString() + "+",
                        style: TextStyle(color: Colors.white, fontSize: 13),
                      ),
                    ),
                    SizedBox(width: 5),
                    Container(
                      child: Text(
                        Duration,
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      elevation: 3,
                      side: BorderSide(
                        width: 1,
                      ),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                      padding: EdgeInsets.fromLTRB(140, 10, 140, 10)),
                  onPressed: () {
                    
                  },
                  child: Row(
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      Icon(
                        Icons.download,
                        color: Colors.black,
                        size: 20,
                      ),
                      Text(
                        'Download',
                        style: TextStyle(
                          color: Colors.black87,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Archivo',
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    Description,
                    style: TextStyle(color: Colors.white, fontSize: 12.4, fontWeight: FontWeight.w300),
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  padding: EdgeInsets.all(8.8),
                  child: Row(
                    children: [
                      Text(
                        "Cast: Daniel Craig,Rami...",
                        style: TextStyle(color: Colors.grey[400], fontSize: 15.4, fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                ),
              ],
            )
          ]),
        ));
  }
}
