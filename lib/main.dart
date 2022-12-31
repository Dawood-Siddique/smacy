import 'package:flutter/material.dart';
import 'package:smacy/temp.dart';

void main() {
  runApp(MaterialApp(
    home: const GetStarted(),
    theme: ThemeData(
      scaffoldBackgroundColor: const Color.fromRGBO(11, 26, 13, 1),
      primaryColor: const Color.fromRGBO(173, 225, 0, 1),
    ),
  ));
}
// 173,225,0 as main color
// 11,26,13 as background color

class GetStarted extends StatefulWidget {
  const GetStarted({super.key});

  @override
  State<GetStarted> createState() => _GetStartedState();
}

class _GetStartedState extends State<GetStarted> {
  var outputText = 'tempText';
  var db = Mysql();
  void _getbranch() {
    db.getConnection().then((connec) {
      connec.query('Select city from DreamHome.branch').then((value) {
        for (var row in value) {
          outputText = row[0];
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
              child: Text(
            outputText,
            style: TextStyle(
              backgroundColor: Colors.white,
              fontSize: 50.0,
            ),
          )),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _getbranch();
        },
      ),
    );
  }
}
