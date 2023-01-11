// ignore_for_file: camel_case_types, use_key_in_widget_constructors, prefer_const_constructors, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class DownloadPage extends StatefulWidget {
  final int movieId;
  const DownloadPage({super.key, required this.movieId});

  @override
  State<DownloadPage> createState() => _DownloadPageState();
}

class _DownloadPageState extends State<DownloadPage> {
  bool isVisible = false;
  bool text = false;

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
          child: Column(children: [
            Container(
              height: 200,
              margin: EdgeInsets.only(top: 10),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('picture/notime.jpeg'),
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
                    'No Time To Die',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                        fontFamily: 'Archivo'),
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
                        "2022",
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
                        "16+",
                        style: TextStyle(color: Colors.white, fontSize: 13),
                      ),
                    ),
                    SizedBox(width: 5),
                    Container(
                      child: Text(
                        "2h 43m",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      elevation: 3,
                      side: BorderSide(
                        width: 1,
                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)),
                      padding: EdgeInsets.fromLTRB(140, 10, 140, 10)),
                  onPressed: () {},
                  child: Center(
                    child: Row(
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        SizedBox(
                          width: 17,
                        ),
                        Icon(
                          MdiIcons.play,
                          color: Colors.black,
                          size: 20,
                        ),
                        Text(
                          'Play',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 19,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Archivo',
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey[850],
                      elevation: 3,
                      side: BorderSide(
                        width: 1,
                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)),
                      padding: EdgeInsets.fromLTRB(140, 10, 140, 10)),
                  onPressed: () {},
                  child: Row(
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      Icon(
                        MdiIcons.download,
                        color: Colors.black,
                        size: 20,
                      ),
                      Text(
                        'Download',
                        style: TextStyle(
                          color: Colors.white,
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
                    "James Bond has left active service. His peace is short-lived when Felix Leiter, an old friend from the CIA, turns up asking for help, leading Bond onto the trail of a mysterious villain armed with dangerous new technology.",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 15.4,
                        fontWeight: FontWeight.w300),
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  padding: EdgeInsets.only(right: 150),
                  child: Row(
                    children: [
                      Text(
                        "Cast: Daniel Craig,Rami...",
                        style: TextStyle(
                            color: Colors.grey[400],
                            fontSize: 15.4,
                            fontWeight: FontWeight.w400),
                      ),
                      OutlinedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black,
                            padding: EdgeInsets.fromLTRB(0, 10, 25, 10),
                            side: BorderSide(color: Colors.transparent),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5)),
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
                      style: TextStyle(
                          color: Colors.grey[400],
                          fontSize: 15.4,
                          fontWeight: FontWeight.w400),
                    )),
              ],
            )
          ]),
        ));
  }
}
