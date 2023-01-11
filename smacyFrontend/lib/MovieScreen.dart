import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main(List<String> args) {
  runApp(
    MaterialApp(
      home: DownloadPage(
        movieId: 2,
      ),
    ),
  );
}

class DownloadPage extends StatefulWidget {
  final int movieId;
  const DownloadPage({super.key, required this.movieId});
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
  String ImageUrl = "https://drive.google.com/uc?export=download&id=1eqNSloPW5eTMVjAsssviLxjndHvaUzU1";
  late NetworkImage NetworkFetchedImage;
  @override
  void initState() {
    // 1
    getUrl(widget.movieId);
    getMovieDetail();
    fetchImage();
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
      print(decodedJson);
    } else {
      _dialog(decodedJson.keys.first, decodedJson.values.first, response.statusCode);
    }
  }

  String mintToHour(int minutes) {
    // 3a
    int hour = minutes ~/ 60;
    int min = minutes % 60;
    return "${hour}h ${min}m";
  }

  void _dialog(String title, String content, int statusCode) {
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
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }

  void fetchImage() {
    // 4
    setState(() {
      NetworkFetchedImage = NetworkImage(ImageUrl);
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
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkFetchedImage,
                  fit: BoxFit.cover,
                ),
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
                  margin: EdgeInsets.fromLTRB(0, 220, 0, 0),
                  padding: EdgeInsets.only(right: 170),
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
                  onPressed: () {},
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
                  padding: EdgeInsets.only(right: 150),
                  child: Row(
                    children: [
                      Text(
                        "Cast: Daniel Craig,Rami...",
                        style: TextStyle(color: Colors.grey[400], fontSize: 15.4, fontWeight: FontWeight.w400),
                      ),
                      OutlinedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.black,
                            padding: EdgeInsets.fromLTRB(0, 10, 25, 10),
                            side: BorderSide(color: Colors.transparent),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                          ),
                          onPressed: () {
                            setState(() {
                              isVisible = !isVisible;
                              text = !text;
                            });
                          },
                          child: Text(
                            text ? "less" : "more",
                            style: TextStyle(color: Colors.grey),
                          )),
                    ],
                  ),
                ),
                Visibility(
                  visible: isVisible,
                  child: Container(
                      child: Text(
                    "Naomie Harris",
                    style: TextStyle(color: Colors.white),
                  )),
                ),
                SizedBox(height: 5),
                Container(
                    padding: EdgeInsets.only(right: 200),
                    child: Text(
                      "Director: Cary Joji Fukunaga",
                      style: TextStyle(color: Colors.grey[400], fontSize: 15.4, fontWeight: FontWeight.w400),
                    )),
              ],
            )
          ]),
        ));
  }
}
