// ignore_for_file: prefer_const_constructors

import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'dart:ui';
import 'package:smacy/MovieScreen.dart';
import 'package:smacy/widget/poster.dart';

import 'models/movie_model.dart';
import 'package:http/http.dart' as http;

void main(List<String> args) {
  runApp(
    MaterialApp(
      home: Home(
        userId: 2,
      ),
    ),
  );
}

class Home extends StatefulWidget {
  final int userId;

  const Home({super.key, required this.userId});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentindex = 0;
  var posterList = [];
  List<MovieModel>? movieModel;
  List<Map<int, String>> movieList = [];
  @override
  void initState() {
    // 1

    getBaseUrl();

    super.initState();
  }

  Future<void> getBaseUrl() async {
    // 2
    final response =
        await http.get(Uri.parse("http://10.0.2.2:8000/homeMovie/"));
    var decodedJson = jsonDecode(response.body);
    if (response.statusCode == 200 && decodedJson.isNotEmpty) {
      for (var i = 0; i < decodedJson.length; i++) {
        movieList.add({decodedJson[i]['id']: decodedJson[i]['Poster']});
      }
    } else {
      dialog(decodedJson.keys.first, decodedJson.values.first,
          response.statusCode);
    }
    setState(() {});
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

  List imageList = [
    "picture/notime.jpeg",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      extendBody: true,
      appBar: AppBar(
        title: Text("Smacy"),
        automaticallyImplyLeading: false,
        flexibleSpace: ClipRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
            child: Container(
              color: Colors.black.withOpacity(0.5),
            ),
          ),
        ),
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(MdiIcons.searchWeb),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(MdiIcons.menu),
          ),
        ],
      ),
      backgroundColor: Colors.black,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CarouselSlider(
                items: imageList
                    .map((item) => Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              image: AssetImage('$item'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ))
                    .toList(),
                options: CarouselOptions(
                  height: 200.0,
                  enlargeCenterPage: true,
                  autoPlay: false,
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enableInfiniteScroll: true,
                  autoPlayAnimationDuration: Duration(milliseconds: 2200),
                ),
              ),
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 16, horizontal: 8),
                    child: Row(
                      children: [
                        Text(
                          "Smacy - ",
                          style: TextStyle(
                            color: Colors.amber,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          "Action",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                        ),
                        Expanded(
                          child: SizedBox(
                            width: 200,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 150,
                    child: ListView.separated(
                      padding: EdgeInsets.all(4),
                      scrollDirection: Axis.horizontal,
                      itemCount: movieList.length,
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DownloadPage(
                                      movieId: movieList[index].keys.first,
                                      userId: widget.userId)),
                            );
                          },
                          child: Poster(
                            poster: movieList[index].values.first,
                          ),
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return SizedBox(
                          width: 12,
                        );
                      },
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 16, horizontal: 8),
                    child: Row(
                      children: [
                        Text(
                          "Smacy - ",
                          style: TextStyle(
                            color: Colors.amber,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          "Advanture",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                        ),
                        Expanded(
                          child: SizedBox(
                            width: 200,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Text(
                            "See All",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.redAccent,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 150,
                    child: ListView.separated(
                      padding: EdgeInsets.all(4),
                      scrollDirection: Axis.horizontal,
                      itemCount: posterList.length,
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                          onTap: () {},
                          child: Poster(
                            poster: posterList[index],
                          ),
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return SizedBox(
                          width: 12,
                        );
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
