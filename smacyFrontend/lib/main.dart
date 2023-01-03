import 'package:flutter/material.dart';
import 'package:smacy/Registratrion.dart';
import 'package:smacy/VideoPlayer.dart';
import 'loginform.dart';

void main() {
  runApp(MaterialApp(
    home: const Video(),
    theme: ThemeData(
      scaffoldBackgroundColor: const Color.fromRGBO(11, 26, 13, 1),
      primaryColor: const Color.fromRGBO(173, 225, 0, 1),
    ),
  ));
}
// 173,225,0 as main color
// 11,26,13 as background color

class GetStarted extends StatelessWidget {
  const GetStarted({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('picture/a2.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            width: 500,
            margin: EdgeInsets.only(top: 0),
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
                gradient: LinearGradient(
              colors: [
                Colors.black,
                Colors.black.withOpacity(0.3),
              ],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
            )),
          ),
          SingleChildScrollView(
            
          child:Column(
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(20, 500, 0, 0),
                //color: Colors.amber,
                child: Text(
                  'Watch Movies',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 35,fontFamily: 'Archivo',),
                ),
              ),
              SizedBox(
                height: 1,
              ),
              Container(
                padding: EdgeInsets.fromLTRB(18, 0, 85, 0),
                //color: Colors.red,
                child: Text(
                  'For Free',
                  style: TextStyle(
                      color: Color.fromARGB(255, 127, 232, 28),
                      fontWeight: FontWeight.bold,
                      fontSize: 35,fontFamily: 'Archivo',),
                ),
              ),
            ],
          )),
          Center(
            child:SingleChildScrollView(
              
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    height: 600,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Color.fromARGB(255, 127, 232, 28),
                        elevation: 3,
                        side: BorderSide(
                            width: 1, color: Color.fromARGB(255, 127, 232, 28)),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)),
                        padding: EdgeInsets.fromLTRB(140, 13, 140, 13)),
                    onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => register()));},
                    child: Text(
                      'Get Started',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 19,
                          fontWeight: FontWeight.bold,fontFamily: 'Archivo',),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 80),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Colors.black,
                          elevation: 3,
                          side: BorderSide(
                              width: 1,
                              color: Color.fromARGB(255, 127, 232, 28)),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5)),
                          padding: EdgeInsets.fromLTRB(165, 13, 165, 13)),
                      onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => loginform()));},
                      child: Text(
                        'Login',
                        style: TextStyle(
                            color: Color.fromARGB(255, 127, 232, 28),
                            fontSize: 19,
                            fontWeight: FontWeight.bold,fontFamily: 'Archivo',),
                      ),
                    ),
                  ),
                ]),
          )
      )],
      ),
    );
  }
}
