import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;


class DownloadScreen extends StatefulWidget {
  int userId;
  DownloadScreen({super.key, required this.userId});

  @override
  State<DownloadScreen> createState() => _DownloadScreenState();
}

class _DownloadScreenState extends State<DownloadScreen> {
  void initState() {
    // 1st
    super.initState();
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

          )
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
  final String movieName;
  const DownloadMovie({super.key, required this.movieName});

  @override
  State<DownloadMovie> createState() => _DownloadMovieState();
}

//
// Container class which will display movie title, poster and click will play movie
class _DownloadMovieState extends State<DownloadMovie> {
  //
  // variable
  int movieId = 0;
  String posterPath = '';
  String movieTitle = '';
  late File file;
  Image poster = Image.asset(
    'assets/loading.jpeg',
    width: 200,
    height: 100,
    fit: BoxFit.cover,
  );
  //
  // methods
  @override
  void initState() {
    //1st method
    super.initState();
    loadDownloaded();
  }

  Future<void> loadDownloaded() async {
    //2nd method
    final localPosterPath = await downloadPosterPath(widget.movieName);
    file = File(localPosterPath);
    setState(() {
      poster = Image.file(
        file,
        width: 200,
        height: 100,
        fit: BoxFit.cover,
      );
    });
  }

  Future<String> downloadPosterPath(String name) async {
    //3rd method
    final direc = await getExternalStorageDirectory();
    return "${direc!.path}/$name";
  }

  //
  // widgets
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      height: 100,
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: poster,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    overflow: TextOverflow.ellipsis,
                    "The Umbrella Academy",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                    maxLines: 1,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "movieId",
                    style: TextStyle(color: Color.fromARGB(255, 198, 198, 198), fontSize: 12),
                    textAlign: TextAlign.left,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
