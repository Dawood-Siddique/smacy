import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:ui';
import 'package:http/http.dart' as http;
import 'package:flutter/services.dart';
import 'package:smacy/downloadPage.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'Search.dart';

class Home extends StatefulWidget {
  final int userId;
  const Home({super.key, required this.userId});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
   int currentindex = 0;

  final controller = PageController();
  String Inkwell = "";
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
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
          actions: <Widget>[
            IconButton(
                icon: Icon(Icons.search),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => search()),
                  );
                }),
            IconButton(onPressed: () {}, icon: Icon(Icons.menu))
          ],
        ),
        backgroundColor: Colors.black,
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: SizedBox(
              height: 1000,
              child: Column(children: [
                Expanded(
                    child: Container(
                        margin: EdgeInsets.only(top: 106),
                        child: PageView(
                          controller: controller,
                          children: [
                            Container(
                              padding: EdgeInsets.zero,
                              child: Image(
                                image: AssetImage("picture/spiderman.jpg"),
                                fit: BoxFit.cover,
                              ),
                            ),
                            Container(
                              child: Image(
                                image: AssetImage("picture/1917.jpg"),
                                fit: BoxFit.cover,
                              ),
                            ),
                            Container(
                              child: Image(
                                image: AssetImage("picture/conjuring.jpg"),
                                fit: BoxFit.fill,
                              ),
                            )
                          ],
                        ))),
                Center(
                  child: Container(
                    //color: Colors.white,
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                    margin: EdgeInsets.fromLTRB(0, 5, 0, 0),
                    child: SmoothPageIndicator(
                      controller: controller,
                      count: 3,
                      effect: ExpandingDotsEffect(
                        dotColor: Colors.grey,
                        activeDotColor: Color.fromARGB(255, 127, 232, 28),
                        dotHeight: 8,
                        dotWidth: 8,
                        expansionFactor: 2,
                        spacing: 2.0,
                      ),
                    ),
                  ),
                ),
                Container(
                    padding: EdgeInsets.zero,
                    margin: EdgeInsets.fromLTRB(0, 15, 0, 10),
                    child: Row(
                      children: [
                        Text(
                          "Smacy",
                          style: TextStyle(
                              color: Color.fromARGB(255, 127, 232, 28),
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Barlow'),
                        ),
                        Text("- Action and Adventure",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Barlow')),
                        SizedBox(
                          width: 50,
                        ),
                        Text("See All",
                            style: TextStyle(
                                color: Color.fromARGB(255, 127, 232, 28),
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Barlow')),
                      ],
                    )),
                Container(
                  //color: Colors.white,
                  padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                  child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(children: [
                        Container(
                          child: Material(
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(21))),
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            child: InkWell(
                              customBorder: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(21),
                              ),
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => downloadpage()));
                              },
                              child: Ink.image(
                                image: AssetImage('picture/noTime.jpg'),
                                fit: BoxFit.cover,
                                height: 150,
                                width: 110,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Container(
                          child: Material(
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(21))),
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            child: InkWell(
                              customBorder: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(21),
                              ),
                              onTap: () {},
                              child: Ink.image(
                                image: AssetImage('picture/avng.jpg'),
                                fit: BoxFit.cover,
                                height: 150,
                                width: 110,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Container(
                          child: Material(
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(21))),
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            child: InkWell(
                              customBorder: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(21),
                              ),
                              onTap: () {},
                              child: Ink.image(
                                image: AssetImage('picture/john.jpg'),
                                fit: BoxFit.cover,
                                height: 150,
                                width: 110,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Container(
                          child: Material(
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(21))),
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            child: InkWell(
                              customBorder: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(21),
                              ),
                              onTap: () {},
                              child: Ink.image(
                                image: AssetImage('picture/mission.jpg'),
                                fit: BoxFit.cover,
                                height: 150,
                                width: 110,
                              ),
                            ),
                          ),
                        ),
                      ])),
                ),
                Container(
                    padding: EdgeInsets.all(0),
                    margin: EdgeInsets.fromLTRB(0, 15, 0, 10),
                    child: Row(
                      children: [
                        Text(
                          "Smacy",
                          style: TextStyle(
                              color: Color.fromARGB(255, 127, 232, 28),
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Barlow'),
                        ),
                        Text("- Top Hits",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Barlow')),
                        SizedBox(
                          width: 150,
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            "See All",
                            style: TextStyle(
                                color: Color.fromARGB(255, 127, 232, 28),
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Barlow'),
                          ),
                        ),
                      ],
                    )),
                Container(
                  //color: Colors.white,
                  padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(children: [
                      Container(
                        child: Material(
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(21))),
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          child: InkWell(
                            customBorder: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(21),
                            ),
                            onTap: () {},
                            child: Ink.image(
                              image: AssetImage('picture/maula.jpg'),
                              fit: BoxFit.cover,
                              height: 150,
                              width: 110,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Container(
                        child: Material(
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(21))),
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          child: InkWell(
                            customBorder: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(21),
                            ),
                            onTap: () {},
                            child: Ink.image(
                              image: AssetImage('picture/gang.jpg'),
                              fit: BoxFit.cover,
                              height: 150,
                              width: 110,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Container(
                        child: Material(
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(21))),
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          child: InkWell(
                            customBorder: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(21),
                            ),
                            onTap: () {},
                            child: Ink.image(
                              image: AssetImage('picture/idiots.jpg'),
                              fit: BoxFit.cover,
                              height: 150,
                              width: 110,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Container(
                        child: Material(
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(21))),
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          child: InkWell(
                            customBorder: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(21),
                            ),
                            onTap: () {},
                            child: Ink.image(
                              image: AssetImage('picture/avatar.jpg'),
                              fit: BoxFit.cover,
                              height: 150,
                              width: 110,
                            ),
                          ),
                        ),
                      )
                    ]),
                  ),
                ),
                Container(
                    padding: EdgeInsets.all(0),
                    margin: EdgeInsets.fromLTRB(0, 15, 0, 10),
                    child: Row(
                      children: [
                        Text(
                          "Smacy",
                          style: TextStyle(
                              color: Color.fromARGB(255, 127, 232, 28),
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Barlow'),
                        ),
                        Text("- Thriller",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Barlow')),
                        SizedBox(
                          width: 160,
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            "See All",
                            style: TextStyle(
                                color: Color.fromARGB(255, 127, 232, 28),
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Barlow'),
                          ),
                        ),
                      ],
                    )),
                Container(
                  //color: Colors.white,
                  padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(children: [
                      Container(
                        child: Material(
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(21))),
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          child: InkWell(
                            customBorder: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(21),
                            ),
                            onTap: () {},
                            child: Ink.image(
                              image: AssetImage('picture/maula.jpg'),
                              fit: BoxFit.cover,
                              height: 150,
                              width: 110,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Container(
                        child: Material(
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(21))),
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          child: InkWell(
                            customBorder: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(21),
                            ),
                            onTap: () {},
                            child: Ink.image(
                              image: AssetImage('picture/avng.jpg'),
                              fit: BoxFit.cover,
                              height: 150,
                              width: 110,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Container(
                        child: Material(
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(21))),
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          child: InkWell(
                            customBorder: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(21),
                            ),
                            onTap: () {},
                            child: Ink.image(
                              image: AssetImage('picture/avng.jpg'),
                              fit: BoxFit.cover,
                              height: 150,
                              width: 110,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Container(
                        child: Material(
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(21))),
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          child: InkWell(
                            customBorder: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(21),
                            ),
                            onTap: () {},
                            child: Ink.image(
                              image: AssetImage('picture/john.jpg'),
                              fit: BoxFit.cover,
                              height: 150,
                              width: 110,
                            ),
                          ),
                        ),
                      )
                    ]),
                  ),
                ),
              ]),
            )));
  }
}
